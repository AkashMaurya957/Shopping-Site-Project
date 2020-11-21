<%@page import="com.shoppingsiteproductupload.dao.VendorDao"%>
<%@page import="com.shoppingsite.productupload.bean.VendorRegisteration"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin </title>

</head>
<body>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 


<%

List<VendorRegisteration> list7=VendorDao.getVendor();
request.setAttribute("list7",list7);


%>
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
<td>${bean.getName()}</td>

<td><button id="blockVendor"  data-vendorpid="${bean.getEmail()}" data-p="${bean.getBlockUnblock()}" >${bean.getBlockUnblock()}</button></td>
</tr>
</c:forEach>	

</table>
</body>
</html>