CREATE TABLE usuarios (
    id      SERIAL PRIMARY KEY,
    usuario TEXT UNIQUE NOT NULL,
    clave   TEXT NOT NULL,          -- en texto plano a propósito (laboratorio)
    nombre  TEXT NOT NULL
);

INSERT INTO usuarios (usuario, clave, nombre) VALUES
  ('ana',   'Ana2026*',   'Ana Pérez'),
  ('luis',  'Luis#4321',  'Luis Gómez'),
  ('admin', 'Admin!2026', 'Administrador');
