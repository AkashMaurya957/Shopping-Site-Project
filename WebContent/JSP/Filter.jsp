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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Mobile.css">

<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>


$(document).ready(function(){
  $("[data-pid]").click(function(){
   
	  var brandname=$(this).data("pid");
	  var catagory=$(this).data("p");
	 
    $.post("${pageContext.request.contextPath}/JSP/addToCart.jsp",{name:brandname,category:catagory},function(data){
    	
    	$("#msg").html(data);
    	    
    });
    
   });
  
  });


</script>

</head>
<body>
<%  



String brand = request.getParameter("name");
System.out.print(brand);
String low = request.getParameter("LowPrice");
System.out.print(low);
String high = request.getParameter("HighPrice");
System.out.print(high);
List<ProductBean> list=ProductDoa.getFilterData(brand, low, high);

request.setAttribute("list",list); 

%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 


 <c:forEach items="${list}" var="bean" > 
<div class="column">  


<div class="card">
  <img src="data:image/jpg;base64,${bean.image1}" style="width:40%;height: 200px;">
  <a href="ProductView.jsp?product=${bean.getProductId()}"  target="_blank" style="text-decoration: none;">

  <h3>${bean.getBrandName()}${bean.model}</h3>

  <p class="price">${bean.getPrice()}</p>
 
  </a>
  
 <p><button data-pid="${bean.getProductId()}" data-p="${bean.getCategory()}">Add to Cart</button></p>

</div>
</div>
</c:forEach>




</body>
</html>