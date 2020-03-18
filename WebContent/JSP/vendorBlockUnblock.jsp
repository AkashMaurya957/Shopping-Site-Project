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


String Blocks=null;
    String email = request.getParameter("name");
	System.out.print(email);
	String block = request.getParameter("Block");
		System.out.print(block);
		
		if(block.equals("Block"))
		{
			Blocks="UnBlock";
			System.out.print(Blocks);
		}
		else{
			
			Blocks="Block";
			System.out.print(Blocks);
		}
		



	
		int i = CustomerInfoDao.blockVendor(email, Blocks);
		
		if(i>0)
		{
			
			System.out.print("sucess");
		}else{
			
			System.out.print("something went wrong");
		}
		
	
		
	
		%>
		
</body>
</html>