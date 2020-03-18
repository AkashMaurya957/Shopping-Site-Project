<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Blob"%>
<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean1"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welome to shopping Bazzar</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/sliderstyle.css">
<link href="https://fonts.googleapis.com/css?family=Flamenco&display=swap" rel="stylesheet">


<title>Welcome to shopping Bazzar</title>

<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>


$(document).ready(function(){
  $("[data-pid]").click(function(){
   
	  var brandname=$(this).data("pid");
	  var catagory=$(this).data("p");
	
    $.post("addToCart.jsp",{name:brandname,category:catagory},function(data){
    	
    	    
    });
    
   });
  
  });

</script>
</head>
<body>

<%

if(session.getAttribute("userAdmin")!=null)
{
	 request.getRequestDispatcher("adminHome.jsp").forward(request, response);  
	  	
}



if(session.getAttribute("userSeller")!=null)
{
	request.getRequestDispatcher("sellerHomepage.jsp").forward(request, response);  
	    	
}


%>

<%@ include file = "../JSP/header.jsp" %>


<% 

session.setAttribute("CurrentPage","JSP/homepage.jsp");

%>

<div>
<!-- Slideshow container -->

<div class="content">
<div  class="catagories">
<ul class="listCat">

<li><a href="#" class="listShow full-list">All Offers</a></li>
<li><a href="${pageContext.request.contextPath}/JSP/showMobile.jsp" class="listShow full-list">Mobile & Tablets</a></li>
<li><a href="#" class="listShow full-list">Electronics</a></li>
<li><a href="#" class="listShow full-list">Computer & Gaming</a></li>
<li><a href="#" class="listShow full-list">Home & Kitchen</a></li>
<br>

<p><b>MORE CATEGORIES</b></p>
<br>

<li><a href="#" class="listShow full-list">Men's Fashion</a></li>
<li><a href="#" class="listShow full-list">Women's Fashion</a></li>
<li><a href="#" class="listShow full-list">Toys,Kids Fashion & more</a></li>
<li><a href="#" class="listShow full-list">Beauty,Health & Daily Needs</a></li>
<li><a href="#" class="listShow full-list">Car & Motorbike</a></li>
</br>
<li  class="moreCategories"><a href="#">&nbsp<b> See All Categories</b></a></li>
</br>
</ul>
</div>


<div class="autoSlide" >

    <img class="slide" id ="slide1" src="${pageContext.request.contextPath}\Images\gadgets.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\woman.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\vinyl-record.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\apparel.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\baked-goods.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\books.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\clothing-store.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\desserts.jpg">
     <img class="slide" src="${pageContext.request.contextPath}\Images\fashion.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\glasses.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\store.jpg">
    <img class="slide" src="${pageContext.request.contextPath}\Images\WhiteDress.jpg">
    
</div>




</div>


<script src=" ${pageContext.request.contextPath}\Js\slider.js"></script>


<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

   

 <%  
 
List<ProductBean> list=ProductDoa.getDataSlider();  
request.setAttribute("list",list);  

%>

<br>

<h2 style="margin-left:50%;">MOBILE TOP DEALS</h2>

<br>

<div class="slideshow-container">




<div class="mySlides fade row">

<div ><a class="prev column" onclick="plusSlides(-1)">&#10095;</a></div>

 <c:forEach items="${list}" var="bean" begin="0" end="3"> 
<div class="column">  


<div class="card">
   <a href="${pageContext.request.contextPath}/JSP/ProductView.jsp?product=${bean.getProductId()}"  target="_blank" style="text-decoration: none;">
<img src="data:image/jpg;base64,${bean.image1}" style="width:40%;height: 200px;">
 
  <h3>${bean.getBrandName()}${bean.model}</h3>
  <br>
  <p class="price">${bean.getPrice()}</p>
    <br>
   
   </a>

  <p><button data-pid="${bean.getProductId()}" data-p="${bean.getCategory()}">Add to Cart</button></p>
  <br>
</div>
</div>
</c:forEach>
    
    
<div><a class="next column" onclick="plusSlides(1)">&#10094;</a></div>
</div>



<div class="mySlides fade row">

<div ><a class="prev column" onclick="plusSlides(-1)">&#10095;</a></div>


 <c:forEach items="${list}" var="bean" begin="4" end="7"> 
 
<div class="column">  
<div class="card">
  <img src="data:image/jpg;base64,${bean.image1}" style="width:40%;height: 200px;">
  <a href="${pageContext.request.contextPath}/JSP/ProductView.jsp?product=${bean.getProductId()}"  target="_blank" style="text-decoration: none;">

  <h3>${bean.getBrandName()}${bean.model}</h3>
  <br>
  <p class="price">${bean.getPrice()}</p>
 
     <br>
  </a>
<p><button data-pid="${bean.getProductId()}" data-p="${bean.getCategory()}">Add to Cart</button></p>
</div>
</div>

</c:forEach>

<div><a class="next column" onclick="plusSlides(1)">&#10094;</a></div>
</div>

</div>



<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>


    
<%@ include file ="footer.jsp" %>


</body>
</html>
