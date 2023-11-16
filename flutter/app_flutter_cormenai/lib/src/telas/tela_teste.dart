import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:logging/logging.dart';
import 'login_tela.dart';
import 'registrar_tela.dart';
import 'registrar_noticias.dart';

class TelaTeste extends StatelessWidget{

  Widget Header(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 90, 15, 134), 
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.png'), 
        ),
        title: Stack(
  alignment: Alignment.center,  // Centraliza os botões
  children: <Widget>[
    Align(
      alignment: Alignment.centerLeft,
      child: Text("CormenAI Solutions",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
    Row(
      mainAxisSize: MainAxisSize.min,  // Faz a Row tão pequena quanto possível
      children: <Widget>[
        TextButton(
          child: Text(
            'Botão 1', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,  // Altera o tamanho da fonte
              fontFamily: 'Raleway-Light',  // Altera a fonte
            ),
          ),
          onPressed: () {
            // Adicione a ação do botão 1 aqui
          },
        ),
        SizedBox(width: 20),
        TextButton(
          child: Text(
            'Botão 2', 
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,  // Altera o tamanho da fonte
              fontFamily: 'Raleway-Light',  // Altera a fonte
            ),
          ),
          onPressed: () {
            // Adicione a ação do botão 2 aqui
          },
        ),
      ],
    ),
  ],
),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Header();
  }
}