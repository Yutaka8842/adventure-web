const message = () => {
  if ( document.getElementById('scroll-message')){
let target = document.getElementById('scroll-message');
target.scrollTop = target.scrollHeight;

  }
}

window.addEventListener("load", message);