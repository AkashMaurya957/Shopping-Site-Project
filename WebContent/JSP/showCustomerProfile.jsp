<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="com.shoppingsite.productupload.bean.OrderHistoryBean"%>
<%@page import="com.shoppingsiteproductupload.dao.CustomerInfoDao"%>
<%@page import="com.shoppingsite.productupload.bean.UserDetails"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/showCustomer.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
  
<title>Customer Profile</title>
</head>
<body>
<%@ include file = "normalheader.jsp" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 


<% 

String email=(String)session.getAttribute("Email");
List<UserDetails> list =CustomerInfoDao.getUserDetails(email);
request.setAttribute("list",list);

List<OrderHistoryBean> list1 =ProductDoa.getPlaceOrder(email);
request.setAttribute("list1",list1);


List<OrderHistoryBean> list2 =ProductDoa.getPlaceOrderHistory(email);
request.setAttribute("list2",list2);


%>

<div style="display: flex;width: 100%;height: 100%;position:absolute;">
<div class="CustomerMenu">
<br>
  <a class="tablinks" onclick="openCity(event, 'CustomerDetails')" id="defaultOpen" style="cursor: pointer;"><i class="fa fa-user fa-3x" aria-hidden="true"></i></a><br>
   <br><br><br>
   <a class="tablinks" onclick="openCity(event, 'Order')" style="cursor: pointer;"><i class="fa fa-archive fa-3x" aria-hidden="true"></i></a><br>
  <br><br><br>
  <a class="tablinks" onclick="openCity(event, 'history')" style="cursor: pointer;"><i class="fa fa-history fa-3x" aria-hidden="true"></i></a><br>
  <br><br><br>
  <a class="tablinks" onclick="openCity(event, 'Security')" style="cursor: pointer;"><i class="fa fa-shield fa-3x" aria-hidden="true"></i></a><br>
  
  
  <br><br>
 
</div>

<div class="showdata">


<div id="CustomerDetails" class="tabcontent">
<c:forEach items="${list}" var="bean">
<b class="name">Profile</b>
<br><br>

<div  class="user">
<p class="lab"><b>Name</b>&nbsp</p>
<label class="info" style="text-transform: capitalize;">${bean.getName()}</label>
</div>

<div  class="user">
<p class="lab"><b>Email</b>&nbsp</p>
<label class="info">${bean.getEmail()}</label>
</div>

<div  class="user">
<p class="lab"><b>Mobile</b>&nbsp</p>
<label class="info">${bean.getMobile()}</label>
</div>

<div  class="user">
<p class="lab"><b>Address</b></p>
<label class="info">${bean.getHno()} &nbsp ${bean.getSector()} &nbsp ${bean.getLandmark()} &nbsp ${bean.getCity()} &nbsp ${bean.getState()} &nbsp ${bean.getCountry()} &nbsp ${bean.getPincode()}</label>
</div>



</c:forEach>
</div>





<div id="Order" class="tabcontent" >
<br><br>

<div class="orderStatus">

<c:forEach items="${list1}" var="bean">
  <br><br>
<div style="color:black;border-radius: 10px;border: 1px solid #004445;">

<div style="background:#004445 ;color:white;padding: 10px;display: flex;border-radius: 10px 10px 0px 0px; ">

<div>
<b>Order Placed</b>
<p>${bean.getPurchasedate()}</p>
</div>
<div style="margin-left: 30%;">
<b>Price</b>
<p>${bean.getPrice()}</p>
</div>
<div style="margin-left: 30%;">
<b >Ship To</b>
<p>${bean.getFullName()}</p>
</div>

</div>

<div  style="display: flex; padding:20px;">
<br>
<div>
<p>Order will be delivered to you within three days of Booked order</p><br>

<div  style="display: flex; padding:20px;">
<img src="data:image/jpg;base64,${bean.getImage1()}" style="width:10%;height: 130px;">

<b><br>&nbsp&nbsp&nbsp${bean.getProductName()}</b>

<div style="margin-left: 8%;">
<b>Address</b>

<p>${bean.getHouseno()}&nbsp${bean.getSector()}&nbsp<br>${bean.getLandmark()}&nbsp<br>
${bean.getCity()}&nbsp${bean.getState()}&nbsp<br>${bean.getCountry()}&nbsp<br>${bean.getPincode()}
</p>

</div>

<p style="margin-left: 5%;">
<b>Payment mode</b><br>
${bean.getPaymentMode()}
</p>

