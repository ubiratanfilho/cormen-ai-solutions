import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'registrar_tela.dart';

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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.body))
    );
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
        actions: <Widget>[
          TextButton(
            child: Text('Registrar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegistrarUsuarioTela()),
              );
            },
          ),
        ],
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