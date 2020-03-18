<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/otp.css">
</head>
<body>
<%@include file="normalheader.jsp" %>
<form action="${pageContext.request.contextPath}/MatchOtp" method="post">
<div class="content">

<p class="heading">Enter Your OTP </p>
<br>
<%
if(session.getAttribute("OtpNotMatch")!=null)
{
%>
<p style="color: red">Incorrect OTP!</p>
<%

session.setAttribute("OtpNotMatch","");
}

%>
<br>
<p style="text-align: center;color: #004445;">OTP has been Send to Your Mail !</p>

<br>
<table align="center">

	<tr align="center">
	<td><p style="color:#004445;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspOTP&nbsp&nbsp&nbsp&nbsp</p></td>
	<td></td>
	<td><input type="text" name="secretcode"></td>
	</tr>
						
	<tr>
	<td></td>
	<td></td>
	<td> <input type="submit" name="otpsub" value="CONFIRM" style="background: #004445;padding: 8px;color:white;border-radius:20px; white;"/>&nbsp&nbsp&nbsp<a style="color:#004445;cursor:pointer; " href="${pageContext.request.contextPath}/Resend">Resend</a></td>
	</tr>
	</table>
	<br>

    <p class="lower">Never Share Your OTP With Anyone</p>

</div>
</form>
</body>
</html>
