const d = document,
  w = window;

document.addEventListener("DOMContentLoaded", (e) => {
  if (window.innerWidth < 700) {
    axios.get("/api/?header=mobile").then((res) => {
      setTimeout(() => {
        document.querySelector("#here").outerHTMLHTML = res.data;
      }, 70);
    });
  } else {
    axios.get("/api/nav").then((res) => {
      setTimeout(() => {
        document.querySelector("#here").outerHTML = res.data;
      }, 70);
    });
  }
  setTimeout(() => {
    axios.get("//api/?page=disqus").then((res) => {
      console.log(res);
      d.querySelector("#com").outerHTML = res.data;
    });
  }, 80);
});
