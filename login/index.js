const express = require('express');
const bodyParser = require('body-parser');
const { Client } = require('pg');
const app = express();
const port = 3000;

app.use(bodyParser.json());

// Post the login
app.post('/login', async (req, res) => {
  // conexão com o banco de dados
  const client = new Client({
    host: "localhost",
    user: "postgres",
    password: "UJ10000",
    database: "cormenai",
    port: 5432
  })
  await client.connect()

  // requisição
  const { username, email, password } = req.body;
  const login = { username, email, password };
  res.status(201).send(login);

  // inserção no banco de dados
  client.query(`INSERT INTO login (username, email, password) VALUES ('${username}', '${email}', '${password}')`)
  await client.end()
});

// Get the login according to the username
app.get('/login/:username', async (req, res) => {
  const client = new Client({
    host: "localhost",
    user: "postgres",
    password: "UJ10000",
    database: "cormenai",
    port: 5432
  })
  await client.connect()

  const { username } = req.params;

  // consulta no banco de dados
  try {
    const result = await client.query(
      `SELECT * FROM login WHERE username = $1`,
      [username]
    );
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving login from database');
  }

  await client.end()
});

// Verify the login
app.post('/login/verify', async (req, res) => {
  const client = new Client({
    host: "localhost",
    user: "postgres",
    password: "UJ10000",
    database: "cormenai",
    port: 5432
  })
  await client.connect()

  const { email, password } = req.body;
  try{
    const result = await client.query(
      `SELECT count(*) as qtd FROM login WHERE email = $1 AND password = $2`,
      [email, password]
    );
    if (result.rows[0].qtd > 0) {
      res.status(201).send(true);
    }
    else {
      res.status(201).send(false);
    }
  } catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving login from database');
  }
});

app.listen(port, () => {
  console.log(`Microservice listening at http://localhost:${port}`);
});