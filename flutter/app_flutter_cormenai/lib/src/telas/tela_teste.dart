import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'login_tela.dart';
import 'registrar_tela.dart';
import 'registrar_noticias.dart';

class TelaTeste extends StatelessWidget {
  Future<List<dynamic>> fetchNoticias() async {
    final response =
        await http.get(Uri.parse('http://localhost:31507/noticias'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load noticias');
    }
  }

  Widget Noticias(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 1; i <= 3; i++)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // Define a largura do Container para 90% da largura da tela
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors
                      .grey[200], // Define a cor de fundo para cinza claro
                  borderRadius:
                      BorderRadius.circular(10), // Arredonda as bordas
                ),
                child: Text(
                  'Notícia $i',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 15, 134),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.png'),
        ),
        title: Stack(
          alignment: Alignment.center, // Centraliza os botões
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CormenAI Solutions",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 600) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextButton(
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Raleway-Light',
                          ),
                        ),
                        onPressed: () {
                          // Adicione a ação do botão 1 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TelaTeste()),
                          );
                        },
                      ),
                      SizedBox(width: 20), // Adiciona espaço entre os botões
                      TextButton(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Altera o tamanho da fonte
                            fontFamily: 'Raleway-Light', // Altera a fonte
                          ),
                        ),
                        onPressed: () {
                          // Adicione a ação do botão 2 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginTela()),
                          );
                        },
                      ),
                      SizedBox(width: 20), // Adiciona espaço entre os botões
                      TextButton(
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Altera o tamanho da fonte
                            fontFamily: 'Raleway-Light', // Altera a fonte
                          ),
                        ),
                        onPressed: () {
                          // Adicione a ação do botão 3 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrarUsuarioTela()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Publicar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16, // Altera o tamanho da fonte
                            fontFamily: 'Raleway-Light', // Altera a fonte
                          ),
                        ),
                        onPressed: () {
                          // Adicione a ação do botão 1 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrarNoticiasTela()),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextButton(
                        child: Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Raleway-Light',
                          ),
                        ),
                        onPressed: () {
                          // Adicione a ação do botão 1 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TelaTeste()),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Raleway-Light',
                          ),
                        ),
                        onPressed: () {
                          // Adicione a ação do botão 2 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginTela()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Raleway-Light',
                          ),
                        ),
                        onPressed: () {
                          // Adicione a ação do botão 2 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrarUsuarioTela()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text(
                          'Publicar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'Raleway-Light',
                          ),
                        ),
                        onPressed: () {
                          // Adicione a ação do botão 2 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrarNoticiasTela()),
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
      // Escreva um titulo e subtitulo no corpo da pagina, em seguida, coloque as noticias
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              // Adiciona o widget Center
              child: Text(
                'Tecnologia do futuro para problemas do presente',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Alinha o texto no centro
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              // Adiciona o widget Center
              child: Text(
                'Consultoria especializada na entrega de soluções de Inteligência Artificial, renomada e capacitada nas mais diferentes indústrias. Nós desenvolvemos produtos capazes de aumentar a produtividade e reduzir custos, automatizando processos e gerando insights por muitos inimagináveis.',
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center, // Alinha o texto no centro
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              // Adiciona o widget Center
              child: Text(
                'Notícias',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Alinha o texto no centro
              ),
            ),
          ),
          FutureBuilder<List<dynamic>>(
            future: fetchNoticias(),
            builder:
                (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0.01,
                        MediaQuery.of(context).size.width * 0.01,
                        10,
                        0),
                    child: Column(
                      children: snapshot.data?.expand((noticia) {
                            return [
                              Text(
                                noticia['title'] ?? '',
                                style: TextStyle(fontSize: 30),
                              ),
                              if (noticia['thumbnail'] != null)
                                Container(
                                  height: 100, 
                                  width: 100, 
                                  child: Image.network(noticia['thumbnail']),
                                ),
                              Text(
                                noticia['content'] ?? '',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height:
                                    20, 
                              ),
                            ];
                          }).toList() ??
                          [],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