<p style="margin-left: 5%;">
<b>Payment Status</b><br>
<span>${bean.getStatus()}</span>

</p>

<p style="margin-left: 5%;">
<b>Product Status</b><br>
<span>${bean.getTrack()}</span>

</p>

</div>

</div>
</div>


<a class="orderView"  href="${pageContext.request.contextPath}/JSP/productViewAdmin.jsp?product=${bean.getProductID()}">View Product Details</a>

<br><br>
</div>
 
 </c:forEach>
</div>

<br><br>



</div>


<div id="history" class="tabcontent">
<br><br>

<div class="orderStatus">

<c:forEach items="${list2}" var="bean">
  <br><br>
<div style="color:black;border-radius: 10px;border: 1px solid #004445;">

<div style="background:#004445 ;color:white;padding: 10px;display: flex;border-radius: 10px 10px 0px 0px; ">

<div>
<b>Order Placed</b>
<p>${bean.getPurchasedate()}</p>
</div>
<div style="margin-left: 30%;">
<b>Price</b>
<p>${bean.getPrice()}</p>
</div>
<div style="margin-left: 30%;">
<b >Ship To</b>
<p>${bean.getFullName()}</p>
</div>

</div>

<div  style="display: flex; padding:20px;">
<br>
<div>

<div  style="display: flex; padding:20px;">
<img src="data:image/jpg;base64,${bean.getImage1()}" style="width:10%;height: 130px;">

<b><br>&nbsp&nbsp&nbsp${bean.getProductName()}</b>

<div style="margin-left: 8%;">
<b>Delivery Address</b>

<p>${bean.getHouseno()}&nbsp${bean.getSector()}&nbsp<br>${bean.getLandmark()}&nbsp<br>
${bean.getCity()}&nbsp${bean.getState()}&nbsp<br>${bean.getCountry()}&nbsp<br>${bean.getPincode()}
</p>

</div>

<p style="margin-left: 5%;">
<b>Order Sign By</b><br>
${bean.getFullName()}
</p>

<p style="margin-left: 5%;">
<b>Delivery Date</b><br>
${bean.getDeleiverydate()}
</p>

</p>

<p style="margin-left: 5%;">
<b>Product Status</b><br>
<span>${bean.getTrack()}</span>

</p>

</div>

</div>
</div>


<a class="orderView"  href="${pageContext.request.contextPath}/JSP/productViewAdmin.jsp?product=${bean.getProductID()}">View Product Details</a>

<br><br>
</div>
 
 </c:forEach>
</div>

<br><br>

</div>

<div id="Security" class="tabcontent">
<c:forEach items="${list}" var="bean">

<div  class="boxsecurity">
<div  class="back">
<p class="lab"><b>Name</b></p>
<label class="info" style="text-transform: capitalize;">${bean.getName()}</label>
<input style="float: right;padding: 4px 15px;border-radius: 5px;" type="submit" value="Edit" id="myBtn">
</div>
<hr>
<div  class="back">
<p class="lab"><b>Email</b></p>
<label class="info">${bean.getEmail()}</label>

</div>
<hr>
<div  class="back">
<p class="lab"><b>Mobile</b></p>
<label class="info">${bean.getMobile()}</label>
<input style="float: right;padding: 4px 15px;border-radius: 5px;" type="submit" value="Edit" id="mymob">
</div>
<hr>
<div  class=" back">
<p class="lab"><b>Password</b></p>
<label class="info">************</label>
<input style="float: right;padding: 4px 15px;border-radius: 5px;" type="submit" value="Edit" id="myPass">
</div>
<hr>
<div  class=" back address">
<p class="lab"><b>Shipping Address</b></p>
<label class="info">${bean.getHno()} &nbsp ${bean.getSector()} &nbsp ${bean.getLandmark()} &nbsp ${bean.getCity()} &nbsp ${bean.getState()} &nbsp ${bean.getCountry()} &nbsp ${bean.getPincode()}</label>
<input style="float: right;padding: 4px 15px;border-radius: 5px;" type="submit" value="Edit" id="myAddr">
</div>

</div>
</c:forEach>
</div>
</div>


<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  
    <span class="close">&times;</span>
    <br>
    
    <form action="${pageContext.request.contextPath}/EditCustomerName" method="post">
    
    <p style="text-align: center;font-size: 25px;color:#004445;">Customer Name</p>
    <p style="text-align: center;margin-top: 5px;"><input type="text" name="Username" style="padding:5px 5px;width: 350px;border-radius: 5px;"></p>
    <br>
    <p style="text-align: center;"><input class="btn"  type="submit" value="Change Name" style="width: 20%;background:#004445;color: white;"></p>
   
   
    </form>
 
  </div>

