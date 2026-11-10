#!/bin/sh
# Genera un certificado autofirmado para el proxy (válido 365 días)
# Evita que Git Bash (Windows) convierta "/C=CO/..." en una ruta de Windows
export MSYS_NO_PATHCONV=1
cd "$(dirname "$0")/certs"
openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
  -keyout web.key -out web.crt \
  -subj "/C=CO/O=Laboratorio Seguridad/CN=web.lab.local" \
  -addext "subjectAltName=DNS:web.lab.local,DNS:web,DNS:localhost"
chmod 644 web.key web.crt
openssl x509 -in web.crt -noout -subject -dates
