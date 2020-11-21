<%@page import="com.shoppingsiteproductupload.dao.VendorDao"%>
<%@page import="com.shoppingsite.productupload.bean.VendorRegisteration"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/shippingaddress.css">

<title>Update Vendor Profile</title>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<% 

String selleremail=(String)session.getAttribute("Email");

List<VendorRegisteration> list=VendorDao.showVendorProfile(selleremail);  
request.setAttribute("list",list);

%>
<br>
<br>
<c:forEach items="${list}" var="bean"> 
<form action="${pageContext.request.contextPath}/UpdateSellerDetails" method="post">
<div class="button button1 borderstyle" style="background: white;">
<h2 class="lab" style="text-align: center;">Welcome&nbsp ${bean.getName()} Update Your Profile </h2>
<br>
<p class="lab" >Name</p>
<input type="text" name="name" value="${bean.getName()}">

<p class="lab">Mobile Number</p>
<input type="text" name="Mobilenumber" value="${bean.getMobile()}">

<p class="lab">Gender</p>
<input type="text" name="gender" value="${bean.getGender()}">

<p class="lab">Flat, House no., Building, Company, Apartment:</p>
<input type="text" name="House" value="${bean.getHouseNo()}">

<p class="lab">Area, Colony, Street, Sector, Village:</p>
<input type="text" name="sec" value="${bean.getSector()}">

<p class="lab">Landmark e.g. near apollo hospital:</p>
<input type="text" name="landmark" value="${bean.getArea()}">

<p class="lab">country </p>
<input type="text" name="country" value="${bean.getCountry()}">

<p class="lab">State</p>
<input type="text" name="state" value="${bean.getState()}">

<p class="lab">City </p>
<input type="text" name="city" value="${bean.getCity()}">

<p class="lab">Pincode </p>
<input type="text" name="pincode" value="${bean.getPincode()}">

<input type="submit"  class="sub" value="Update Profile">
</div>
</form>
</c:forEach>
<br>
<br>

</body>
</html>