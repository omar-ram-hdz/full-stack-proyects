"use strict";

const mysql = require("mysql"),
  dbConf = require("../config/database.config.json");
const connection = mysql.createConnection(dbConf);

connection.connect((err) => {
  return err
    ? log(`Error al conectarse a SQL: ${err.stack}`)
    : log(`Conexion establecida con SQL N°: ${connection.threadId}`);
});

module.exports = connection;
