import 'package:app_flutter_cormenai/src/telas/registrar_noticias.dart';
import 'package:flutter/material.dart';
import '../src/telas/login_tela.dart';
import '../src/telas/registrar_tela.dart';
import '../src/telas/registrar_noticias.dart';
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
        home: Scaffold(
          body: LoginTela(),
      )
    );
  }
}
