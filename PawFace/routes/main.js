"use strict";
const { log, wrn, er, inf, count } = require("../tools/console");

const express = require("express"),
  router = express.Router();
router.get("/", (req, res) => {
  let locals = {
    title: "PawFace",
    icon: "/img/paw-face-cool-logo.ico",
    styleName: "/css/index.css",
    jsFile: "/js/index.js",
  };
  res.render("index", locals);
});
router.get("/login", (req, res) => {
  let locals = {
    title: "PawFace | LogIn",
    icon: "/img/paw-face-cool-logo.ico",
    styleName: "/css/index.css",
    jsFile: "/js/login.js",
  };
  res.render("login", locals);
});

module.exports = router;
