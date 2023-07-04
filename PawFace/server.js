"use strict";
const { log, wrn, er, inf, count } = require("./tools/console");

const app = require("./app"),
  hostname = app.get("hostname"),
  port = app.get("port");

const server = app.listen(port, hostname, () =>
  log(`Servidor corriendo en: http://${hostname}:${port}`)
);
