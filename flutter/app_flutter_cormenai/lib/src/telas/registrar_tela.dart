import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'login_tela.dart';
import 'registrar_noticias.dart';
import 'tela_teste.dart';



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
