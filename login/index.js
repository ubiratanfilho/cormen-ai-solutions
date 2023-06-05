const express = require('express');
const bodyParser = require('body-parser');
const { Client } = require('pg')
const app = express();
const port = 3000;

app.use(bodyParser.json());

// Post the login
app.post('/login',  (req, res) => {
  // conexão com o banco de dados
  // const client = new Client({
  //   host: "localhost",
  //   user: "postgres",
  //   password: "Uj100000",
  //   database: "cormenai",
  //   port: 5432
  // })
  // await client.connect()


  const { name, email, password } = req.body;
  const login = { name, email, password };
  res.status(201).send(login);
});

// Get the login according to the id
app.get('/login/:id', (req, res) => {
  const { id } = req.params;
  res.status(200).send(login[id]);
});

// Verify the login
app.post('/login/verify', (req, res) => {
  const { email, password } = req.body;
  let id = 1;
  let found = false;
  while (id <= Object.keys(login).length && !found) {
    if (login[id].email === email && login[id].password === password) {
      found = true;
    } else {
      id++;
    }
  }
  if (found) {
    res.status(200).send(login[id]);
  } else {  
    res.status(404).send('Not found');
  }
});

app.listen(port, () => {
  console.log(`Microservice listening at http://localhost:${port}`);
});