document.querySelectorAll("div.article").forEach((el) => {
  el.parentElement.onmouseover = function (e) {
    const target = e.target
    const child = target.querySelector(".blinking")
    if (child != null) {
      child.style.display = "block"
    }
  }
})

document.querySelectorAll("div.article").forEach((el) => {
  el.parentElement.onmouseleave = function (e) {
    const target = e.target
    const child = target.querySelector(".blinking")
    if (child != null) {
      child.style.display = "none"
    }
  }
})
