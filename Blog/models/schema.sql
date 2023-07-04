DROP DATABASE IF EXISTS mipagina;

CREATE DATABASE IF NOT EXISTS mipagina;

USE mipagina;

CREATE TABLE lenguajes(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(40) UNIQUE
)DEFAULT charset=utf8mb4;

CREATE TABLE alumnos(
  correo VARCHAR(60) PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  response VARCHAR(80) NOT NULL,
  contrasenia BLOB
)DEFAULT charset=utf8mb4;

CREATE TABLE asesorias(
  alumno_id VARCHAR(60) UNIQUE,
  fecha DATETIME UNIQUE,
  tema_id INT,
  FOREIGN KEY (alumno_id) REFERENCES alumnos(correo)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (tema_id) REFERENCES lenguajes(id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
)DEFAULT charset=utf8mb4;
