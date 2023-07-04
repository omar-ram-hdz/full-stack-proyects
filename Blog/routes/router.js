"use strict";
const { log, wrn, er, inf, count } = require("../tools/console");

const express = require("express");

const router1 = require("./index");
const router2 = require("./api");

const mainRouter = express.Router();

// Monta el enrutador1 en '/router1'
mainRouter.use("/", router1);

// Monta el enrutador2 en '/router2'
mainRouter.use("/api", router2);

mainRouter.use((req, res) => {
  res.render("error");
});

module.exports = mainRouter;
