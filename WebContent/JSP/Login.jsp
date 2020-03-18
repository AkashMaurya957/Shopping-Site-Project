<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login to shoppingBazzar</title>



 
  <link rel="stylesheet" type="text/css" href="..\CSS\login.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
  <link rel="stylesheet" rel="..\Bootstrap\bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Flamenco&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="..\Bootstrap\bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


</head>
<body>

<header class="siteMenu">

  <nav> 
   <div class="row">
  
   <img src="..\logo\logo.png" class="logo">

   <ul class="siteName">
   <li class="name"><span class="colorChange">shoppingBazzar</span></li>
   </ul>
</div>
 
</nav>

</header>

<form action="${pageContext.request.contextPath}/Login" method="post"  class="formDiv">
<div class="formdesign animated zoomInLeft">


<img class="backimge animated bounceInLeft" style="animation-delay:1s" src="..\Images\login.jpg">


<div class="formRegister animated bounceInRight" style="animation-delay:1s">


  <%
  
  if(session.getAttribute("IncorrectDetailsForLogin")!=null)
  {
  %>
  
  <p style="margin-top:70px;color:red; ">You Enter Incorrect Email or Password</p>
  <%
  }
  %>
  <%
  
  if(session.getAttribute("LoginStatus")!=null)
  {
  %>
  
  <p style="margin-top:70px;color:red; "><%=session.getAttribute("LoginStatus")%></p>
  <%
  }
  %>
  
<h2 style="text-align:center;margin-top:20px;color:#004445;">Login</h2></br>

    <div class="input-container">
    
     <i class="fa fa-envelope icon" aria-hidden="true"></i>
    <input class="input-field zoomInLeft" type="email" placeholder="Email" name="email">
   
    </div>

  

    <div class="input-container">
    
       <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="psw">
  
    </div>
  

   <div><button type="submit" class="btn btn-success"  onclick="RegisterUser"><b>Login</b> </button></div><br>
  <a href="${pageContext.request.contextPath}/JSP/Registration.jsp" style="color:#2C7873; text-decoration: none;">Sign Up</a> 
  <a id="myBtn" style="color:#2C7873;cursor:pointer; text-decoration: none;float: right;">Forget Password?</a>
  
</div>
</div>

</form>


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  
    <span class="close">&times;</span>
    <br>
    
    <form action="${pageContext.request.contextPath}/SendOtp" method="post">
    
    <p style="text-align: center;font-size: 25px;color:#004445;">Enter Email for Reset Password</p>
    <p style="text-align: center;margin-top: 5px;"><input type="email" name="Useremail" style="padding:5px 5px;width: 350px;border-radius: 5px;"></p>
    <br>
    <p style="text-align: center;"><input class="btn" type="submit" value="Reset" style="width: 20%;"></p>
   
   
    </form>
 
  </div>

</div>

<script>
var modal = document.getElementById("myModal");

var btn = document.getElementById("myBtn");

var span = document.getElementsByClassName("close")[0];

btn.onclick = function() {
  modal.style.display = "block";
}

span.onclick = function() {
  modal.style.display = "none";
}

</script>


</body>
</html>
 