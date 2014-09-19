// friendly console message

// IE needs plaintext, sigh
// window._ie = true;
if (window._ie) {
  console.log("Oh hi there! By all means, poke around.");
  console.log("");
  console.log("If you find a bug or want to talk, we're at 18f@gsa.gov and track issues on https://github.com/18F/18f.gsa.gov/issues");
  console.log("And check us out on GitHub generally! We're an open source team. https://github.com/18F");
}

// otherwise, let's get fancy
else {
  var styles = {
    big: "font-size: 24pt; font-weight: bold; color: #18f",
    medium: "font-size: 10pt",
    medium_bold: "font-size: 10pt; font-weight: bold",
    medium_link: "font-size: 10pt; color: #18f" // works in Firebug, not Chrome
  };
  console.log("%cOh hi there! Please poke around.", styles.big);
  console.log(" ");
  console.log("%cIf you find a bug or want to talk, we're at %c18f@gsa.gov%c and track issues on %chttps://github.com/18f/18f.gsa.gov/issues", styles.medium, styles.medium_bold, styles.medium, styles.medium_link);
  console.log("%cAnd check us out on GitHub generally! We're an %copen source team%c. %chttps://github.com/18f", styles.medium, styles.medium_bold, styles.medium, styles.medium_link);
}


/*
  Browser warning widget, for IE8.
*/
var $buoop = {vs:{i:8,f:10,o:12,s:5}};
  $buoop.ol = window.onload;
  window.onload=function(){
  try {if ($buoop.ol) $buoop.ol();}catch (e) {}
  var e = document.createElement("script");
  e.setAttribute("type", "text/javascript");
  e.setAttribute("src", "//browser-update.org/update.js");
  document.body.appendChild(e);
}

//Initial load of page
window.onload=function() { sizeContent() };

//Every resize of window
$(window).resize(sizeContent);

//Dynamically assign height
function sizeContent() {
    var newHeight = $("#slide").height() - 10 + "px";
    $("#hero").css("height", newHeight);
}
