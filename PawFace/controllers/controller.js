"use strict";
const connection = require("./conection");

const Controller = () => {};

Controller.login = (arr = new Array()) => {
  if (!(arr instanceof Array)) return "error";
  if (arr.length < 7) return "error";
  let params = arr.join(",");
  connection.query(`CALL sp_login(${params},@res); SELECT @res AS res`);
};
Controller.logout = () => {
  connection.query("CALL sp_logout(); SELECT @res AS res");
};
Controller.deleteAcount = () => {
  connection.query("CALL sp_delete_count(); SELECT @res AS res");
};
Controller.getPublications = () => {
  connection.query("CALL sp_get_publications(); SELECT @res AS res");
};
Controller.setPublication = () => {
  connection.query("CALL sp_set_publication(); SELECT @res AS res");
};

module.exports = new Controller();
