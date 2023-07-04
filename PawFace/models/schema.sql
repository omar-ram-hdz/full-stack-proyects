DROP DATABASE IF EXISTS face;
CREATE DATABASE IF NOT EXISTS face;

USE face;

CREATE TABLE especies(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(40) NOT NULL
)DEFAULT charset=utf8mb4;

CREATE TABLE paises(
  id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(40) NOT NULL
)DEFAULT charset=utf8mb4;

CREATE TABLE users(
  correo VARCHAR(40) PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL,
  apellidos VARCHAR(60) NOT NULL,
  pais_id INT NOT NULL,
  FOREIGN KEY (pais_id) REFERENCES paises(id) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE
)DEFAULT charset=utf8mb4;

CREATE TABLE pets(
  id VARCHAR(25) PRIMARY KEY,
  duenio_id VARCHAR(40) NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  especie_id INT NOT NULL,
  contrasenia BLOB NOT NULL,
  FOREIGN KEY (duenio_id) REFERENCES users(correo) 
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  
  FOREIGN KEY (especie_id) REFERENCES especies(id) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE
)DEFAULT charset=utf8mb4;

CREATE TABLE publications(
  id INT PRIMARY KEY AUTO_INCREMENT,
  mascota_id VARCHAR(25) NOT NULL,
  fecha DATETIME NOT NULL,
  content VARCHAR(250) DEFAULT "false",
  img_url VARCHAR(250) DEFAULT "false",
  FOREIGN KEY (mascota_id) REFERENCES pets(id) 
  ON DELETE CASCADE 
  ON UPDATE CASCADE
)DEFAULT charset=utf8mb4;