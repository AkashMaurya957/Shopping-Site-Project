<%@page import="com.shoppingsiteproductupload.dao.AdminDao"%>
<%@page import="com.shoppingsite.productupload.bean.AdminBean"%>
<%@page import="java.util.List"%>
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ include file = "../JSP/normalheader.jsp" %>

<% 

String adminEmail=(String)session.getAttribute("Email");

List<AdminBean> list = AdminDao.getAdminDetails(adminEmail);
request.setAttribute("list",list);

%>
<br>
<br>
<c:forEach items="${list}" var="bean"> 
<form action="${pageContext.request.contextPath}/UpdateAdminProfile" method="post">
<div class="button button1 borderstyle" style="background: white;">
<h2 class="lab" style="text-align: center;">Welcome&nbsp ${bean.getName()} Update Your Profile </h2>
<br>
<p class="lab" >Admin Name</p>
<input type="text" name="name" value="${bean.getName()}">
<p class="lab">Email ID</p>
<input type="text" name="Email" value="${bean.getEmail()}">
<p class="lab">Mobile Number</p>
<input type="text" name="Mobilenumber" value="${bean.getMobileNumber()}">
<p class="lab">Twitter Page</p>
<input type="text" name="Twitter" value="${bean.getTwitterPage()}">
<p class="lab">Instagram Page</p>
<input type="text" name="Instagram" value="${bean.getInstagramPage()}">
<p class="lab">Facebook Page</p>
<input type="text" name="Facebook" value="${bean.getFacebookPage()}">

<input type="submit"  class="sub" value="Update Profile">
</div>
</form>
</c:forEach>
<br>
<br>

</body>
</html>