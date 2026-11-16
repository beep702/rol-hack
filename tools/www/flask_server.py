#!/usr/bin/env python3
"""flask_server.py - Servidor Flask para Rol-Hack"""
from flask import Flask, request, jsonify, Response

app = Flask(__name__)

# Credenciales "secretas" (en un servidor real, vendrían de una BD)
USER = "admin"
PASS = "admin"

@app.route("/")
def home():
    return "<h1>Rol-Hack Flask Lab</h1><p>Servidor Flask funcionando.</p>"

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        user = request.form.get("user", "")
        password = request.form.get("pass", "")
        if user == USER and password == PASS:
            return "<h1>Login OK</h1><p>Bienvenido, admin.</p>"
        else:
            return "<h1>Login FAIL</h1><p>Credenciales incorrectas.</p>", 401
    return """
    <h1>Login</h1>
    <form method="POST">
        <input name="user" placeholder="Usuario"><br>
        <input name="pass" type="password" placeholder="Contrasena"><br>
        <button type="submit">Entrar</button>
    </form>
    """

@app.route("/admin")
def admin():
    auth = request.authorization
    if not auth or auth.username != USER or auth.password != PASS:
        return Response("Auth required", 401, {"WWW-Authenticate": "Basic realm='Rol-Hack'"})
    return "<h1>Admin Panel</h1><p>Solo para admins.</p>"

@app.route("/api/data")
def api_data():
    return jsonify({"lab": "Rol-Hack", "status": "ok", "version": "1.0"})

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=5000, debug=False)
