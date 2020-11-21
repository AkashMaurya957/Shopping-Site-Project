<%@page import="com.shoppingsiteproductupload.dao.CustomerInfoDao"%>
<%@page import="com.shoppingsite.productupload.bean.UserDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>
<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script  type="text/javascript">


$(document).ready(function(){

	
	 
	$("[data-pid]").click(function(){
		   
		  var brandname=$(this).data("pid");
		  var catagory=$(this).data("p");
		
	    $.post("${pageContext.request.contextPath}/JSP/BlockUser.jsp",{name:brandname,category:catagory},function(data){
	    $('#demo').load('${pageContext.request.contextPath}/JSP/adminViewCustomer.jsp').fadeIn("slow");
	        
	         	
	    	    
	    });
	    
	   });
  
  });

	

</script>


</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%

List<UserDetails> list6 =CustomerInfoDao.getUserDetail();
request.setAttribute("list6",list6);

%>
<div id="demo">



 <c:if test="${empty list6}">
  
  <div class="NoOrderAvailable">
  
      <b>No Customer is Join for Now</b>
      <br><br><br>
     <i class="fas fa-user fa-7x"></i>
      
  </div>
  
  </c:if>
  
  <c:if test="${!empty list6}">
  
  
<table>

<tr>
<th>Customer Name </th>
<th>Email Id </th>
<th>Mobile Number</th>
<th>Unblock/Block</th>


</tr>
<c:forEach items="${list6}" var="bean">

<tr>
<td>${bean.getName()}</td>
<td>${bean.getEmail()}</td>
<td>${bean.getMobile()}</td>

<td>
<button  id="block" data-pid="${bean.getEmail()}" data-p="${bean.getBlock()}" >${bean.getBlock()}</button>
</td>

</tr>
</c:forEach>
</table>
 </c:if>
 
 
</div>
</body>
</html>