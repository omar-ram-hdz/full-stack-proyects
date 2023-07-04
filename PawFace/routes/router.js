"use strict";
const express = require("express"),
  router = express.Router();

const apiRouter = require("./api"),
  mainRouter = require("./main");

router.use("/", mainRouter);
router.use("/api", apiRouter);

module.exports = router;
