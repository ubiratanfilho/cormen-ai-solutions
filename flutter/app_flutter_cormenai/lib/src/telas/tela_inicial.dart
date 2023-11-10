import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'login_tela.dart';
import 'registrar_tela.dart';
import 'registrar_noticias.dart';




class TelaInicial extends StatelessWidget {
  final Logger _logger = Logger('CormenAI Solutions');

  TelaInicial({Key? key}) : super(key: key);

  Future<List<dynamic>> fetchNoticias() async {
    final response = await http.get(Uri.parse('http://localhost:31507/noticias'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load noticias');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Tela Inicial'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.pageview),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginTela()),  // Substitua Pagina1 pela sua classe de página
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.navigate_next),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegistrarUsuarioTela()),  // Substitua Pagina2 pela sua classe de página
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.navigate_next),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegistrarNoticiasTela()),  // Substitua Pagina2 pela sua classe de página
            );
          },
        ),
      ],
    ),   
    body: FutureBuilder<List<dynamic>>(
      future: fetchNoticias(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              var noticia = snapshot.data?[index];
              return ListTile(
                leading: noticia?['thumbnail'] != null 
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/loading.gif',  // Substitua por sua própria imagem de carregamento
                      image: noticia?['thumbnail'],
                    )
                  : null,
                title: Text(noticia?['title'] ?? ''),
                subtitle: Text(noticia?['content'] ?? ''),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else {
          return CircularProgressIndicator();
        }
      },
      ),
    ); 
  }
}