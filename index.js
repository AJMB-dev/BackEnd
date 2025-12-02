require('dotenv').config();
const express = require('express');
const mysql = require('mysql2/promise');

const app = express();
app.use(express.json()); // for JSON body parsing

// Create a connection pool
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
});

// Test route
app.get('/users', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT id, email, created_at FROM users');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

// Example insert route
app.post('/users', async (req, res) => {
  const { email, passwordHash } = req.body; // in real life: hash the password on server
  try {
    const [result] = await pool.query(
      'INSERT INTO users (email, password_hash) VALUES (?, ?)',
      [email, passwordHash]
    );
    res.status(201).json({ id: result.insertId, email });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database insert error' });
  }
});

app.listen(3000, () => console.log('Server running on http://localhost:3000'));
