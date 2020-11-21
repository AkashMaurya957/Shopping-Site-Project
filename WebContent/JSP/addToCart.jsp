<%@page import="java.util.HashSet"%>
<%@page import="org.apache.taglibs.standard.lang.jstl.test.Bean1"%>
<%@page import="com.shoppingsite.productupload.bean.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add To Cart</title>
<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

<%


 String productID=request.getParameter("name");
String category=request.getParameter("category");
 String email=( String)session.getAttribute("Email"); 
 
 System.out.print(productID);
 System.out.print(category);
 
 Cart bean=new Cart();

	  
  if(session.getAttribute("Email")!=null)
  {
	  
	
	  bean.setEmail(email);
	  bean.setProductID(productID);
	  bean.setTablename(category);



	  int i = ProductDoa.storeProductIdInCart(bean);
	    
	    
	    if(i>0)
	    {
	  	  System.out.print("Success");
	  	 
	    }
	    else
	    {
	  	  

	  		System.out.print("Something Went wrong");
	    }

	    

	
	
  }
%>


		
	
</body>
</html>