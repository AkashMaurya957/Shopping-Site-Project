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
<title>Vendor Home</title>
<link rel="stylesheet" type="text/CSS" href="${pageContext.request.contextPath}/CSS/sellerHomepage.css">
<link href="https://fonts.googleapis.com/css?family=Flamenco&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/mobileupload.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/sellerProfile.css">


</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 



<%  
List<venderOrder> list=VendorDao.getSellerProductOrder();  
request.setAttribute("list",list);  

List<venderOrder> list1=VendorDao.getOrderDelivered();  
request.setAttribute("list1",list1);  


String email=(String)session.getAttribute("Email");
System.out.print(email);

List<ProductBean> list2=ProductDoa.statusForAddProduct(email);  
request.setAttribute("list2",list2);

List<VendorRegisteration> list3=VendorDao.showVendorProfile(email);  
request.setAttribute("list3",list3);

List<ProductBean> list4=ProductDoa.Products(email);  
request.setAttribute("list4",list4);
%>



<div class="tab">

<img src="${pageContext.request.contextPath}\Icons\admin.png">

<br>
<br>
<br><br>

  <a class="tablinks" onclick="openCity(event, 'User Report')" id="defaultOpen"><i class="fa fa-plus-circle" aria-hidden="true"></i>&nbsp&nbspNew Order</a><br>
  
  <a class="tablinks" onclick="openCity(event, 'Order Report')"><i class="fa fa-book" aria-hidden="true"></i>&nbsp&nbspOrder Status</a><br>
  
  <form>
  <ul class="profle">
 

	 <li class="dropdown1" ><a class="tablinks"><i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp&nbspAdd Product Request</a>
 
   
   <div class="dropdown-content">
    <a href="#" onclick="openCity(event, 'Mobile Register Request')">Mobile</a>
    <a href="Logout">Clothes</a>
    
  </div>
   </li>

</ul>
</form>
<br>

 <a class="tablinks" onclick="openCity(event, 'Item Report')"><i class="fa fa-file" aria-hidden="true"></i>&nbsp&nbspProducts</a><br>
 <a class="tablinks" onclick="openCity(event, 'Payment Report')"><i class="fa fa-tasks" aria-hidden="true"></i>&nbsp&nbspProduct Status</a><br>
 
 
 <a class="tablinks" onclick="openCity(event, 'Account Setting')"><i class="fa fa-cog" aria-hidden="true"></i>&nbsp&nbspAccount Setting</a><br>
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
	 <li class="dropdown" > <a class=" notification1 full_btn dropbtn" ><%= session.getAttribute("userSeller") %></a>
   
   <div class="dropdown-content">
    <a href="#">Profile</a>
    <a href="Logout">Logout</a>
    <a href="#">About</a>
  </div>
   </li>

</ul>
</div>
</div>
<div id="User Report" class="tabcontent">
  <table>
<h1>Place Order</h1>
  <tr>
 
    <th>Product Id</th>
    <th>Product Name</th>
    <th>User Detail</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>Payment Mode</th>
    <th>Status</th>
    <th>Place</th>
    
  </tr>

   <c:forEach items="${list}" var="bean">
  <tr>
 
    
    <td>${bean.getProductId()}</td>
    
    <td>${bean.getProductName()}</td>
    <td> ${bean.getFullName()} <br>${bean.getHouseNo()} <br>${bean.getSector()} <br>${bean.getLandmark()} <br>${bean.getCity()} ${bean.getState() } ${bean.getCountry()} ${bean.getPincode()}<br>Mobile:${bean.getMobileNumber()}</td>
    <td>${bean.getQuantity()}</td>
    <td>${bean.getPrice()}</td>
    <td>${bean.getPaymentMode() }</td>
    <td>${bean.getStatus()}</td>
   
    <td>
    <form method="post" action="SellerPlaceOrder?productId=${bean.getOderId()}">
    
    
    <input type="submit"  class="btn" name="placeorder" value="Place">
     </form>
    </td>
    
  

  </tr>
    </c:forEach>
