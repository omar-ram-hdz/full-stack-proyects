"use strict";
class debug {
  log = console.log;
  wrn = console.warn;
  er = console.error;
  inf = console.info;
  count = (cb, task) => {
    console.time("Inicio de ", task);
    cb();
    console.timeEnd("Fin de ", task);
  };
}

const obj = new debug();

module.exports = obj;
