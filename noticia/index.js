const express = require('express');
const bodyParser = require('body-parser');
const { Client } = require('pg');
const app = express();
const port = 3000;

app.use(bodyParser.json());

// Post the article
app.post('/articles', async (req, res) => {
  // conexão com o banco de dados
  const client = new Client({
    host: "localhost",
    user: "postgres",
    password: "UJ10000",
    database: "cormenai",
    port: 5432
  })
  await client.connect()

  const { title, content, thumbnail } = req.body;
  const article = { title, content, thumbnail };

  // inserção no banco de dados
  client.query(`INSERT INTO noticias (title, content, thumbnail) VALUES ('${title}', '${content}', '${thumbnail}')`)
  await client.end()

  res.status(201).send(article);
});

// Get the article according to the id
app.get('/articles/:id', async (req, res) => {
  const client = new Client({
    host: "localhost",
    user: "postgres",
    password: "UJ10000",
    database: "cormenai",
    port: 5432
  })
  await client.connect()

  const { id } = req.params;

  // consulta no banco de dados
  try {
    const result = await client.query(
      `SELECT * FROM noticias WHERE id = $1`,
      [id]
    );
    res.json(result.rows);
  }
  catch (err) {
    console.error(err);
    res.status(500).send('Error retrieving article from database');
  }
});

app.listen(port, () => {
  console.log('Microservice listening on port 3000');
});