import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginTela extends StatelessWidget{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> checkLogin(String email, String password) async {
    var url = Uri.parse('http://localhost:3002/login/check');
    var response = await http.post(url, body: {'email': email, 'password': password});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // Processar os dados recebidos
    } else {
      // Tratar o erro
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CormenAI Solutions',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            submitButton()
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'seu@email.com',
        labelText: 'Email',
      )
    );
  }

  Widget passwordField(){
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Senha',
        labelText: 'Senha',
      )
    );
  }

  Widget submitButton(){
    return ElevatedButton(
      child: Text('Entrar'),
      onPressed: () {
        checkLogin(emailController.text, passwordController.text);
      },
    );
  }
}