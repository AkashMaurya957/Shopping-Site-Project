<%@page import="com.shoppingsiteproductupload.dao.AdminDao"%>
<%@page import="com.shoppingsite.productupload.bean.AdminBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>

*{
  margin:0px;
  padding:0px;
  
}
body{
   
   background-color:#F5F5F5;
   font-size:20px;
   overflow-x:hidden;
   font-family: 'Flamenco', cursive;
   }
.foot{

    padding:40px 20px;
    height:150px;
    width: 100%; 
    background-color:#696969;
     display: flex;
    
       

}

.cnt{
height:20px;
width:0 auto;
border:1 px solid white;

}

.contact{
color: white;
}

.icons{
    color: white;
    float:right;
    margin-left:11%;   
  
    
}

.Know{
color: white;
 margin-left:11%;
}

.seller{
color: white;
 margin-left:11%;
}

.icons li{

display:inline-block;
   list-style:none;
   margin-left:10px;
}


.anchorTag{
text-decoration: none;
color: white;
cursor: pointer;
}

.anchorTag:hover{

color:#ff7b7b;

}

</style>
</head>
<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%
List<AdminBean> list10 = AdminDao.getAdminDetailsForFooter();
request.setAttribute("list10",list10);
%>

  <div  class="foot">
 <c:forEach items="${list10}" var="bean"> 
   <div class="contact">
   <b>Contact with us</b><br>
   <p>Email: ${bean.getEmail()}</p>
   <p>Mobile:${bean.getMobileNumber()}</p>
  
   </div> 
   
<div class="icons">
<b class="contact" style="color:white;">Connect With us</b><br>
<a href="${bean.getFacebookPage()}" class="anchorTag">Facebook</a><br>
<a href="${bean.getTwitterPage()}" class="anchorTag">Twitter</a><br>
<a href="${bean.getInstagramPage()}" class="anchorTag">Instagram</a>
</div>

<div class="Know">
<b>Get To Know Us</b><br>
<a class="anchorTag" href="${pageContext.request.contextPath}/JSP/aboutSection.jsp">About Us</a>

</div>

<div class="seller">
<b>	Make Money with Us</b><br>
<a class="anchorTag" href="${pageContext.request.contextPath}/JSP/seller.jsp">Sell on Shopping Bazzar</a>

</div>
</c:forEach>
</div>

</body>
</html>