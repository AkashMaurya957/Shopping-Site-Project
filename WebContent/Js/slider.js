
var myIndex = 0;
changeSlides();

function changeSlides() {
  var i;
  var x = document.getElementsByClassName("slide");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(changeSlides, 3000); // Change image every 2 seconds
}


function slideshow(){

var x = document.getElementById("checkId");

if(x.style.display == "none")
{
x.style.display="block";
}
else
{
x.style.display="none";
}
}


