<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
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


List<ProductBean> list5 =ProductDoa.getDataSlider();
request.setAttribute("list5",list5);



%>

<div id="demo">
<table>

<tr>
<th>Product Image</th>
<th>Brand</th>
<th>Model</th>
<th>Quantity Available</th>
<th>View Description</th>
<th>Delete Product</th>

</tr>
<c:forEach items="${list5}" var="bean"> 

<tr>

<td>  <img src="data:image/jpg;base64,${bean.image1}" style="width:80px"></td>
<td>${bean.getBrandName()}</td>
<td>${bean.getModel()}</td>
<td>${bean.getQuantity()}</td>
<td>
<form method="post" action="JSP/productViewAdmin.jsp?product=${bean.getProductId()}" target="_blank">
    
<input type="submit" class="btn" name="placeorder" value="View">
</form>
</td>
<td>
<form method="post" action="DeleteProduct?product=${bean.getProductId()}">
    
<input type="submit" class="btn" name="placeorder" value="Delete">
</form>
</td>
    
  
</tr>
</c:forEach>
</table>
</div>
</body>
</html>