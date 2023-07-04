"use strict";

const express = require("express"),
  path = require("path"),
  favicon = require("serve-favicon"),
  faviconURL = path.join(__dirname, "public", "img", "bat-icon-color.ico"),
  cons = require("consolidate"),
  bodyParser = require("body-parser"),
  routes = require("./routes/router"),
  morgan = require("morgan"),
  publicDir = express.static(path.join(__dirname, "public")),
  viewDir = path.join(__dirname, "views"),
  config = require("./config/server.config.json"),
  app = express();

app.engine("html", cons.swig);
app.set("views", viewDir);
app.set("view engine", "html");
app.set("port", config.port);
app.set("hostname", config.hostname);

app.use(favicon(faviconURL));
app.use(morgan("dev"));
app.use(publicDir);
app.use(bodyParser.json({ type: "application/*+json" }));
app.use(bodyParser.urlencoded({ extended: false }));
app.use("/", routes);

module.exports = app;
