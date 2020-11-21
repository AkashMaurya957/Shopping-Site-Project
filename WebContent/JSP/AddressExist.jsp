<%@page import="com.shoppingsite.productupload.bean.UserDetails"%>
<%@page import="com.shoppingsiteproductupload.dao.CustomerInfoDao"%>
<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/adressexist.css">
</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ include file = "../JSP/normalheader.jsp" %>
<%


String product =(String)session.getAttribute("product");
String customer  = (String)session.getAttribute("email");
String PaymentMode=(String)session.getAttribute("PaymentMode");
String paid=(String)session.getAttribute("Status");
String Quantity = (String)session.getAttribute("Quantity");

System.out.print(product);
System.out.print(customer);
System.out.print(PaymentMode);
System.out.print(paid);


List<ProductBean> bean=ProductDoa.getProductDetails(product);
  
request.setAttribute("list",bean);

List<UserDetails> list1=CustomerInfoDao.getUserDetails(customer);
request.setAttribute("list1",list1); 
%>
<br>

<div class="row">

  <div class="column left">
    <div class="row2">
   
    
    <div class="innercol">
    <c:forEach items="${list1}" var="bean"> 
     <p><b>Shipping Address</b><a href="JSP/getAddress.jsp" class="ChangeAddress">&nbspChange</a></p>
     <br>
     <p class="cust"><c:out value="${bean.getFullName()}"/></p>
     <p class="cust"><c:out value="${bean.getHno()}"/></p>
     
     <p class="cust"><c:out value="${bean.getLandmark()}"/></p>
    <p class="cust"><c:out value="${bean.getCity()}"/> ,&nbsp<c:out value="${bean.getCountry()}"/> <c:out value="${bean.getState()}"/> &nbsp </p>
    <p class="cust"><c:out value="${bean.getPincode()}"/></p>
    <p class="cust">Phone:<c:out value="${bean.getMobilenumber()}"/></p>
     </c:forEach>		
     </div>
    
     <div class="innercol">
    <p class="cust">Mode of Payment : <%=PaymentMode %></p>
    <br>
    <p style="color:green;">Status :<%=paid %></p>
    </div>
    
    
    
    </div>
    
<div class="productdisp" style="display:flex;">
    <c:forEach items="${list}" var="bean"> 
    <div>
    <img src="data:image/jpg;base64,${bean.image1}" style="width:100px;height:150px;"/>
    </div>
    <div class="showdescription">
   
    <b class="cust1">&nbsp&nbsp&nbsp${bean.getModel()}&nbsp${bean.getPrice()}&nbsp(${bean.getColor()},&nbsp${bean.getRam()},&nbsp${bean.getInternalMemory()})</b>
    <p class="cust">&nbsp&nbsp Price : ${bean.getPrice()}</p>
    </div>
      </c:forEach>
    </div>    
    
  </div>
  
  <div class="column right" >
  
  <form action="PlaceOrder" method="post">
  <input  type="submit" class="sub" value="Place Your Order">
  <br><br>
  <div style="width: 100%;">
  <c:forEach items="${list}" var="bean"> 
  <div  style="float:left;">
  <span class="placeBox">Price</span><span class="placeBox"></span>
  <br><br>
  <p style="color:white;">${bean.getPrice()}</p>
  </div>
  
  <div  style="float: right;">
  <span  class="placeBox">Quantity </span>
  <br><br>
  <p style="color:white;"><%=Quantity%></p>
  </div>
  </c:forEach>
  </div>
  <p style="color:white;"></p>
  </form>
  </div>

  </div>
  <br>
  

    
</body>
</html>

    