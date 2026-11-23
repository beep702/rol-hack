#!/usr/bin/env python3
"""vuln_server.py - Servidor Flask con SQLite vulnerable a SQLi (corregido)"""
import sqlite3
from flask import Flask, request

app = Flask(__name__)

def init_db():
    # check_same_thread=False permite usar la conexión desde los hilos de Flask
    conn = sqlite3.connect(':memory:', check_same_thread=False)
    conn.row_factory = sqlite3.Row  # Acceder a columnas por nombre
    c = conn.cursor()
    c.execute('''CREATE TABLE users (id INTEGER PRIMARY KEY, username TEXT, password TEXT)''')
    c.execute("INSERT INTO users (username, password) VALUES ('admin', 'admin123')")
    c.execute("INSERT INTO users (username, password) VALUES ('user', 'user123')")
    conn.commit()
    return conn

conn = init_db()

@app.route("/")
def home():
    return "<h1>Vuln Server</h1><p>Prueba: /login?user=admin&pass=admin123</p>"

@app.route("/login")
def login():
    user = request.args.get("user", "")
    password = request.args.get("pass", "")

    # VULNERABILIDAD REAL: concatenación directa (¡NUNCA hacer esto en producción!)
    query = f"SELECT * FROM users WHERE username = '{user}' AND password = '{password}'"
    print(f"[*] Query: {query}")  # Para depurar en la consola del servidor

    try:
        cursor = conn.cursor()
        cursor.execute(query)
        result = cursor.fetchone()
        if result:
            return f"<h1>Login OK</h1><p>Bienvenido, {result['username']}.</p>"
        else:
            return "<h1>Login FAIL</h1><p>Credenciales incorrectas.</p>"
    except Exception as e:
        return f"<h1>Error SQL</h1><p>{e}</p>"

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5001, debug=False)
