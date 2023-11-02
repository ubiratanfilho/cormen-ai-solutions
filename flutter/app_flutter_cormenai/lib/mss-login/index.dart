import 'dart:io';
import 'package:postgres/postgres.dart';

Future<PostgreSQLConnection> connectToPostgres() async {
  var connection = PostgreSQLConnection(
    'cormen-ai-cormenai.a.aivencloud.com', // host
    11455, // port
    'defaultdb', // database name
    username: 'avnadmin',
    password: 'AVNS_jsfyGjCfNemvcaSX-v-',
    useSSL: true,
  );
  await connection.open();
  return connection;
}

void main() async {
  var connection = await connectToPostgres();
  // Agora você pode usar `connection` para realizar operações no banco de dados
  // Por exemplo, vamos executar uma consulta simples:
  var results = await connection.query('SELECT 1');
  print('Resultado da consulta: $results');
}