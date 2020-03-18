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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/sliderstyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Filter.css">
<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>

$(document).ready(function(){
  $("#show").click(function(){
   
	  var brandname=$("#brand").val();
	  var Low=$("#low").val();
	  var High=$("#high").val();
    $("#Transaction").load("${pageContext.request.contextPath}/JSP/Filter.jsp",{name:brandname,LowPrice:Low,HighPrice:High});
    
   
    
  });
  
  
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

<%@include file="normalheader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

   

 <%  
List<ProductBean> list=ProductDoa.getDataSlider();  
request.setAttribute("list",list);  
%>


<div class="left">
<br><br>
<div class="inside">
  <a class="tablinks" onclick="openCity(event, 'Home')" id="defaultOpen"></a><br>
  <span class="filterBy">FILTER BY :</span><br><br>
  <p>Brand</p><input type="text" id="brand" class="filterinput">
  <br>
  <p>Price Range</p>
  <input type="text" id="low" class="filterinput">&nbsp<span style="color:white;">-</span>&nbsp<input type="text" id="high" class="filterinput">
  <br><br>
  <a class="tablinks" onclick="openCity(event, 'Transaction')" id="show">Filter</a><br>
<br><br>

</div>
<br><br>
</div>
<div>

<div class="right">

<div id="Home" class="tabcontent">

<div id="div1"></div>
 <c:forEach items="${list}" var="bean"  > 
<div class="column">  


<div class="card">
  <img src="data:image/jpg;base64,${bean.image1}" style="width:40%;height: 200px;">
  <a href="ProductView.jsp?product=${bean.getProductId()}"  target="_blank" style="text-decoration: none;">
 <h3>${bean.getBrandName()}${bean.model}</h3>
 
  <p class="price">${bean.getPrice()}</p>
   
  </a>

   <p><button data-pid="${bean.getProductId()}" data-p="${bean.getCategory()}">Add to Cart</button></p>
<br><br>
</div>
</div>
</c:forEach>

</div>


<div id="Transaction" class="tabcontent">

</div>



 
</div>
</div>



<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>

</body>
</html>