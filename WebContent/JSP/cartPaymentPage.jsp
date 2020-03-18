<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Page</title>
<link rel="stylesheet" type="text/CSS" href="${pageContext.request.contextPath}/CSS/cartpaymentPage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>


<%@include file="normalheader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 


<%

List<ProductBean> list4 = ProductDoa.getcart();
request.setAttribute("list4", list4);

%>


  <div class="column" >
  <br>
    <h3>Order Summary</h3>
  </div>
  
  
  <div class="column2" style="float: left">
    <h2 style="margin-top:20px;color:white;"><b> Payment Option</b></h2><br><br>
      <a  class="sub" href="#"  > Net Banking</a> <br>
      <a href="#" class="sub">Cash On Delivery</a><br>
     <a href="payment.jsp" class="sub"> Card payment</a>     <br> 
  </div>
  
  <div class="product">
    <div class="container">
     <h2>Price Details</h2>
     <br>
    <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>4</b></span></h4><br>
      
      <c:forEach items="${list4}" var="bean"> 
    <div>
    <p><a href="#"><img src="data:image/jpg;base64,${bean.image1}" height="120px" width="60px"></a> <span class="price">${bean.getPrice()}</span></p><br><br>
       </div>
        </c:forEach>
         
      <hr><br><br>
       <p>Total <span class="price" style="color:black"><b>$30</b></span></p>
      
       </div>
     
       
      </div> 

<br><br><br>

</body>
</html>