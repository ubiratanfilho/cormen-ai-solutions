import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginTela extends StatelessWidget{
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> checkLogin(String username, String password, BuildContext context) async {
    var url = Uri.parse('http://localhost:32154/login/check');
    var body = jsonEncode({'username': username, 'password': password});
    var response = await http.post(url,
    headers: {"Content-Type": "application/json"},
    body: body
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var responseBody = response.body;

      // Processar os dados recebidos
    if (response.body == 'Login realizado com sucesso!') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login realizado com sucesso!'))
      );
      print('Login realizado com sucesso!');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuário não encontrado.'))
      );
      print('Usuário não encontrado.');
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao realizar login: ${response.statusCode}'))
    );
    print('Erro ao realizar login: ${response.statusCode}');
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
            submitButton(context)
          ],
        ),
      ),
    );
  }

  Widget emailField(){
    return TextField(
      controller: usernameController,
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

  Widget submitButton(BuildContext context){
    return ElevatedButton(
      child: Text('Entrar'),
      onPressed: () {
        checkLogin(usernameController.text, passwordController.text,context);
      },
    );
  }
}