</table>
</div>

<div id="Order Report" class="tabcontent">
 <table>
<h1>Product Complain</h1>
  <tr>

    <th>Product Id</th>
    <th>Product Name</th>
    <th>User Detail</th>
    <th>Quantity</th>
    <th>Price</th>
    <th>Payment Mode</th>
    <th>Status</th>
    <th>Order Status</th>
   </tr>
  
   <c:forEach items="${list1}" var="bean">
 
  <tr>
 
    
    <td>${bean.getProductId()}</td>
    
    <td>${bean.getProductName()}</td>
    <td> ${bean.getFullName()} <br>${bean.getHouseNo()} <br>${bean.getSector()} <br>${bean.getLandmark()} <br>${bean.getCity()} ${bean.getState() } ${bean.getCountry()} ${bean.getPincode()}<br>Mobile:${bean.getMobileNumber()}</td>
    <td>${bean.getQuantity()}</td>
    <td>${bean.getPrice()}</td>
    <td>${bean.getPaymentMode() }</td>
    <td>${bean.getStatus()}</td>
    <td>Order Delivered</td>  
  </tr>
 </c:forEach> 
</table>
</div>

<div id="Item Report" class="tabcontent">
<table>
 <h1>Your Products</h1>
  <tr>
    <th>Product Category</th>
    <th>Product Brand </th>
    <th>Customer Model</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Status</th>
   
  </tr>
   <c:forEach items="${list4}" var="bean">
  <tr>
    <td>${bean.getCategory()} </td>
    <td>${bean.getBrandName()} </td>
    <td>${bean.getModel()} </td>
    <td>${bean.getPrice()} </td>
   <td>${bean.getQuantity()} </td>
   <td>${bean.getApprovalstatus()} </td>
  
  </tr>
  </c:forEach>
</table>
</div>



<div id="Payment Report" class="tabcontent">
 <table>
 <h1>Your Product Request Status</h1>
  <tr>
    <th>Product Category</th>
    <th>Product Brand </th>
    <th>Customer Model</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Status</th>
   
  </tr>
   <c:forEach items="${list2}" var="bean">
  <tr>
    <td>${bean.getCategory()} </td>
    <td>${bean.getBrandName()} </td>
    <td>${bean.getModel()} </td>
    <td>${bean.getPrice()} </td>
   <td>${bean.getQuantity()} </td>
   <td>${bean.getApprovalstatus()} </td>
  
  </tr>
  </c:forEach>
</table>
</div>


<div id="Account Setting" class="tabcontent">
<br>
  <h1>Your Profile</h1>
  <br>
  <c:forEach items="${list3}" var="bean">
<form  method="post">
<div class="button button1 borderstyle" style="background: white;">
<p class="lab">Name</p>
<label class="data">${bean.getName()}</label>


<p class="lab">Email</p>
<label class="data">${bean.getEmail()}</label>



<p class="lab">Mobile Number</p>
<label class="data">${bean.getMobile()}</label>



<p class="lab">Gender</p>
<label class="data">${bean.getGender()}</label>



<p class="lab">House no </p>
<label class="data">${bean.getHouseNo()}</label>



<p class="lab">Sector </p>
<label class="data">${bean.getSector()}</label>



<p class="lab">City </p>
<label class="data">${bean.getCity()}</label>



<p class="lab">State </p>
<label class="data">${bean.getState()}</label>



<p class="lab">country </p>
<label class="data">${bean.getCountry()}</label>



<p class="lab">Pincode</p>
<label class="data">${bean.getPincode()}</label>

<br>


<input type="submit"  class="sub" value="Want to Update Your Profile">
</div>
</form>
</c:forEach>
</div>


<div id="Status Product Report" class="tabcontent">
 <table>
<h1>Status Product Report</h1>
  <tr>
    <th>Product Id</th>
    <th>Product Name</th>
    <th>Brand</th>
    <th>Category</th>
    <th>Status (Accept/Reject)</th>
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
   <td></td>
  </tr>
 </table>
