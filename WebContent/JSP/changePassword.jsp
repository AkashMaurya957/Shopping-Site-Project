<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/changePassword.css">
</head>
<body>

<%@ include file = "../JSP/normalheader.jsp" %>

<form action="${pageContext.request.contextPath}/ChangePassword" method="post">
<div class="ChangePassword">
<label class="lab">Password</label>
<input type="text" name="Password">
<br><br>
<label class="lab">Confirm Password</label>
<input type="text" name="ConfirmPassword">
<br><br>
<input type="submit" class="sub">
</div>
</form>
</body>
</html>