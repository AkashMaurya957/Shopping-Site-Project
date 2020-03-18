<%@page import="com.shoppingsiteproductupload.dao.VendorDao"%>
<%@page import="com.shoppingsite.productupload.bean.VendorRegisteration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<script  type="text/javascript">
$(document).ready(function(){
	
  
  $("[ data-vendorpid]").click(function(){
	   
	  var brandname=$(this).data("vendorpid");
	  var name=$(this).data("p");
	 
    $.post("${pageContext.request.contextPath}/JSP/vendorBlockUnblock.jsp",{name:brandname,Block:name},function(data){
    
    $('#demo').load('${pageContext.request.contextPath}/JSP/adminViewVendor.jsp').fadeIn("slow");
    
    				 
    	    
    });
    
   });
  
  });

	

</script>

</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%
List<VendorRegisteration> list7=VendorDao.getVendor();
request.setAttribute("list7",list7);
%>
<div id="demo">
 <table>


<tr>
<th>Vendor Name </th>
<th>Email Id </th>
<th>Mobile Number</th>
<th>Address</th>
<th>Unblock/Block</th>


</tr>

<c:forEach items="${list7}" var="bean">

<tr>
<td>${bean.getName()}</td>
<td>${bean.getEmail()}</td>
<td>${bean.getMobile()}</td>
<td>${bean.getHouseNo()}&nbsp${bean.getSector()}<br>${bean.getCountry()}&nbsp${bean.getState()}&nbsp${bean.getCity()}<br>${bean.getPincode()}</td>


<td><button id="block"  data-vendorpid="${bean.getEmail()}" data-p="${bean.getBlockUnblock()}" >${bean.getBlockUnblock()}</button></td>
</tr>
</c:forEach>	

</table>
</div>
</body>
</html>