</div>


<div id="Mobile Register Request" class="tabcontent">


 
    <div class="formdesign" >
      
       <form action="MobileUpload"  method="post"  class="formdiv" >
             
    
       
       <h2>Mobile Form </h2> 
    

       
       <div class="container">
       <label class="lablename">Brand Name</label> &nbsp&nbsp<input  type="text" name="brandName" required>
       </div>
       
       <div class="container">
       <label class="lablename">Model</label> &nbsp&nbsp<input  type="text" name="model" required>
       </div>
       <div class="container">
       <label class="lablename">Price</label> &nbsp&nbsp<input  type="text" name="Price" required>
       </div>
       
       <div class="container">
       <label class="lablename">Quantity</label> &nbsp&nbsp<input  type="text" name="quantity" required>
       </div>
       
       <div class="container">
       <label class="lablename">Operating System</label> &nbsp&nbsp<input  type="text" name="operatingSystem" required>
       </div>
       
       
        <div class="container">
       <label class="lablename">Camera Description</label> &nbsp&nbsp<input  type="text" name="camera" required>
       </div>
       
       <div class="container">
       <label class="lablename">RAM</label> &nbsp&nbsp<input  type="text" name="ram" required>
       </div>
       
        <div class="container">
       <label class="lablename">Internal Memory</label> &nbsp&nbsp<input  type="text" name="internalMemory" required>
       </div>
       
       <div class="container">
       <label class="lablename">Sold By</label> &nbsp&nbsp<input  type="text" name="soldby" required>
       </div>
       
       <div class="container">
       <label class="lablename">Wireless communication technologies</label> &nbsp&nbsp<input  type="text" name="wirelessTechnology" required>
       </div>
       
       <div class="container">
       <label class="lablename">Item Dimensions</label> &nbsp&nbsp<input  type="text" name="itemdimensions" required>
       </div>
       
        <div class="container">
       <label class="lablename">Display Size</label> &nbsp&nbsp<input  type="text" name="displaysize" required>
       </div>
       
       <div class="container">
       <label class="lablename">Weight</label> &nbsp&nbsp<input  type="text" name="weight" required>
       </div>
       
       <div class="container">
       <label class="lablename">color</label> &nbsp&nbsp<input  type="text" name="color" required>
       </div>
       
        <div class="container">
       <label class="lablename">Sim slot</label> &nbsp&nbsp<input  type="text" name="simslot" maxlength="1">
       </div>
       
       <div class="container">
       <label class="lablename">Battery Power</label> &nbsp&nbsp<input  type="text" name="batteryPower" required>
       </div>
        <div class="container">
       <label class="lablename">Whats in the box</label>&nbsp &nbsp<textarea  type="text" name="whatinBox" required></textarea>
       </div>
       
    
       
        <div class="container">
       <label class="lablename">Special Features</label> &nbsp&nbsp<textarea  type="text" name="specialfeatures" required></textarea>
       </div>
       
        <div class="container">
       <label class="lablename">Warrenty Description</label> &nbsp&nbsp<textarea  type="text" name="warrenty" required></textarea>
       </div>
       
       <div class="container">
       <label class="lablename">Description About Product</label> &nbsp&nbsp<textarea  type="text" name="description" required></textarea>
       </div>
       
       <div class="container">
       <label class="lablename">Product Image 1</label> &nbsp&nbsp<input  type="file" name="image1" required>
       </div>
       
       <div class="container">
       <label class="lablename">Product Image 2</label> &nbsp&nbsp<input  type="file" name="image2" required>
       </div>
       
       <div class="container">
       <label class="lablename">Product Image 3</label> &nbsp&nbsp<input  type="file" name="image3" required>
       </div>
       
       
       <div class="container upload">
       <button class="btnsub btn">Upload Product</button>
       </div>
     
      
       </form>
       
   </div>
  
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