"use strict";
const connection = require("./conexion");

const controller = () => {};
controller.prototype.logIn = (nombre, apellidos, correo, contrasenia) => {
  connection.query(
    `CALL sp_login(${correo},${nombre},${apellidos},${contrasenia}, @res); SELECT @res as Resultado; `,
    (err, res, fields) => {
      if (err) throw err;
    }
  );
};
controller.prototype.logOut = (nombre, correo, contrasenia) => {};
