import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_tela.dart';

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
      title: Text('Registro',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.login, color: Colors.white),
              Text('Login',
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