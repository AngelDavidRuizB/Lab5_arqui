import os
import psycopg
from flask import Flask, request

app = Flask(__name__)
DSN = os.environ["DATABASE_URL"]

FORM = """<h2>Tienda del laboratorio</h2>
<form method="post" action="/login">
  Usuario <input name="usuario"> Clave <input name="clave" type="password">
  <button>Entrar</button>
</form>"""


@app.get("/")
def inicio():
    return FORM


@app.post("/login")
def login():
    usuario = request.form.get("usuario", "")
    clave = request.form.get("clave", "")
    with psycopg.connect(DSN) as conn:
        fila = conn.execute(
            "SELECT nombre FROM usuarios WHERE usuario = %s AND clave = %s",
            (usuario, clave),
        ).fetchone()
    if fila:
        return f"Bienvenida, {fila[0]}\n"
    return "Usuario o clave incorrectos\n", 401
