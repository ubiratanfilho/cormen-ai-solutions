const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
let id = 1;
const login = {};

app.use(bodyParser.json());

// Post the login
app.post('/login', (req, res) => {
  const { name, email, password } = req.body;
  login[id] = { id, name, email, password };
  id++;
  res.status(201).send(login[id - 1]);
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