<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Upload Laptop and Desktop details</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/laptopanddesktop.css">

</head>
<body>
        <header>
        <%@include file="header.jsp" %>
        </header>
 <div class="formdesign">
        <form action=""  method=""  class="formdiv">
        
        <h2>Laptop and Desktop </h2> 
       <div class="container">
       <i class="lablename">Category</i> &nbsp&nbsp <select name="category" style="padding:10px 20px;">
       <option value="Mobile">Mobile</option>
       <option value="Clothes">Clothes</option>
       <option value="Desktop & Laptop">Desktop & Laptop</option>
              </select>
       </div>
        
        <div class="container">
       <label class="lablename">Brand Name</label> &nbsp&nbsp<input  type="text" name="brandname" required>
       </div>
       
       <div class="container">
       <label class="lablename">Model</label> &nbsp&nbsp<input  type="text" name="model" required>
       </div>
       
       <div class="container">
       <label class="lablename">Operating System</label> &nbsp&nbsp<input  type="text" name="os" required>
       </div>
       
       
        <div class="container">
       <label class="lablename">Processor</label> &nbsp&nbsp<input  type="number" name="camera" required>&nbsp<label class="lab">MP</label>
       </div>
       
       <div class="container">
       <label class="lablename">RAM</label> &nbsp&nbsp<input  type="number" name="ram" required>&nbsp<label class="lab">GB</label>
       </div>
       
        <div class="container">
       <label class="lablename">Hardisk</label> &nbsp&nbsp<input  type="text" name="memory" required>
       </div>
       
       <div class="container">
       <label class="lablename">Sold By</label> &nbsp&nbsp<input  type="text" name="sldby" required>
       </div>
       
       <div class="container">
       <label class="lablename">Wireless communication technologies</label> &nbsp&nbsp<input  type="text" name="technoogies" required>
       </div>
       
       
       
        <div class="container">
       <label class="lablename">Display Size</label> &nbsp&nbsp<input  type="number" name="displaysize" required>&nbsp<label class="lab">inches</label>
       </div>
       
       <div class="container">
       <label class="lablename">Weight</label> &nbsp&nbsp<input  type="number" name="weight" required>&nbsp<label class="lab">gram</label>
       </div>
       
       <div class="container">
       <label class="lablename">color</label> &nbsp&nbsp<input  type="text" name="color" required>
       </div>
       
       
       <div class="container">
       <label class="lablename">Battery Backup</label>&nbsp&nbsp <input  type="number" name="battery" required>
       </div>
       
       <div class="container">
       <label class="lablename">Whats in the box</label>&nbsp &nbsp<textarea  type="text" name="box" required></textarea>
       </div>
       
    
       
        <div class="container">
       <label class="lablename">Special Features</label> &nbsp&nbsp<textarea  type="text" name="specialfeatures" required></textarea>
       </div>
       
        <div class="container">
       <label class="lablename">Warrenty Description</label> &nbsp&nbsp<textarea  type="text" name="warrenty" required></textarea>
       </div>
       
       <div class="container">
       <label class="lablename">Product Image 1</label> &nbsp&nbsp<input  type="file" name="image2" required>
       </div>
       
       <div class="container">
       <label class="lablename">Product Image 2</label> &nbsp&nbsp<input  type="file" name="image2" required>
       </div>
       
       <div class="container">
       <label class="lablename">Product Image 3</label> &nbsp&nbsp<input  type="file" name="image3" required>
       </div>
       
       <div class="container upload">
       <a  href="" class="btnsub btn">Upload Product</a>
       </div>
       
       
        
        
        </form>
        </div>
  
   
        
        
         <footer>
         <%@ include file="footer.jsp"%>
         </footer>  
</body>
</html>