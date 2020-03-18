<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Payment</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/CSS" href="${pageContext.request.contextPath}/CSS/payment.css">



</head>
<body>
<header>
<%@include file="normalheader.jsp" %>
</header>

<%

String id=(String)session.getAttribute("productId"); 

if(session.getAttribute("user")==null)
{

	response.sendRedirect("../HTML/Login.html");
	
}

%>
<div class="row">
   <div class="column side">
    
  </div>
   <div class="column middle">
   <div class="container">
   <h1><img src="${pageContext.request.contextPath}\Icons\pyment.jpeg"><b>Payment Details</b></h1></br>
   
  
  
  <form action="${pageContext.request.contextPath}/Payment?product=<%=id %>" method="post">
  <div  class="row" >
    <div class="col-25">
      <label for="cardno">Card Number:</label>
    </div>
    <div class="col-50">
      <input type="text" id="number" name="cardnumber" placeholder="Card Number.." required>
    </div>
  </div>
  <div  class="row">
    <div class="col-25">
      <label for="name">Account Holder Name:</label>
    </div>
    <div class="col-50">
      <input type="text" id="Aname" name="Holdername" placeholder="Account Holder name.." required >
    </div>
  </div>
<div  class="row">
    <div class="col-25">
      <label for="cvv">CVV:</label>
    </div>
    <div class="col-50">
      <input type="text" id="cvv" name="cvv" placeholder="cvv.." required>
    </div>
  </div>
<div  class="row">
    <div class="col-25">
      <label for="date">Expiry Date:</label>
    </div>
    <div class="col-50">
      <input type="date" id="date" name="date" placeholder="Expiry Date.." required>
    </div>
  </div>
<%
if(request.getParameter("sub")!=null)
{

%>



<p style="color:red">You Enter Incorrect Details</p>
<%
}

%>
    

 <div>
    <input type="submit" value="Submit" name="sub">
  </div>
  </form>
</div>
</div>
 <div class="column side">
   </div>
</div>


  
</body>
</html>
