const express = require('express');
const bodyParser = require('body-parser');
const sqlite3 = require('sqlite3').verbose();
const cors = require('cors');

// Inicializa o aplicativo Express
const app = express();
const db = new sqlite3.Database('./database.db');

// Middleware
app.use(cors());
app.use(bodyParser.json());

// Cria a tabela de pacientes se não existir
db.run(`CREATE TABLE IF NOT EXISTS pacientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    idade INTEGER NOT NULL,
    genero TEXT NOT NULL,
    patologia TEXT NOT NULL
)`);


// Rota para adicionar um novo pacniete
app.post('/pacientes', (req, res) => {
    const { nome, idade, genero, patologia } = req.body;

    if (!nome || !idade || !genero || !patologia) {
        return res.status(400).json({ error: 'Todos os campos são obrigatórios.' });
    }

    const stmt = db.prepare('INSERT INTO pacientes (nome, idade, genero, patologia) VALUES (?, ?, ?, ?)');
    stmt.run(nome, idade, genero, patologia, function(err) {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.status(201).json({ id: this.lastID });
    });
    stmt.finalize();
});

// Rota para listar todos os pacientes
app.get('/pacientes', (req, res) => {
    db.all('SELECT * FROM pacientes', [], (err, rows) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(rows);
    });
});

// Inicia o servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log('Servidor rodando na porta ${PORT}');
});