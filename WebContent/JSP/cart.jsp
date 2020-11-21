<%@page import="java.util.ArrayList"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/cart.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>

$(document).ready(function(){
	  $("[data-pid]").click(function(){
	   
		  var productID=$(this).data("pid");
		 
		
	    $.post("${pageContext.request.contextPath}/Cart",{name:productID},function(data){
	    	location.reload();	
	    	    
	    });
	    
	   });
	  
	  });



</script>


</head>
<body>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ include file = "../JSP/header.jsp" %>

<%

String email =(String)session.getAttribute("Email");
List<ProductBean> list4 = ProductDoa.getcart(email);
request.setAttribute("list4", list4);

		    
   	
%>

 <c:if test="${!empty list4}">
 
<div class="cartMainDiv">


<hr>
<br>
<p class="cartName">My Cart</p>
<br>

<hr>

<br>
<c:forEach items="${list4}" var="bean"> 
<div class="cartItem" style="display: flex;">

<img src="data:image/jpg;base64,${bean.image1}" height="120px" width="60px">
&nbsp&nbsp&nbsp&nbsp&nbsp

<div>
<h3>${bean.getBrandName()}&nbsp${bean.getModel()}</h3> 
<input type="text" id="quantity">&nbsp&#10006;&nbsp <label>${bean.getPrice()}</label><br><br>
<span>IN STOCK</span>
</div>

<div class="price" style="display:flex;">


<p class="priceProduct">${bean.getPrice()}</p>&nbsp<i data-pid="${bean.getProductId()}" class="fa fa-times-circle" id="cross" aria-hidden="true"></i>


</div>
</div>
<br>
<hr>
<br>
</c:forEach>
<br>

<br>
<a class="continuebtn" href="cartPaymentPage.jsp">Continue Shopping &#10095</a>
</div>

</c:if>


 <c:if test="${empty list4}">
 
  
<div class="cartMainDiv" style="text-align: center;color:grey;">


 <b style="font-size: 30px;">YOU NOT ADD ITEM YET</b>
      <br><br><br>
      <i class="fas fa-user-friends fa-7x"></i>
      
      
      
</div>
 </c:if>

</body>
</html>