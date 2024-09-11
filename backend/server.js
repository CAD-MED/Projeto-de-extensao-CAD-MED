const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

// Configuração do middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Configuração do banco de dados SQLite (arquivo físico)
const db = new sqlite3.Database('./banco_de_dados.db');

// Criar a tabela se não existir
db.serialize(() => {
  db.run(`CREATE TABLE IF NOT EXISTS dados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    idade INTEGER,
    sexo TEXT,
    motivoAtendimento TEXT,
    tipoAtendimento TEXT,
    necessitaTransferencia BOOLEAN
  )`);
});

// Create
app.post('/dados', (req, res) => {
  const { nome, idade, sexo, motivoAtendimento, tipoAtendimento, necessitaTransferencia } = req.body;
  const stmt = db.prepare('INSERT INTO dados (nome, idade, sexo, motivoAtendimento, tipoAtendimento, necessitaTransferencia) VALUES (?, ?, ?, ?, ?, ?)');
  stmt.run(nome, idade, sexo, motivoAtendimento, tipoAtendimento, necessitaTransferencia);
  stmt.finalize();
  res.status(201).json({ message: 'Dados salvos com sucesso!' });
});

// Read
app.get('/dados', (req, res) => {
  db.all('SELECT * FROM dados', (err, rows) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(rows);
    }
  });
});

// Update
app.put('/dados/:id', (req, res) => {
  const { id } = req.params;
  const { nome, idade, sexo, motivoAtendimento, tipoAtendimento, necessitaTransferencia } = req.body;
  const stmt = db.prepare('UPDATE dados SET nome = ?, idade = ?, sexo = ?, motivoAtendimento = ?, tipoAtendimento = ?, necessitaTransferencia = ? WHERE id = ?');
  stmt.run(nome, idade, sexo, motivoAtendimento, tipoAtendimento, necessitaTransferencia, id, (err) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: 'Dados atualizados com sucesso!' });
    }
  });
  stmt.finalize();
});

// Delete
app.delete('/dados/:id', (req, res) => {
  const { id } = req.params;
  const stmt = db.prepare('DELETE FROM dados WHERE id = ?');
  stmt.run(id, (err) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json({ message: 'Dados deletados com sucesso!' });
    }
  });
  stmt.finalize();
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});