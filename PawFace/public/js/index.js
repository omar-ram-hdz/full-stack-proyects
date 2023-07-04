import detectSession from "/js/modules/session_detecter.js";
const d = document;
d.addEventListener("DOMContentLoaded", (e) => {
  detectSession("session_id", "login");
});
