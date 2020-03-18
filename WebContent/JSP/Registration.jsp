<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Register to shoppingBazzar</title>

<link rel="stylesheet" type="text/css" href="..\CSS\register.css">
<link href="https://fonts.googleapis.com/css?family=Flamenco&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
 <link rel="stylesheet" rel="..\Bootstrap\bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="..\Bootstrap\bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
</head>
<body>

<header class="siteMenu">

  <nav> 
  
   <div class="row animated slideInDown">
  
   <img src="..\logo\logo.png" class="logo">

   <ul class="siteName">
   <li class="name"><span class="colorChange">shoppingBazzar</span></li>
   </ul>
</div>
 
</nav>

</header>

<form action="../SignUp" class="formDiv" onsubmit="return validation()" name="vform" method="post">
<div class="formdesign animated zoomInLeft">


<img class="backimge animated bounceInLeft" style="animation-delay:1s" src="..\Images\register.jpg">


<div class="formRegister animated bounceInRight" style="animation-delay:1s">
<h2 style="text-align:center;color:#2C7873;">Registration</h2></br>


<div class="input-container">
    <i class="fa fa-user icon" aria-hidden="true"></i>
    <input class="input-field" type="text" placeholder="Username" name="name" id="user" autocomplete="off">
  </div>
  <span id="name_error" class="error_text"></span>


  <div class="input-container">
    <i class="fa fa-envelope icon" aria-hidden="true"></i>
    <input class="input-field zoomInLeft"  placeholder="Email" name="email" id="email"> 
  </div>
  <span id="email_error" class="error_text"></span>


  <div class="input-container">
    <i class="fa fa-mobile icon" aria-hidden="true"></i>
    <input class="input-field"  placeholder="mobile" name="mobileNumber" id="number">
  </div>
  <span id="number_error" class="error_text"></span>
  

  <div class="input-container">
     <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="psw" id="pass">
  </div>
  <span id="password_error" class="error_text"></span>


  <div class="input-container">
     <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Re-Password Enter" name="psw-repeat" id="repass">
  </div>
  <span id="confpass_error" class="error_text"></span>
  

  <div><button type="submit" class="btn btn-success"  onclick="RegisterUser"><b>Register</b> </button></div> 
  <div><a style="color:#2C7873"><br>Already Have a Account ? <a></div>
</div>
</div>

</form>

<script type="text/javascript">

    var username = document.forms["vform"]["user"];
    var useremail = document.forms["vform"]["email"];
    var userNo = document.forms["vform"]["number"];
    var userpass = document.forms["vform"]["pass"];
    var userconfpass = document.forms["vform"]["repass"];

    var name_error = document.getElementById("name_error");
    var number_error = document.getElementById("number_error");
    var email_error = document.getElementById("email_error");
    var password_error = document.getElementById("password_error");
    var confpass_error = document.getElementById("confpass_error");
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;


    username.addEventListener("blur", nameverify, true);
    useremail.addEventListener("blur", emailverify, true);
    userNo.addEventListener("blur", numberverify, true);
    userpass.addEventListener("blur", passwordverify, true);
    userconfpass.addEventListener("blur", confpassverify, true);


    function validation(){

      

    if(username.value==""){
      username.style.border = "2px solid red";
      name_error.textContent = ">>Please fil the username field";
      username.focus();
      return false;
    }
    if((username.value.length <= 2) || (username.value.length > 20)){
      username.style.border = "2px solid red";
      name_error.textContent = ">>User length must be between 2 & 20";
      username.focus();
      return false;
    }
   if(!isNaN(username.value)){
      username.style.border = "2px solid red";
      name_error.textContent = ">>Only characters are allowed";
      username.focus();
      return false;
   }


    if(useremail.value==""){
      useremail.style.border = "2px solid red";
      email_error.textContent = ">>Please fil the username field";
      useremail.focus();
      return false;
    }
    if (!filter.test(useremail.value)) {
      useremail.style.border = "2px solid red";
      email_error.textContent = ">>Please provide a valid email address";
      useremail.focus();
      return false;
    }
   if((useremail.value.charAt(useremail.value.length-4) != '.') && (useremail.value.charAt(useremail.value.length-3) != '.')){
      useremail.style.border = "2px solid red";
      email_error.textContent = ">> . Invalid position";
      useremail.focus();
      return false;
    }



    if(userNo.value==""){
      userNo.style.border = "2px solid red";
      number_error.textContent = ">>Please fil the username field";
      userNo.focus();
      return false;
    }
    if(isNaN(userNo.value)){
      userNo.style.border = "2px solid red";
      number_error.textContent = ">>User must write digits only not char";
      userNo.focus();
      return false;
      }
    if(userNo.value.length !=10){
      userNo.style.border = "2px solid red";
      number_error.textContent = ">>Mobile number must be 10 digits only";
      userNo.focus();
      return false;
      }



    if(userpass.value==""){
      userpass.style.border = "2px solid red";
      password_error.textContent = ">>Please fil the password field";
      userpass.focus();
      return false;
    }
    if((userpass.value.length <= 5) || (userpass.value.length > 30)){
      userpass.style.border = "2px solid red";
      password_error.textContent = ">>Please make strong password";
      userpass.focus();
      return false;
      }


    if(userconfpass.value==""){
      userconfpass.style.border = "2px solid red";
      confpass_error.textContent = ">>Please fil the confirm password";
      userconfpass.focus();
      return false;
    }
    if(userpass.value != userconfpass.value){
      userconfpass.style.border = "2px solid red";
      confpass_error.textContent = ">>Password are not matching";
      userconfpass.focus();
      return false;
      }
    }



    function nameverify() {
      if(username.value !=""){
      username.style.border = "2px solid blue";
      name_error.innerHTML = "";
      return true;
    }
    }
    function emailverify() {
      if(useremail.value !=""){
      useremail.style.border = "2px solid blue";
      email_error.innerHTML = "";
      return true;
    }
    }
    function numberverify() {
      if(userNo.value !=""){
      userNo.style.border = "2px solid blue";
      number_error.innerHTML = "";
      return true;
    }
    }
    function passwordverify() {
      if(password.value !=""){
      password.style.border = "2px solid blue";
      password_error.innerHTML = "";
      return true;
    }
    }
    function confpassverify() {
      if(userconfpass.value !=""){
      userconfpass.style.border = "2px solid blue";
      confpass_error.innerHTML = "";
      return true;
    }
    }

</script>


</body>
</html>
