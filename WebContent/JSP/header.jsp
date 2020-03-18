<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://fonts.googleapis.com/css?family=Flamenco&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


 
  <link rel="stylesheet" type="text/css" href="..\CSS\header.css">

<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>


jQuery(function(){
  
  $("searchProduct").autocomplete("search.jsp");
  });

</script>

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
 <li><input class="search"  type="text" placeholder="Search" id="searchProduct"></li>
  <li><i class="fa fa-search" style="color:white;  cursor: pointer;"></i></li>
  <li><a href="${pageContext.request.contextPath}/JSP/homepage.jsp" class="btn full_btn " >Home</a></li>
  <li>
  <a href="${pageContext.request.contextPath}/JSP/cart.jsp" class="btn full_btn"><i class="fa fa-shopping-cart" aria-hidden="true"></i>
    <span class="badge">3</span>
  </a>

  </li>
 
 
  <% 

if(session.getAttribute("user")!=null)
{ %>

	 <li><a href="#" class="username btn"  id="afterlogin" ><%= session.getAttribute("user") %></a></li>
	 <li class="dropdown" > <a class=" btn full_btn dropbtn" >More</a>
   
   <div class="dropdown-content">
    <form action="${pageContext.request.contextPath}/JSP/showCustomerProfile.jsp">
    <a><input type="submit" value="Profile" style="border: none; background-color: Transparent;cursor: pointer; "></a>
    </form>
    
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

