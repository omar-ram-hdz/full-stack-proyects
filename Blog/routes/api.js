"use strict";
const express = require("express");
const router = express.Router();
const path = require("path");

router.get("/", (req, res) => {
  res.status(200);
  res.set("Content-Type", "text/html");

  if (req.query.page === "index") {
    return res
      .status(200)
      .sendFile(path.join(__dirname, "../templates/index.html"));
  }

  if (req.query.page === "programacion") {
    return res
      .status(200)
      .sendFile(path.join(__dirname, "../templates/programacion.html"));
  }

  if (req.query.header === "mobile") {
    return res
      .status(200)
      .sendFile(path.join(__dirname, "../templates/header_mobile.html"));
  }

  if (req.query.header === "desktop") {
    return res
      .status(200)
      .sendFile(path.join(__dirname, "../templates/header_desktop.html"));
  }
  if (req.query.header === "gral") {
    return res
      .status(200)
      .sendFile(path.join(__dirname, "../templates/nav_gral_mobile.html"));
  }
  if (req.query.header === "desk") {
    return res
      .status(200)
      .sendFile(path.join(__dirname, "../templates/nav_desk.html"));
  }

  return status(404).end("Error");
});

module.exports = router;
