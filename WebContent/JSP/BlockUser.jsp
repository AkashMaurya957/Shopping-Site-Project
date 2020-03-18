<%@page import="com.shoppingsiteproductupload.dao.CustomerInfoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
String Block=null;


String email=request.getParameter("name");
System.out.print(email);

 String block=request.getParameter("category");
 System.out.print(block); 
 
    
		
		if(block.equals("Block"))
		{
			Block="UnBlock";
			System.out.print(Block);
		}
		else{
			
			Block="Block";
			System.out.print(Block);
		}
		

	
		int i = CustomerInfoDao.block(email, Block);
		
		if(i>0)
		{
			
			System.out.print("sucess");
			
		}else{
			
			System.out.print("something went wrong");
		}
	
		
	
		%>
		
</body>
</html>