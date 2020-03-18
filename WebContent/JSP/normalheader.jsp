<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://fonts.googleapis.com/css?family=Flamenco&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>

*{
  margin:0px;
  padding:0px;
   box-sizing: border-box;
}
body{
   
   background-color:#F5F5F5;
 
   }


.siteMenu{
 
    top:0;
    background-color:#2C7873;
    height:80px;
    width:100%;
    
}


.siteName{

float:left;
margin-top:15px;

}

.siteName li{
   font-size:30px;
   color:white;
    margin-left:10px;
   list-style:none;
}

.colorChange{
animation:colorChange 1s infinite;
}

@keyframes colorChange{
0%{color:white;}
25%{color:#004445;}
50%{color:#6FB98F;}
100%{color:#66A5AD;}
}


.logo{
    height:50px;
    width:auto;
    float:left;
    margin:10px;
 }

.search{


   padding:10px 30px;
  
   border:1px solid white;
   text-decoration:none;
   border-radius:200px;

}

.searchbutton{

display: flex;
}

.main-nav{
     float:right;
     margin-top:5x;
    
}

.main-nav li{
   display:inline-block;
   list-style:none;
   margin-left:10px;
}

.btn{
   display:inline-block;
   margin:20px 10px;
   font-weight:100;
   text-decoration:none;
   border-radius:200px;
   padding:10px 20px;
  
   
   transition:background-color 0.2s,border 0.2s,color 0.2s;
}

.full_btn{

 background-color:transparent;
    color:white;
   border-style:1px solid white;
}

.full_btn:hover{
   background-color:#C4DFE6;

}
.username{
background-color:transparent;
    color:white;

}


/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}


.username:hover{
background-color:#C4DFE6;

}

.dropbtn {
  background-color: transparent;
  color: white;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
 display: none;
  position: absolute; 
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #66A5AD;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #C4DFE6;}

button {
  float: left;
  width: 20%;
  padding: 10px;
  background:white;
  color: #F5F5F5;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

.mobile-icon-bar{
display:none;
}
</style>
</head>
<body>



<div class="siteMenu clearfix">

  <nav> 
   <div class="row animated slideInDown">
  
   <img src="${pageContext.request.contextPath}\logo\logo.png" class="logo">
   
   <ul class="siteName">
   <li class="name"><span class="colorChange" style="font-family: 'Flamenco', cursive;">shoppingBazzar</span></li>
   </ul>
   
  <ul  class="main-nav clearfix pull-right" id="checkId" >
  <li><a href="homepage.jsp" class="btn full_btn " >Home</a></li>
  <li><a href="cart.jsp" class="btn full_btn">Cart</a></li>
 
  <% 

if(session.getAttribute("user")!=null)
{ %>

	 <li><a href="#" class="username btn"  id="afterlogin" ><%= session.getAttribute("user") %></a></li>
	 <li class="dropdown" > <a class=" btn full_btn dropbtn" >More</a>
   
   <div class="dropdown-content">
    <a href="#"><input type="submit" value="Profile" style="border: none; background-color: Transparent;cursor: pointer; "></a>
    <form action="${pageContext.request.contextPath}/Logout">
    <a><input type="submit" value="Logout" style="border: none; background-color: Transparent;cursor: pointer; "></a>
    </form>
    <a href="#"><input type="submit" value="About" style="border: none; background-color: Transparent;cursor: pointer; "></a>
  </div>
   </li>

	 
<% 	   	
}
if(session.getAttribute("user") == null){%>

<li><a href="${pageContext.request.contextPath}/JSP/Login.jsp" class="btn full_btn"  id="login">Login</a></li>
	
	<%   	
	
}
%> 
   
   
    </ul>

  <a href="#" class="mobile-icon-bar"  onclick="slideshow()"><i class="fa fa-bars"></i> </a>
  </div>
  
</nav>

</div>

</body>
</html>

