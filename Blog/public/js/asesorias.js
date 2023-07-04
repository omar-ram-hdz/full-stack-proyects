const d = document,
  w = window;

d.addEventListener("DOMContentLoaded", (e) => {
  if (!localStorage.getItem("sessionId")) location.href = "/login";
});
