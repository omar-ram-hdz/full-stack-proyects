"use strict";

const express = require("express"),
  path = require("path"),
  favicon = require("serve-favicon"),
  faviconURL = path.join(__dirname, "public", "img", "paw-face-logo.ico"),
  bodyParser = require("body-parser"),
  morgan = require("morgan"),
  pug = require("pug"),
  routes = require("./routes/router"),
  API = require("./routes/api"),
  publicDir = express.static(path.join(__dirname, "public")),
  viewDir = path.join(__dirname, "views"),
  config = require("./config/server.config.json"),
  app = express();

app.set("views", viewDir);
app.set("view engine", "pug");
app.set("port", config.port);
app.set("hostname", config.hostname);

app.use(favicon(faviconURL));
app.use(morgan("dev"));
app.use(publicDir);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use("/", routes);
app.use("/", API);

module.exports = app;
