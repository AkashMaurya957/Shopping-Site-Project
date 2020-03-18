<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/shippingaddress.css">

<title>Insert title here</title>
</head>
<body>
<%@ include file = "../JSP/normalheader.jsp" %>

<%

String id=request.getParameter("poductid"); 
System.out.print(id);

%>
<br>
<br>
<form action="${pageContext.request.contextPath}/ShippingAddress" method="post">
<div class="button button1 borderstyle" style="background: white;">
<h2 class="lab" style="text-align: center;">Add Address for Shipping</h2>
<br>
<p class="lab" >Full Name</p>
<input type="text" name="name" autofocus>
<p class="lab">Mobile Number</p>
<input type="text" name="mbno">
<p class="lab">Pincode:</p>
<input type="text" name="pincode">
<p class="lab">Flat, House no., Building, Company, Apartment: </p>
<input type="text" name="hno">
<p class="lab">Area, Colony, Street, Sector, Village:</p>
<input type="text" name="sector">
<p class="lab">Landmark e.g. near apollo hospital: </p>
<input type="text" name="landmark">
<p class="lab">Town/City: </p>
<input type="text" name="city">
<p class="lab">State: </p>
<input type="text" name="state">
<p class="lab">Country: </p>
<input type="text" name="country">
<input type="submit"  class="sub" value="Deliver to this address">
</div>
</form>
<br>
<br>

</body>
</html>