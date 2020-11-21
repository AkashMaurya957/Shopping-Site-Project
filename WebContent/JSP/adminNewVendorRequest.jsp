<%@page import="com.shoppingsiteproductupload.dao.VendorDao"%>
<%@page import="com.shoppingsite.productupload.bean.VendorRegisteration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script  type="text/javascript">

$(document).ready(function(){
	
	
	 
	 $("[data-a]").click(function(){
		   
		  var Accept=$(this).data("a");
		  
		
	    $.post("${pageContext.request.contextPath}/Accept",{AcceptVendor:Accept},function(data){
	    	location.reload();   
	    	    
	    });
	    
	   });
	 
	 $("[data-r]").click(function(){
		   
		  var reject=$(this).data("r");
		
		
	    $.post("${pageContext.request.contextPath}/Reject",{VendorReject:reject},function(data){
	    	  	
	    	location.reload();   
	    });
	    
	   });

});
</script>
<title>New Vendor Request</title>
</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<% 
List<VendorRegisteration> list9 =VendorDao.getVendorRequest();
request.setAttribute("list9",list9);

%>
<div id="demo">

 <c:if test="${empty list9}">
  
  <div class="NoOrderAvailable">
  
      <b>No Request Available for New Vendor</b>
      <br><br><br>
      <i class="fas fa-user-friends fa-7x"></i>
      
      
  </div>
  
  </c:if>
  
  <c:if test="${!empty list9}">

<table>
<tr>
<th>Vendor Name </th>
<th>Email Id </th>
<th>Mobile Number</th>
<th>Address</th>
<th>Accept/Reject</th>


</tr>

<c:forEach items="${list9}" var="bean">

<tr>
<td>${bean.getName()}</td>
<td>${bean.getEmail()}</td>
<td>${bean.getMobile()}</td>
<td>${bean.getHouseNo()}&nbsp${bean.getSector()}<br>${bean.getCity()}&nbsp${bean.getState()}&nbsp${bean.getCountry()}<br>${bean.getPincode()}</td>

<td style="display: flex;color: red;cursor: pointer;"><button data-a="${bean.getEmail()}" id="AcceptReject">Accept</button>&nbsp&nbsp&nbsp<button data-r="${bean.getEmail()}" id="AcceptReject">Reject</button></td>
</tr>
</c:forEach>

</table>

</c:if>


</div>




</body>
</html>