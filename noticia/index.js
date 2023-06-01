const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
const article = {};
let id = 1;

app.use(bodyParser.json());

// Post the article
app.post('/articles', (req, res) => {
  const { title, content, thumbnail } = req.body;
  article[id] = {id, title, content, thumbnail};
  id++;
  res.status(201).send(article[id - 1]);
});

// Get the article according to the id
app.get('/articles/:id', (req, res) => {
    const { id } = req.params;
    res.status(200).send(article[id]);
});

app.listen(3000, () => {
  console.log('Microservice listening on port 3000');
});