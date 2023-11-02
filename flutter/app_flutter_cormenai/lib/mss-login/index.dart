import 'dart:convert';
import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:postgres/postgres.dart';
import 'package:shelf/shelf_io.dart' as io;

var port = 3002;

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
  var app = Router();

  app.post('/login', (Request request) async {
    var connection = await connectToPostgres();
    var body = await request.readAsString();
    var data = jsonDecode(body);
    var username = data['username'];
    var email = data['email'];
    var password = data['password'];

    if (username == '' || email == '' || password == '') {
      await connection.close();
      return Response(201, body: 'Preencha todos os campos!');
    } else {
      await connection.query(
        'INSERT INTO login (username, email, password) VALUES (@username, @email, @password)',
        substitutionValues: {
          'username': username,
          'email': email,
          'password': password,
        },
      );
      await connection.close();
      return Response(201, body: 'Usuário inserido com sucesso!');
    }
  });

  app.get('/login', (Request request) async {
  var connection = await connectToPostgres();
  var results = await connection.query('SELECT * FROM login');
  await connection.close();

  // Converta os resultados em uma lista de mapas
  var users = results.map((row) => {
    'username': row[0],
    'email': row[1],
    'password': row[2],
  }).toList();

  // Converta a lista de mapas em uma string JSON
  var usersJson = jsonEncode(users);

  return Response.ok(usersJson, headers: {'Content-Type': 'application/json'});
  });
  var server = await io.serve(app, 'localhost', port);
  print('Serving at http://${server.address.host}:${server.port}');
}