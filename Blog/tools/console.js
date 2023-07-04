"use strict";
class debug {
  log = console.log;
  wrn = console.warn;
  er = console.error;
  inf = console.info;
  count = (cb, task) => {
    console.time(txt);
    cb();
    console.timeEnd(txt);
  };
}

const obj = new debug();

module.exports = obj;
