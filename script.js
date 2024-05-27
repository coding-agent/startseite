document.querySelector("div.article").onmouseover = function (e) {
  const el = e.target
  const child = el.querySelector(".blinking")
  if (child != null) {
    child.style.display = "block"
  }
}

document.querySelector("div.article").onmouseleave = function (e) {
  const el = e.target
  const child = el.querySelector(".blinking")
  if (child != null) {
    child.style.display = "none"
  }
}
