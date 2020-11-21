<%@page import="com.shoppingsiteproductupload.dao.CustomerInfoDao"%>
<%@page import="com.shoppingsite.productupload.bean.PlaceOrder"%>
<%@page import="com.shoppingsite.productupload.bean.UserDetails"%>
<%@page import="com.shoppingsiteproductupload.dao.AdminDao"%>
<%@page import="com.shoppingsite.productupload.bean.AdminBean"%>
<%@page import="com.shoppingsite.productupload.bean.VendorRegisteration"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.shoppingsiteproductupload.dao.VendorDao"%>
<%@page import="com.shoppingsite.productupload.bean.venderOrder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Homepage</title>
<link rel="stylesheet" type="text/CSS" href="${pageContext.request.contextPath}/CSS/adminhome.css">
<link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/sellerProfile.css">

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
	 
	 $("#LoadVendor").click(function(){
		   
		  
	    $("#ViewVendor").load("${pageContext.request.contextPath}/JSP/adminViewVendor.jsp");
	    
	   
	    
	  });
	 
	 $("#LoadCustomer").click(function(){
		   
		  
		    $("#ViewCustomer").load("${pageContext.request.contextPath}/JSP/adminViewCustomer.jsp");
		    
		   
		    
		  });
	 
	 $("#LoadProfile").click(function(){
		   
		  
		    $("#Account").load("${pageContext.request.contextPath}/JSP/AdminProfile.jsp");
		    
		   
		    
		  });
	 
	 $("#LoadProducts").click(function(){
		   
		  
		    $("#Products").load("${pageContext.request.contextPath}/JSP/adminProducts.jsp");
		    
		   
		    
		  });
	 
	 $("#LoadRequestProducts").click(function(){
		   
		  
		    $("#RequestForProducts").load("${pageContext.request.contextPath}/JSP/adminViewProductsRequest.jsp");
		    
		   
		    
		  });
	 
	 $("#LoadNewVendow").click(function(){
		   
		  
		    $("#newVendor").load("${pageContext.request.contextPath}/JSP/adminNewVendorRequest.jsp");
		    
		   
		    
		  });
	 
	 

  });

	
</script>
</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<% 


List<UserDetails> list1 = AdminDao.getTotalCustomer();
request.setAttribute("list1", list1);

List<UserDetails> list2 = AdminDao.getNewCustomer();
request.setAttribute("list2", list2);

List<PlaceOrder> list3 = AdminDao.getTotalOrder();
request.setAttribute("list3", list3);


List<PlaceOrder> list4 = AdminDao.getTotalIncome();
request.setAttribute("list4", list4);




%>



<div class="sideleft">

<img src="${pageContext.request.contextPath}\Icons\admin.png">

<br>
<br>
<br><br>

  <a class="tablinks" onclick="openCity(event, 'Home')" id="defaultOpen" style="cursor: pointer;"><i class="fa fa-home" aria-hidden="true"></i>&nbsp&nbspHome</a><br>
  
  <a class="tablinks" onclick="openCity(event, 'RequestForProducts')" id="LoadRequestProducts" style="cursor: pointer;"><i class="fa fa-american-sign-language-interpreting" aria-hidden="true"></i>&nbsp&nbsp Request For Products</a><br>
 <a class="tablinks" onclick="openCity(event, 'Sales')" style="cursor: pointer;"><i class="fa fa-archive" aria-hidden="true"></i>&nbsp&nbspSales</a><br>
 <a class="tablinks" onclick="openCity(event, 'Products')" id="LoadProducts" style="cursor: pointer;"><i class="fa fa-folder" aria-hidden="true"></i>&nbsp&nbspProducts</a><br>
 
 <a class="tablinks" onclick="openCity(event, 'ViewCustomer')" id="LoadCustomer" style="cursor: pointer;"><i class="fa fa-bullhorn" aria-hidden="true"></i>&nbsp&nbspCustomer List</a><br>
 
 <a class="tablinks" onclick="openCity(event, 'ViewVendor')" id="LoadVendor" style="cursor: pointer;" ><i class="fa fa-cog" aria-hidden="true"></i>&nbsp&nbspVendor List</a><br>
 

 
 <a class="tablinks" onclick="openCity(event, 'newVendor')"  id="LoadNewVendow"  style="cursor: pointer;"><i class="fa fa-bullhorn" aria-hidden="true"></i>&nbsp&nbspNew Vendor Request</a><br>
 
 <a class="tablinks" onclick="openCity(event, 'Account')" id="LoadProfile" style="cursor: pointer;"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp&nbspAccount Setting</a><br>




</div>
<div>

<div class="right">
<div class="header">


<a href="#" class="notification1">
  <span>Product Orders</span>
  <span class="badge">3</span>
</a>
<div class="profile">
<a href="#" class="notification">
  <span><i class="fa fa-bell fa-2x" aria-hidden="true"></i></span>
  <span class="badge">3</span>
</a>


<ul class="profle">
	 <li class="dropdown" > <a class=" notification1 full_btn dropbtn" ><%= session.getAttribute("userAdmin") %></a>
   
   <div class="dropdown-content">
    <a href="#">Profile</a>
    <a href="Logout">Logout</a>
    <a href="#">About</a>
  </div>
   </li>

</ul>
</div>
</div>

<div style="display: flex;">
 <c:forEach items="${list1}" var="bean">  
	<div class="box">
	
	<p>Total Customers&nbsp&nbsp<i class="fa fa-user boxicon" aria-hidden="true"></i></p>
	<b>${bean.getTotalCustomer()}</b>
	
	
   </div>
		</c:forEach>
	
	 <c:forEach items="${list2}" var="bean"> 
	<div class="box1" >
	
	<p>New Customers&nbsp&nbsp<i class="fa fa-user-plus boxicon1 " aria-hidden="true"></i></p>
	<b>${bean.getNewCustomer()}</b>
	
	</div>
	</c:forEach>
	
	
	 <c:forEach items="${list3}" var="bean">  
	<div class="box2" >
	<p>Total orders&nbsp&nbsp<i class="fa fa-archive boxicon2" aria-hidden="true"></i></p>
	<b>${bean.getTotalOrder()}</b>
	</div>
	</c:forEach>
 
  <c:forEach items="${list4}" var="bean">  
	<div class="box3" >
	<p>Total Income&nbsp&nbsp<i class="fa fa-credit-card boxicon3" aria-hidden="true"></i></p>
	<b>${bean.getTotalincome()}</b>
	</div>
</c:forEach>
	  
</div>
<div id="Home" class="tabcontent">

</div>

<div id="RequestForProducts" class="tabcontent">

</div>



<div id="newVendor" class="tabcontent">


</div>



<div id="Products" class="tabcontent">

</div>


<div id="ViewCustomer" class="tabcontent">


</div>


<div id="ViewVendor" class="tabcontent">
<br>
 
 </div>
  
  
<div id="Report" class="tabcontent">
report
</div>


<div id="Account" class="tabcontent">
<br>

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

document.getElementById("defaultOpen").click();
</script>


</body>
</html>