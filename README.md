# Laboratorio 5 — Seguridad: Patrón de Segmentación de Red

**Arquitectura de Software 2026-II**  
**Universidad Nacional de Colombia — Sede Bogotá**  
**Docente:** Jeisson Andrés Vergara Vargas  

---

## 👥 Equipo 2b

- Santiago Zamora Garzon
- Esteban Andrés Gómez Álvarez
- Jose Arturo Herrera Rivera
- Juan David Suárez Coronado
- Nicole Ariadna Celemin Triana
- José Alejandro Solano Garcés
- Jaisson Andrés Machado Bautista
- **Ángel David Ruiz Barbosa**

---

## 📌 Objetivo del Laboratorio

Demostrar que la segmentación de red limita lo que un atacante puede alcanzar y observar. Se monta la misma aplicación (proxy Nginx, aplicación Flask y base de datos PostgreSQL) en dos topologías con Docker Compose y se compara qué logra un equipo comprometido en cada una:

1. **Red plana:** Todos los contenedores comparten una misma red. El atacante llega directo a la base de datos y lee todo su contenido.
2. **Red segmentada:** Tres zonas aisladas (DMZ, backend y datos). El atacante solo alcanza el proxy público.
3. **Inspección del canal:** Captura y análisis de tráfico de autenticación por HTTP (texto plano) vs. HTTPS (cifrado con TLS/OpenSSL).

---

## 📂 Estructura del Repositorio

```text
.
├── entrega_l5_2b/
│   ├── l5_2b.pdf               # Entregable final del laboratorio
│   ├── l5_2b.md                # Documento fuente en Markdown
│   ├── LEEME.txt               # Descripción rápida del entregable
│   ├── vista-despliegue.mmd    # Diagrama de despliegue en Mermaid
│   ├── vista-despliegue.png    # Imagen de la vista de despliegue
│   └── lab-segmentacion/       # Código fuente y entorno Docker
│       ├── app/                # Aplicación en Flask
│       ├── atacante/           # Contenedor para pruebas de intrusión
│       ├── capturas/           # Capturas de tráfico (.pcap)
│       ├── db/                 # Scripts de inicialización PostgreSQL
│       ├── nginx/              # Configuración de Nginx y certificados TLS
│       ├── docker-compose.yml  # Topología segmentada (DMZ, backend, datos)
│       ├── docker-compose.plano.yml # Topología de red plana (insegura)
│       └── README.md
├── entrega_l5_2b.zip           # Archivo comprimido de la entrega
└── README.md                   # Documentación principal
```

---

## 🚀 Guía Rápida de Ejecución

Dentro de `entrega_l5_2b/lab-segmentacion/`:

1. **Generar certificados TLS:**
   ```bash
   sh nginx/generar-certs.sh
   ```

2. **Desplegar red plana (insegura):**
   ```bash
   docker compose -f docker-compose.plano.yml up -d --build
   ```

3. **Desplegar red segmentada:**
   ```bash
   docker compose up -d --build
   ```

4. **Captura de tráfico:**
   ```bash
   docker compose run --rm sniffer tcpdump -l -i br-dmz -nn -A -s0 'tcp port 80'
   ```

5. **Limpieza de contenedores y volúmenes:**
   ```bash
   docker compose --profile captura down -v --remove-orphans
   docker compose -f docker-compose.plano.yml down -v
   ```
