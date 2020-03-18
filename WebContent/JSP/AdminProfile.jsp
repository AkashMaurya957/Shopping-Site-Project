<%@page import="com.shoppingsiteproductupload.dao.AdminDao"%>
<%@page import="com.shoppingsite.productupload.bean.AdminBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<% 

String adminEmail=(String)session.getAttribute("Email");
List<AdminBean> list = AdminDao.getAdminDetails(adminEmail);
request.setAttribute("list",list);
%>

<div id="demo">
<h1>Your Profile</h1>
<br>
<c:forEach items="${list}" var="bean">  
<form action="${pageContext.request.contextPath}/JSP/updateAdmin.jsp" method="post">
<div class="button button1 borderstyle" style="background: white;">
<p class="lab">Name</p>
<label class="data">${bean.getName()} </label>


<p class="lab">Email</p>
<label class="data">${bean.getEmail()} </label>


<p class="lab">Mobile Number</p>
<label class="data">${bean.getMobileNumber()} </label>

<p class="lab">Twitter Page</p>
<label class="data">${bean.getTwitterPage()} </label>

<p class="lab">Instagram Page</p>
<label class="data">${bean.getInstagramPage()} </label>

<p class="lab">Facebook Page</p>
<label class="data">${bean.getFacebookPage()} </label>

<br>
<input type="submit"  class="sub" value="Want to Update Your Profile">
</div>
</form>

</c:forEach>

</div>

</body>
</html>