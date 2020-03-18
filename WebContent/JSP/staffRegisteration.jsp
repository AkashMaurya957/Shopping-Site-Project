<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/staffRegistration.css">

</head>
<body>

<%@ include file = "../JSP/normalheader.jsp" %>

<br>
<br>
<form action="" method="post">
<div class="button button1 borderstyle" style="background: white;">
<h2 class="lab" style="text-align: center;">Staff Registration</h2>
<br>
<p class="lab">Email</p>
<input type="text" name="name" autofocus>
<p class="lab">Name</p>
<input type="text" name="mbno">
<p class="lab">Password</p>
<input type="text" name="pincode">
<p class="lab">Mobile Number</p>
<input type="text" name="hno">
<p class="lab">Date Of Birth</p>
<input type="text" name="sector">
<p class="lab">Gender </p>
<input type="text" name="landmark">
<p class="lab">City: </p>
<input type="text" name="city">
<p class="lab">State: </p>
<input type="text" name="state">
<p class="lab">Country: </p>
<input type="text" name="country">
<p class="lab">Pincode </p>
<input type="text" name="country">
<input type="submit"  class="sub" value="Register Staff">
</div>
</form>


<%@ include file = "../JSP/footer.jsp" %>

</body>
</html>