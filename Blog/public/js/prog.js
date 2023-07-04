const d = document,
  w = window;

document.addEventListener("DOMContentLoaded", async (e) => {
  if (window.innerWidth < 700) {
    axios.get("/api?header=gral").then((res) => {
      setTimeout(() => {
        document.querySelector("#here").outerHTML = res.data;
      }, 5);
    });
  } else {
    axios.get("/api?header=desk").then((res) => {
      setTimeout(() => {
        console.log(res);
        document.querySelector("#here").outerHTML = res.data;
      }, 5);
    });
  }
  setTimeout(() => {
    axios.get("/api?page=programacion").then((res) => {
      d.querySelector("main").innerHTML = res.data;
    });
  }, 10);
});
