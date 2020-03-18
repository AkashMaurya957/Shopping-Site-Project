<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Page</title>
<link rel="stylesheet" type="text/CSS" href="${pageContext.request.contextPath}/CSS/paymentpage.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<% 

String productId=(String)session.getAttribute("productId");
String EmailId=(String)session.getAttribute("Email");

List<ProductBean> list4=ProductDoa.getProductDetails(productId);  
request.setAttribute("list4",list4);  

List<ProductBean> list5=ProductDoa.getTotalProductInCart(EmailId);  
request.setAttribute("list5",list5);  


%>
<header>
<%@include file="normalheader.jsp" %>

</header>
<div class="row">
  <div class="column" >
  <br>
    <h3>Order Summary</h3>
  </div>
  
  <div style="display: flex;width: 100%;margin: 0% 10% ;">

  
  <div class="column2" >
    <h2 style="margin-top:20px;color:white;"><b> Payment Option</b></h2><br><br>
      <a  class="sub" href="#"  > Net Banking</a> <br>
      <a href="#" class="sub">Cash On Delivery</a><br>
     <a href="${pageContext.request.contextPath}/JSP/payment.jsp?product=<%=session.getAttribute("productId") %>" class="sub"> Card payment</a>     <br> 
  </div>
  
  
  
    <div class="container">

     <h2>Price Details</h2>
     <br>
      <c:forEach items="${list5}" var="bean"> 
    <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>${bean.getTotalInCart()}</b></span></h4><br>
      </c:forEach>
      
       <c:forEach items="${list4}" var="bean"> 
   
    <div>
    <p><a href="#"><img src="data:image/jpg;base64,${bean.getImage1()}" height="120px" width="60px"></a> <span class="price">${bean.getPrice()}</span></p><br><br>
        
         </div>
      
         
      <hr><br><br>
       <p>Total <span class="price" style="color:black"><b>${bean.getPrice()}</b></span></p>
       </c:forEach>
      </div>
      </div> 
</div>
<br><br><br>

<%@include file="footer.jsp" %>

</body>
</html>