</div>

<div id="myMobile" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  
    <span class="close1" >&times;</span>
    <br>
    
    <form action="${pageContext.request.contextPath}/EditCustomerNumber" method="post">
    
    <p style="text-align: center;font-size: 25px;color:#004445;">Mobile Number</p>
    <p style="text-align: center;margin-top: 5px;"><input type="text" name="UserNumber" style="padding:5px 5px;width: 350px;border-radius: 5px;"></p>
    <br>
    <p style="text-align: center; "><input class="btn" type="submit" value="Change Mobile Number" style="width: 30%;background:#004445;color: white;"></p>
   
   
    </form>
 
  </div>

</div>


<div id="myAddress" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  
    <span class="close2" >&times;</span>
    <br>
    
<form action="${pageContext.request.contextPath}/EditCustomerAddress" method="post">
<div class="button button1 borderstyle" style="background: white;color:  #004445;">
<h2 class="lab" style="text-align: center;">Add Address for Shipping</h2>
<br>
<p class="lab" >Full Name</p>
<input type="text" name="name" autofocus>
<p class="lab">Mobile Number</p>
<input type="text" name="mbno">
<p class="lab">Pincode:</p>
<input type="text" name="pincode">
<p class="lab">Flat, House no., Building, Company, Apartment: </p>
<input type="text" name="hno">
<p class="lab">Area, Colony, Street, Sector, Village:</p>
<input type="text" name="sector">
<p class="lab">Landmark e.g. near apollo hospital: </p>
<input type="text" name="landmark">
<p class="lab">Town/City: </p>
<input type="text" name="city">
<p class="lab">State: </p>
<input type="text" name="state">
<p class="lab">Country: </p>
<input type="text" name="country">
<input type="submit"  class="sub" value="Change Shipping Address" style="padding: 10px;border-radius: 5px;background: #004445;color: white;">
</div>
</form>

 
  </div>

</div>


<div id="myPassword" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  
    <span class="close3"> &times;</span>
    <br>
    
    <form action="${pageContext.request.contextPath}/EditCustomerPassword" method="post">
    
    <p style="text-align: center;font-size: 25px;color:#004445;">Current Password</p>
    <p style="text-align: center;margin-top: 5px;"><input type="password" name="Password" style="padding:5px 5px;width: 350px;border-radius: 5px;"></p>
    <br>
    <p style="text-align: center;font-size: 25px;color:#004445;">New Password</p>
    <p style="text-align: center;margin-top: 5px;"><input type="password" name="Confirm" style="padding:5px 5px;width: 350px;border-radius: 5px;"></p>
    <br>
    <p style="text-align: center;font-size: 25px;color:#004445;">Confirm New Password</p>
    <p style="text-align: center;margin-top: 5px;"><input type="password" name="confirmPass" style="padding:5px 5px;width: 350px;border-radius: 5px;"></p>
    <br>
    <p style="text-align: center; "><input class="btn" type="submit" value="Change Password" style="width: 30%;background:#004445;color: white;"></p>
   
   
    </form>
 
  </div>

</div>

</div>

<script>
var modal = document.getElementById("myModal");

var btn = document.getElementById("myBtn");

var modal1 = document.getElementById("myMobile");

var btn1 = document.getElementById("mymob");

var modal2= document.getElementById("myAddress");

var btn2 = document.getElementById("myAddr");

var modal3= document.getElementById("myPassword");

var btn3 = document.getElementById("myPass");

var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close1")[0];
var span2 = document.getElementsByClassName("close2")[0];
var span3 = document.getElementsByClassName("close3")[0];
btn.onclick = function() {
  modal.style.display = "block";
}

span.onclick = function() {
  modal.style.display = "none";
}

btn1.onclick = function() {
	  modal1.style.display = "block";
	}

span1.onclick = function() {
	  modal1.style.display = "none";
	}
	
btn2.onclick = function() {
	 modal2.style.display = "block";
		}

span2.onclick = function() {
	 modal2.style.display = "none";
		}
btn3.onclick = function() {
    modal3.style.display = "block";
			}

span3.onclick = function() {
	 modal3.style.display = "none";
			}
		
</script>
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