"use strict";
const { log, wrn, er, inf, count } = require("../tools/console");

const express = require("express"),
  router = express.Router(),
  path = require("path");

router.get("/", (req, res) => {
  res.render("index");
});
router.get("/programacion", (req, res) => {
  res.render("programacion");
});
router.get("/proyects", (req, res) => {
  res.render("proyects");
});
router.get("/asesorias", (req, res) => {
  res.render("asesorias");
});
router.get("/comments", (req, res) => {
  res.render("comments");
});
router.get("/login", (req, res) => {
  res.render("login");
});
router.get("/ola", (req, res) => {
  res.send("<h1>Holaaa</h1>");
});
router.get("/registro", (req, res) => {
  let correo = req.params.correo,
    nombre = req.params.nombre,
    apellidos = req.params.apellidos,
    pass = req.params.password;
});

module.exports = router;
