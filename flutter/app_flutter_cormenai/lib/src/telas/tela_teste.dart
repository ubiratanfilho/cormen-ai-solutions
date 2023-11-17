import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'login_tela.dart';
import 'registrar_tela.dart';
import 'registrar_noticias.dart';

class TelaTeste extends StatelessWidget {
  Widget Header() {
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
                        .min, // Faz a Row tão pequena quanto possível
                    children: <Widget>[
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
                          // Adicione a ação do botão 1 aqui
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
                          // Adicione a ação do botão 2 aqui
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrarUsuarioTela()),
                          );
                        },
                      ),
                      SizedBox(width: 20), // Adiciona espaço entre os botões
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
                          // Adicione a ação do botão 3 aqui
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
                          'Entrar',
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
                                builder: (context) => LoginTela()),
                          );
                        },
                      ),
                      SizedBox(height: 20),
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
    );
  }

  Widget Noticias(){
    return Container(
    )
  }

  @override
  Widget build(BuildContext context) {
    return Header();
  }
}
