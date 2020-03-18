<%@page import="com.shoppingsiteproductupload.dao.CustomerFeedBack"%>
<%@page import="com.shoppingsite.productupload.bean.feedback"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/productdescription.css">

<title>Insert title here</title>


<script type="text/javascript" src="plugin/jquery-1.9.1.js"></script>
<script type="text/javascript" src="plugin/ui/jquery-ui.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>


$(document).ready(function(){
  $("[data-pid]").click(function(){
   
	  var brandname=$(this).data("pid");
	  var catagory=$(this).data("p");
	 
    $.post("addToCart.jsp",{name:brandname,category:catagory},function(data){
    	
    	$("#msg").html(data);
    	    
    });
    
   });
  
  });


</script>

</head>
<body>
 <%@page import="com.shoppingsite.productupload.*"%>  
<jsp:useBean id="u" class="com.shoppingsite.feedback.Feedback"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>

<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%  

String id=request.getParameter("product"); 
session.setAttribute("productId", id);

String product=(String)session.getAttribute("productId");
System.out.print("oyro"+product);

List<ProductBean> bean=ProductDoa.getProductDetails(product);
request.setAttribute("list",bean);

session.setAttribute("CurrentPage","JSP/ProductView.jsp");

List<feedback> beanReview=CustomerFeedBack.getProductReview(product);
request.setAttribute("list1",beanReview);


%> 

 
<%@ include file = "../JSP/header.jsp" %>

       
  
   <div>

<div class="row">
<div class="column">




<div class="container">
  <div class="mySlides">
  <c:forEach  items="${list}" var="bean">
    <img src="data:image/jpg;base64,${bean.image1}" style="width:100%;height:400px;padding: 0px 200px;">
 </c:forEach>
  </div>

  <div class="mySlides">
    <c:forEach  items="${list}" var="bean">
    <img src="data:image/jpg;base64,${bean.getImage2()}" style="width:100%;height:400px;padding: 0px 200px;">
    </c:forEach>
  </div>

  <div class="mySlides">
    <c:forEach  items="${list}" var="bean">
    <img src="data:image/jpg;base64,${bean.getImage3()}" style="width:100%;height:400px;padding: 0px 200px;">
    </c:forEach>
  </div>
  
    
 

  <div class="caption-container">
    <p id="caption"></p>
  </div>

  <div class="row" style="display: flex;">
    <div class="column">
    <c:forEach  items="${list}" var="bean">
      <img class="demo cursor" src="data:image/jpg;base64,${bean.getImage1()}" style="width:50%;height:150px;" onclick="currentSlide(1)" >
   </c:forEach>
    </div>
   
    <div class="column">
    <c:forEach  items="${list}" var="bean">
      <img class="demo cursor" src="data:image/jpg;base64,${bean.getImage2()}" style="width:50%;height:150px;" onclick="currentSlide(2)" >
   </c:forEach>
    </div>
      
    <div class="column">
    <c:forEach  items="${list}" var="bean">
      <img class="demo cursor" src="data:image/jpg;base64,${bean.getImage3()}" style="width:50%;height:150px;" onclick="currentSlide(3)" >
 
   </c:forEach>
    </div>
  </div>
  
 <div class="desc">
 <br> <br>
 <p style="font-size: 20px;font-style: inherit;">Description</p>
<br> <br>
  <p>${bean.getDescription()}</p>
 </div>
  
   <div>
    <c:forEach  items="${list}" var="bean">
 <form action="${pageContext.request.contextPath}/Feedback?category=${bean.getCategory()}" method="post" style="display: block;">
 <br><br>
    <p>Please rate our Product:</p>
    
<fieldset class="rating">
    <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="Awesome - 5 stars"></label>
    <input type="radio" id="star4half" name="rating" value="4.5" /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
    <input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3" title="Meh - 3 stars"></label>
    <input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
    <input type="radio" id="star1half" name="rating" value="1.5" /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    <input type="radio" id="starhalf" name="rating" value=".5" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>

</fieldset>
<br>

<br>
<textarea type="text" name="comment" class="comment"></textarea>
<br>
<br>

