import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_tela.dart';
import 'tela_teste.dart';
import 'registrar_tela.dart';


class RegistrarNoticiasTela extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  Future<void> registerNoticia(String title, String content, String thumbnail, BuildContext context) async {
    var url = Uri.parse('http://localhost:31507/noticias');
    var body = jsonEncode({'title': title, 'content': content, 'thumbnail': thumbnail});
    var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.body))
    );
  }

  Widget titleField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Title',
      ),
    );
  }

  Widget contentField() {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(
        labelText: 'Content',
      ),
    );
  }

  Widget thumbnailField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Thumbnail',
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      child: Text('Registrar Noticias'),
      onPressed: () {
        registerNoticia(usernameController.text, emailController.text, passwordController.text, context);
      },
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
                      mainAxisSize: MainAxisSize
                          .min, 
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
                                  builder: (context) =>
                                      RegistrarUsuarioTela()),
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
                                  builder: (context) =>
                                      RegistrarUsuarioTela()),
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
                                  builder: (context) =>
                                      RegistrarNoticiasTela()),
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
    body: Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          titleField(),
          contentField(),
          thumbnailField(),
          submitButton(context)
        ],
      ),
    ),
  );
}
}