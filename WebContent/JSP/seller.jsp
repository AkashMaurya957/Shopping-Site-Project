<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Register</title>
<link rel="stylesheet" type="text/CSS" href="${pageContext.request.contextPath}/CSS/seller.css">
</head>
<body>
<header>
<%@include file="header.jsp" %>
</header>

<div class="row">

   <div class="column side">
    
  </div>
   <div class="column middle">
   <div class="container">
   <h1><b>Seller Register</b></h1><br>
   
  <form action="${pageContext.request.contextPath}/sellerRegisteration" method="post">
  
  <div  class="row" >
    <div class="col-25">
      <label for="name">Name:</label>
    </div>
    <div class="col-50">
      <input type="text" id="name" name="name" placeholder="Name" required class="inputfield">
    </div>
  </div>
  <div  class="row">
    <div class="col-25">
      <label for="number">Mobile Number:</label>
    </div>
    <div class="col-50">
      <input type="number" id="m_number" name="mobile_no" placeholder="Mobile Number" required class="inputfield">
    </div>
  </div>
<div  class="row">
    <div class="col-25">
      <label for="id">Email Id:</label>
    </div>
    <div class="col-50">
      <input type="email" id="email" name="email" placeholder="Email" required class="inputfield">
    </div>
  </div>
  
<div  class="row">
    <div class="col-25">
      <label for="gender">Gender:</label>
    </div>
    <div class="col-50">
    <input type="radio" name="gender" value="male"> Male
  <input type="radio" name="gender" value="female"> Female
   </div>
  </div>
<div  class="row" >
    <div class="col-25">
      <label for="address">House Number:</label>
    </div>
    <div class="col-50">
      <input type="text" id="number" name="house_no" placeholder="House Number" required class="inputfield">
    </div>
  </div>
<div  class="row" >
    <div class="col-25">
      <label for="address">Sector:</label>
    </div>
    <div class="col-50">
      <input type="text" id="sector" name="sector" placeholder="Sector" required class="inputfield">
    </div>
  </div>    
<div  class="row" >
    <div class="col-25">
      <label for="address">Area:</label>
    </div>
    <div class="col-50">
      <input type="text" id="area" name="area" placeholder="Area" required class="inputfield">
    </div>
  </div>

  <div  class="row" >
    <div class="col-25">
      <label for="address">City:</label>
    </div>
    <div class="col-50">
      <input type="text" id="Pin" name="city" placeholder="City" required class="inputfield">
    </div>
  </div>
<div  class="row" >
    <div class="col-25">
      <label for="address">State:</label>
    </div>
    <div class="col-50">
      <input type="text" id="State" name="state" placeholder="State" required class="inputfield">
    </div>
  </div>
<div  class="row" >
    <div class="col-25">
      <label for="address">Country:</label>
    </div>
    <div class="col-50">
      <input type="text" id="country" name="country" placeholder="Country" required class="inputfield">
    </div>
  </div>
  <div  class="row" >
    <div class="col-25">
      <label for="address">Pin Number:</label>
    </div>
    <div class="col-50">
      <input type="text" id="Pin" name="pin" placeholder="Pincode" required class="inputfield">
    </div>
  </div>
  
 <div>
 
    <input type="submit" value="Submit">
  </div>
  </form>
</div>
</div>
 <div class="column side">
   </div>
   
   
 
</div>


</body>
</html>