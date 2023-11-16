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
        title: Text("CormenAI Solutions",
        style: TextStyle(color: Colors.white, fontSize: 20),),
        backgroundColor: Color.fromARGB(255, 90, 15, 134),  // Altera a cor do AppBar para roxo
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/logo.png'),  // Adiciona o logo ao lado esquerdo do título
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Header();
  }
}