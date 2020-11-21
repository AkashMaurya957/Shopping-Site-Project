<%@page import="com.shoppingsiteproductupload.dao.ProductDoa"%>
<%@page import="com.shoppingsite.productupload.bean.ProductBean"%>
<%@page import="com.shoppingsite.productupload.bean.ReplyBean"%>
<%@page import="com.shoppingsiteproductupload.dao.CustomerFeedBack"%>
<%@page import="com.shoppingsite.productupload.bean.feedback"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reply Section</title>
<link href="https://fonts.googleapis.com/css2?family=Dosis:wght@200&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\CSS\replysection.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

  
  <script type="text/javascript">
   
  function onButtonClick(){
	  document.getElementById('comtsection').className="show";

	  document.getElementById('hidebt').className="want";
	  
	}
  
  </script>
  
  <style type="text/css">
  
  .want{
   display:none;
  }
  
  
  .hide{
  display:none;
}
.show{
  display:block;
}

</style>

</head>
<body>

<%

   String product=(String)session.getAttribute("productId"); 
   String Email=(String)session.getAttribute("Email"); 
   String Username=(String)session.getAttribute("user");
   String commentid =request.getParameter("commentId");
  
   session.setAttribute("commentIdSession", commentid);
   
   String commentemail =request.getParameter("commentemail");
   
   session.setAttribute("commenterEmail", commentemail);
   
   String commentername=request.getParameter("commentername");
   session.setAttribute("commenterbName",commentername);
   
    String comt =(String)session.getAttribute("commentIdSession");
   
 List<feedback> beanReview=CustomerFeedBack.gettReview(comt);
 request.setAttribute("list6",beanReview);
   

List<ReplyBean>   reviewReply = CustomerFeedBack. getReplyReview((String)session.getAttribute("commentIdSession"),(String)session.getAttribute("Email"));
request.setAttribute("list5",reviewReply);

int prod =Integer.parseInt(product);

List<ProductBean> imageget = ProductDoa.getProductImage(prod);
request.setAttribute("list",imageget);


List<feedback> rating=CustomerFeedBack.getTotalProductRating(prod);
request.setAttribute("li",rating);

%>

 
<%@ include file = "../JSP/normalheader.jsp" %>
 
 
<div style="width: 100%;display: flex ;margin: 2%;">

<div style="width:60%;float: left;">

<c:forEach items="${list6}" var="beanReview">

  <div class="viewCustCommt">
  
  <b style="color:#B71C1C;font-size: 20px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Verified Reviewer of Product</b>
   <br><br>
   <div style="display: flex;"> 
  
  <img src="${pageContext.request.contextPath}/Icons/userIcon.png" class="imageico">
 
   &nbsp&nbsp<b class="name">${beanReview.getCustomerName()}</b>  <p style="color: white;background-color: #0b6623;padding: 5px;margin-left: 50px;border-radius: 10px;">${beanReview.getRating()}&nbsp<i style="Color:white" class="fas fa-star"></i></p>
  
  </div>
  
   <p style="margin-left: 50px;">${beanReview.getComment()}</p>
  
 </div>

</c:forEach>

<br>
<form action="${pageContext.request.contextPath}/AddCommentReply?commentId=<%=session.getAttribute("commentIdSession") %>" method="post">

<div id="comtsection" class="hide">

<textarea rows="5" cols="70" name="reply" ></textarea><br><br>
<input type="submit" class="changeStr" value="comment">

</div>

<input type="button" class="changeStr" id="hidebt" value="Want to Add Reply" onclick="onButtonClick()">
</form>


<div class="reviewrep">


showing Comments<br>
<hr>

<c:forEach items="${list5}" var="reviewReply">
<br>
<div style="display: flex;">
  <img src="${pageContext.request.contextPath}/Icons/userIcon.png" class="imageico">
 
<b style="Color:#2C7873;margin-top: 10px;">${reviewReply.getName()}</b>

</div>
<p style="margin-left: 7%;">${reviewReply.getComment()}</p>
<br>
<hr>
z
</c:forEach>
</div>

</div>

<div style="width: 35%;float:right;margin-left: 10%;">

<c:forEach items="${list}" var="imageget"> 
<div class="column">  


<div style="display: flex;">
  <img src="data:image/jpg;base64,${imageget.image1}" style="width:40%;height: 200px;">
 
   <div style="margin-left: 20px;">
   <br>
  <h3>${imageget.getBrandName()}&nbsp&nbsp&nbsp${imageget.model}</h3>
 
    
   </div>

</div>
</div>
</c:forEach>
    
    
<c:forEach items="${li}" var="rating">

 <h2>Product Rating ${rating.getShowRating()} out of 5</h2>
   
 <div style="display: flex;">

     <div>
     
    <b>${rating.getFiveStar()} %</b><br><br>
    <b>${rating.getFourStar()} %</b><br><br>
    <b>${rating.getThreeStar()} %</b><br><br>
    <b>${rating.getTwoStar()} %</b><br><br>
    <b>${rating.getOnestar()} %</b>
    
    </div>
    
  
  <div>
   &nbsp&nbsp<progress id="file" value=" ${rating.getFiveStar()}" max="100"> </progress>&nbsp&nbsp<b>5 star</b>
<br><br>
   &nbsp&nbsp<progress id="file" value="${rating.getFourStar()}" max="100"></progress> &nbsp&nbsp<b>4 star</b>
<br><br>
   &nbsp&nbsp<progress id="file" value="${rating.getThreeStar()}" max="100"> </progress>&nbsp&nbsp<b>3 star</b>
<br><br>
   &nbsp&nbsp<progress id="file" value="${rating.getTwoStar()}" max="100"> </progress> &nbsp&nbsp<b>2 star</b>
<br><br>
   &nbsp&nbsp<progress id="file" value="${rating.getOnestar()}" max="100"> </progress>&nbsp&nbsp <b>1 star</b>
</div>

</div>
</c:forEach>
</div>

</div>


</body>
</html>