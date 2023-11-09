import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:logging/logging.dart';



class TelaInicial extends StatelessWidget {
  final Logger _logger = Logger('TelaInicial');

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
    return FutureBuilder<List<dynamic>>(
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
    );

  }
}