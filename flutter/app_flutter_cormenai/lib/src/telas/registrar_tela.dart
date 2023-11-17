import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_tela.dart';

class RegistrarUsuarioTela extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> registerUser(String username, String email, String password,
      BuildContext context) async {
    var url = Uri.parse('http://localhost:32154/login');
    var body = jsonEncode(
        {'username': username, 'email': email, 'password': password});
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(response.body)));

    // if (response.statusCode == 201) {
    //   var responseBody = response.body;

    //   if (responseBody == 'Usuário inserido com sucesso!') {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Usuário inserido com sucesso!'))
    //     );
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Preencha todos os campos!'))
    //     );
    //   }
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Erro ao inserir usuário: ${response.statusCode}'))
    //   );
    // }
  }

  Widget emailField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
    );
  }

  Widget usernameField() {
    return TextField(
      controller: usernameController,
      decoration: InputDecoration(
        labelText: 'Username',
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      child: Text('Registrar'),
      onPressed: () {
        registerUser(usernameController.text, emailController.text,
            passwordController.text, context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.login, color: Colors.white),
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginTela()),
              );
            },
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            emailField(),
            usernameField(),
            passwordField(),
            submitButton(context)
          ],
        ),
      ),
    );
  }
}
