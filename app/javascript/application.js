// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

// -----------------------------------------Formulaire Events New-------------------------------------------------------



var currentTab = 0;
document.addEventListener("turbo:load", function(event) {
  showTab(currentTab);
});

function showTab(n) {
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";

  if (n == 0) {
  document.getElementById("prevBtn").style.display = "none";
  } else {
  document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
  document.getElementById("nextBtn").innerHTML = '<i class="fa fa-angle-double-right"></i>';
  } else {
  document.getElementById("nextBtn").innerHTML = '<i class="fa fa-angle-double-right"></i>';
  }
  fixStepIndicator(n)
}

function nextPrev(n) {
  var x = document.getElementsByClassName("tab");

  if (n == 1 && !validateForm()) return false;

  x[currentTab].style.display = "none";
  currentTab = currentTab + n;

  if (currentTab >= (x.length -1)) {

  document.getElementById("nextprevious").style.display = "none";
  document.getElementById("all-steps").style.display = "none";
  document.getElementById("register").style.display = "none";
  // document.getElementById("text-message").style.display = "block";
  document.getElementById("nextBtn").classList.add("d-none");
  document.getElementById("lastBtn").classList.remove("d-none");
  }
  showTab(currentTab);
}

function validateForm() {
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  for (i = 0; i < y.length; i++) {
    if (y[i].value == "") {
        y[i].className += " invalid";
        valid = false;
    }
  }
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid;
}

function fixStepIndicator(n) {
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  x[n].className += " active";
}

global.nextPrev = nextPrev

// ------------------------------------Nav-bar d-none when use phone----------------------------------------------------


let navBar = document.getElementById("nav-d-none");
let input = document.getElementById("event_title");

input.addEventListener("click", () => {
  document.getElementById("nav-d-none").classList.toggle("d-none");
});

// ---------------------------------------------------------------------------------------------------------------------
