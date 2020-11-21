<%@page import="com.shoppingsiteproductupload.dao.CustomerInfoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Block/unblock Users</title>
</head>
<body>

<% 
String Block=null;


String email=request.getParameter("name");


 String block=request.getParameter("category");

 
    
		
		if(block.equals("Block"))
		{
			Block="UnBlock";
			
		}
		else{
			
			Block="Block";
			
		}
		

	
		int i = CustomerInfoDao.block(email, Block);
		
		
	
		
	
		%>
		
</body>
</html>