const d = document,
  w = window;

document.addEventListener("DOMContentLoaded", (e) => {
  if (window.innerWidth < 700) {
    axios.get("/api?header=mobile").then((res) => {
      setTimeout(() => {
        d.querySelector("#here").outerHTML = res.data;
      }, 5);
    });
  } else {
    axios.get("/api?header=desktop").then((res) => {
      setTimeout(() => {
        d.querySelector("#here").outerHTML = res.data;
      }, 5);
    });
  }
  setTimeout(() => {
    axios.get("/api?page=index").then((res) => {
      d.querySelector("main").innerHTML = res.data;
    });
  }, 5);
});