<input type="submit" class="btnsub btn" name="sub">


</form>
</c:forEach>
</div>
  
  
</div>


<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
</script>
    
</div>
 <div class="column">
 <div class="price">
 <c:forEach  items="${list}" var="bean">
<h3>${bean.getBrandName()}  ${bean.getModel()}</h3>
</c:forEach>
<br>
<c:forEach  items="${list}" var="bean">
<h4>Price : ${bean.getPrice()}</h4>
</c:forEach>

</div>
<form action="${pageContext.request.contextPath}/PaymentPage" method="post">

<table>


<tr><td><input type="submit" class="button button1" value="Buy Now"></td>



<td><a href="" name="addtoCart" class="button button1" data-pid="${bean.getProductId()}" data-p="${bean.getCategory()}">Add To Cart</a></td>


</tr>

<tr><td>Quantity:
<select name="quantity">
  <option value="1">1</option>
  <option value="2">2</option>
  <option value="3">3</option>
  <option value="4">4</option>
  <option value="5">5</option>
  <option value="6">6</option>
  <option value="7">7</option>
  <option value="8">8</option>
  <option value="9">9</option>
  <option value="10">10</option>
  <option value="11">11</option>
  <option value="12">12</option>
</select>
</td></tr>

</table>
</form>

<table id="customers">

  <tr>
    
    
  <p class="heading">  Technical Details </p>
    <hr>
   
  </tr>
  
  <tr>
    
    <th>Brandname</th>
     <c:forEach items="${list}" var="bean"> 
    <td>${bean.getBrandName()}</td>
    </c:forEach>
    
  </tr>
  
  <tr>
  
    <th>Model</th>
     <c:forEach items="${list}" var="bean">
    <td>${bean.getModel()}</td>
  </c:forEach>
  </tr>
  
  <tr>
  
    <th>Operating System</th>
    <c:forEach items="${list}" var="bean">
    <td>${bean.getOperatingSystem()}</td>
    </c:forEach>
  </tr>
  
  <tr>
   
    <th>Camera</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getCamera()}</td>
    </c:forEach>
    
  </tr>
  
  <tr>
  
    <th>RAM</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getRam()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>Internal Memory</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getInternalMemory()}</td>
   </c:forEach>
  </tr>
  
  <tr>
  
    <th>Sold By</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getSoldby()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>Wireless Technology</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getWirelessTechnology()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>Dimensions</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getItemdimensions()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>Display Size</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getDisplaysize()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>Weight</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getWeight()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>Color</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean. getColor()}</td>
   </c:forEach>
  </tr>
  
  <tr>
  
    <th>Sim Slot</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getSimslot()}</td>
   </c:forEach>
  </tr>
  
  <tr>
  
    <th>Battery</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getBatteryPower()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>What's in Box</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getWhatinBox()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>Special Features</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getSpecialfeatures()}</td>
   </c:forEach>
  </tr>
  <tr>
  
    <th>Warrenty</th>
    <c:forEach  items="${list}" var="bean">
    <td>${bean.getWarrenty()}</td>
   </c:forEach>
  </tr>
  
 
</table>
   </div>
   
 </div>	
 <hr>
 <br>

   <div id="UserComments">
   
    <h3 class="CustomerReview">Customers review about this product</h3>
    <br>
    <hr>
    <br>
    
   <c:forEach items="${list1}" var="beanReview">
   
   <div style="display: flex;"> 
  
  <img src="../Icons/userIcon.png" style="height: 50px;width: 50px; ">
  <div>
  &nbsp&nbsp<p>${beanReview.getCustomerName()}</p>
  </div>
  
  </div>
  <p style="margin-left: 50px;">${beanReview.getCustomerEmail()}</p>
  <p style="margin-left: 50px;">${beanReview.getComment()}</p>
  <p style="margin-left: 50px;">${beanReview.getRating()}</p>
  
  
     <br><hr><br>
   </c:forEach>
  </div>
 
  </div>
<%@ include file = "footer.jsp" %>
</body>
</html>