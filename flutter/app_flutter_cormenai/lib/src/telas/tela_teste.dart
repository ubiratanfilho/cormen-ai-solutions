import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'login_tela.dart';
import 'registrar_tela.dart';
import 'registrar_noticias.dart';

class TelaTeste extends StatelessWidget {
  Widget Noticias(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 1; i <= 3; i++)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,  // Define a largura do Container para 90% da largura da tela
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],  // Define a cor de fundo para cinza claro
                  borderRadius: BorderRadius.circular(10),  // Arredonda as bordas
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
                                  builder: (context) =>
                                      RegistrarNoticiasTela()),
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
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(35),
              color: const Color.fromARGB(
                  100, 92, 92, 92), // Define a cor de fundo para cinza claro
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 800,
                  padding: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 51, 51, 51),
                      borderRadius: BorderRadius.circular(20)),
                  child: Noticias(context),
                ),
              ),
            ),
          ),
        ));
  }
}
