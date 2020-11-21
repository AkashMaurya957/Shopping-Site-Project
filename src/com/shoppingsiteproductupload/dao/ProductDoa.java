package com.shoppingsiteproductupload.dao;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.shoppingsite.productupload.bean.Cart;
import com.shoppingsite.productupload.bean.OrderHistoryBean;
import com.shoppingsite.productupload.bean.PlaceOrder;
import com.shoppingsite.productupload.bean.ProductBean;
import com.shoppingsite.productupload.bean.UserDetails;
import com.shoppingsite.productupload.bean.feedback;

public class ProductDoa {
	
	public static Connection getConnection(){  
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.jdbc.Driver");  
	        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingbazzar","root","akash1996");  
	   
	    }catch(Exception e){
	    	System.out.println(e);
	    	}  
	    return con; 
	    
	   }  
	
	public static int save(ProductBean u){  
	    int i=0;  
	    
		String image1 = u.getImage1();
		String image2 = u.getImage2();
		String image3 = u.getImage3();
		
		
       File image=new File("F:\\"+image1);
       File imagee1=new File("F:\\"+image2);
       File imagee2=new File("F:\\"+image3);
       

	    try{  
	    	
	    	
	        Connection con=ProductDoa.getConnection();  
	        PreparedStatement ps=con.prepareStatement( "insert into mobile(BrandName,Model,Price,OS,Camera,RAM,InternaMemory,SoldBy,WirelessTech,ItemDimension,DisplaySize,weight,color,SimSlot,Battery,WhatInBox,SpecialFeatures,warrenty,Description,FrontImg,Image,Image2,SellerEmail,Quantity) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
	      
	        ps.setString(1,u.getBrandName());  
	        ps.setString(2,u.getModel());  
	        ps.setString(3,u.getPrice());
	        ps.setString(4,u.getOperatingSystem());  
	        ps.setString(5,u.getCamera()); 
	        ps.setString(6,u.getRam());
	        ps.setString(7,u.getInternalMemory()); 
	        ps.setString(8,u.getSoldby()); 
	        ps.setString(9,u.getWirelessTechnology()); 
	        ps.setString(10,u.getItemdimensions()); 
	        ps.setString(11,u.getDisplaysize()); 
	        ps.setString(12,u.getWeight()); 
	        ps.setString(13,u.getColor()); 
	        ps.setString(14,u.getSimslot()); 
	        ps.setString(15,u.getBatteryPower()); 
	        ps.setString(16,u.getWhatinBox()); 
	        ps.setString(17,u.getSpecialfeatures()); 
	        ps.setString(18,u.getWarrenty());
	        ps.setString(19,u.getDescription());
	        
	        
	        FileInputStream fis=new FileInputStream(image);
	        
	        ps.setBinaryStream(20, (InputStream)fis, (int)(image.length()));
	        
           FileInputStream fis1=new FileInputStream(imagee1);
	        
	        ps.setBinaryStream(21, (InputStream)fis1, (int)(imagee1.length()));
	        
            FileInputStream fis2=new FileInputStream(imagee2);
	        
	        ps.setBinaryStream(22, (InputStream)fis2, (int)(imagee2.length()));
	        
	        ps.setString(23,u.getEmail());
	        ps.setString(24,u.getQuantity());
	        i=ps.executeUpdate();  
	    }catch(Exception e){System.out.println(e);}  
	    return i;  
	}  
	




	public static  List<ProductBean> getDataSlider()
	{
	   Blob image = null;
	
		
		List<ProductBean> list = new ArrayList<ProductBean>();
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from mobile where Approve=?");  
			  ps.setString(1,"Accept");
			  
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	                ProductBean bean = new ProductBean();
	                bean.setProductId(Integer.parseInt(rs.getString(1)));
	                bean.setBrandName(rs.getString(2));
	                bean.setProductId(rs.getInt(1));
	                bean.setModel(rs.getString(3));
	                bean.setPrice(rs.getString(4));
	                bean.setCategory(rs.getString(24));
	                bean.setQuantity(rs.getString(26));
	                image = rs.getBlob(21);

	                
	                InputStream inputStream = image.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                bean.setImage1(base64Image);
	                list.add(bean);
	                
	               
	                
	        
	            }
	            }catch(Exception e){
	            	
	            	System.out.print(e);
			
			
		}
		return list;
		
		
		
		}
	
	
	

	public static  List<ProductBean> getProductRequest()
	{
	   Blob image = null;
		
		List<ProductBean> list = new ArrayList<ProductBean>();
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from mobile where Approve=?");  
			  ps.setString(1,"Pending..");
			  
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	                ProductBean bean = new ProductBean();
	                bean.setProductId(Integer.parseInt(rs.getString(1)));
	                bean.setBrandName(rs.getString(2));
	                bean.setProductId(rs.getInt(1));
	                bean.setModel(rs.getString(3));
	                bean.setPrice(rs.getString(4));
	                bean.setCategory(rs.getString(24));
	                bean.setQuantity(rs.getString(26));
	                image = rs.getBlob(21);

	                
	                InputStream inputStream = image.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                bean.setImage1(base64Image);
	                list.add(bean);
	                
	               
	                
	        
	            }
	            }catch(Exception e){
	            	
	            	System.out.print(e);
			
			
		}
		return list;
		
		
		
		}
	
	



	public static List<ProductBean> getProductDetails( String id)
	{
		
		ProductBean bean = null;
		Blob image,image1,image2 = null;
		byte[ ] imgData = null ;
		
		List<ProductBean> list = new ArrayList<ProductBean>();
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from mobile where productId=?");  
			  ps.setInt(1,Integer.parseInt(id)); 
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	                bean = new ProductBean();
	                bean.setProductId(rs.getInt(1));
	                bean.setBrandName(rs.getString(2));
	                bean.setModel(rs.getString(3));
	                bean.setPrice(rs.getString(4));
	                bean.setOperatingSystem(rs.getString(5));
	                bean.setCamera(rs.getString(6));
	                bean.setRam(rs.getString(7));
	                bean.setInternalMemory(rs.getString(8));
	                bean.setSoldby(rs.getString(9));
	                bean.setWirelessTechnology(rs.getString(10));
	                bean.setItemdimensions(rs.getString(11));
	                bean.setDisplaysize(rs.getString(12));
	                bean.setWeight(rs.getString(13));
	                bean.setColor(rs.getString(14));
	                bean.setSimslot(rs.getString(15));
	                bean.setBatteryPower(rs.getString(16));
	                bean.setWhatinBox(rs.getString(17));
	                bean.setSpecialfeatures(rs.getString(18));
	                bean.setWarrenty(rs.getString(19));
	                bean.setDescription(rs.getString(20));
	           
	                image = rs.getBlob(21);
	                image1 = rs.getBlob(22);
	                image2 = rs.getBlob(23);
	                bean.setCategory(rs.getString(24));
	                
	                /*First image*/
	                InputStream inputStream = image.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                
	                
	                /*Second Image*/
	                InputStream inputStream1 = image1.getBinaryStream();
	                ByteArrayOutputStream outputStream1 = new ByteArrayOutputStream();
	                byte[] buffer1 = new byte[4096];
	                int bytesRead1 = -1;
	                 
	                while ((bytesRead1 = inputStream1.read(buffer1)) != -1) {
	                    outputStream1.write(buffer1, 0, bytesRead1);                  
	                }
	                 
	                byte[] imageBytes1 = outputStream1.toByteArray();
	                String base64Image1 = Base64.getEncoder().encodeToString(imageBytes1);
	                 
	               /*Third image*/
	                InputStream inputStream2 = image2.getBinaryStream();
	                ByteArrayOutputStream outputStream2 = new ByteArrayOutputStream();
	                byte[] buffer2 = new byte[4096];
	                int bytesRead2 = -1;
	                 
	                while ((bytesRead2 = inputStream2.read(buffer2)) != -1) {
	                    outputStream2.write(buffer2, 0, bytesRead2);                  
	                }
	                 
	                byte[] imageBytes2 = outputStream2.toByteArray();
	                String base64Image2 = Base64.getEncoder().encodeToString(imageBytes2);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                bean.setImage1(base64Image);
	                bean.setImage2(base64Image1);
	                bean.setImage3(base64Image2);
	                list.add(bean);
	                
	               
	                
	                
			con.close();
	            }}catch(Exception e)
		{
			
			
		}
		return list;
		
		
		
		}

	
	public static ProductBean getProductDetail( int id)
	{
		
		ProductBean bean = null;
		Blob image,image1,image2 = null;
		byte[ ] imgData = null ;
		
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from mobile where productId=?");  
			  ps.setInt(1,id); 
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	                bean = new ProductBean();
	                bean.setProductId(rs.getInt(1));
	                bean.setBrandName(rs.getString(2));
	                bean.setModel(rs.getString(3));
	                bean.setPrice(rs.getString(4));
	                bean.setOperatingSystem(rs.getString(5));
	                bean.setCamera(rs.getString(6));
	                bean.setRam(rs.getString(7));
	                bean.setInternalMemory(rs.getString(8));
	                bean.setSoldby(rs.getString(9));
	                bean.setWirelessTechnology(rs.getString(10));
	                bean.setItemdimensions(rs.getString(11));
	                bean.setDisplaysize(rs.getString(12));
	                bean.setWeight(rs.getString(13));
	                bean.setColor(rs.getString(14));
	                bean.setSimslot(rs.getString(15));
	                bean.setBatteryPower(rs.getString(16));
	                bean.setWhatinBox(rs.getString(17));
	                bean.setSpecialfeatures(rs.getString(18));
	                bean.setWarrenty(rs.getString(19));
	                bean.setDescription(rs.getString(20));
	                bean.setCategory(rs.getString(24));
	                bean.setEmail(rs.getString(25));
		                
	                image = rs.getBlob(21);
	                image1 = rs.getBlob(22);
	                image2 = rs.getBlob(23);

	                /*First image*/
	                InputStream inputStream = image.getBinaryStream();
	                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
	                byte[] buffer = new byte[4096];
	                int bytesRead = -1;
	                 
	                while ((bytesRead = inputStream.read(buffer)) != -1) {
	                    outputStream.write(buffer, 0, bytesRead);                  
	                }
	                 
	                byte[] imageBytes = outputStream.toByteArray();
	                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	                
	                
	                /*Second Image*/
	                InputStream inputStream1 = image1.getBinaryStream();
	                ByteArrayOutputStream outputStream1 = new ByteArrayOutputStream();
	                byte[] buffer1 = new byte[4096];
	                int bytesRead1 = -1;
	                 
	                while ((bytesRead1 = inputStream1.read(buffer1)) != -1) {
	                    outputStream1.write(buffer1, 0, bytesRead1);                  
	                }
	                 
	                byte[] imageBytes1 = outputStream1.toByteArray();
	                String base64Image1 = Base64.getEncoder().encodeToString(imageBytes1);
	                 
	               /*Third image*/
	                InputStream inputStream2 = image2.getBinaryStream();
	                ByteArrayOutputStream outputStream2 = new ByteArrayOutputStream();
	                byte[] buffer2 = new byte[4096];
	                int bytesRead2 = -1;
	                 
	                while ((bytesRead2 = inputStream2.read(buffer2)) != -1) {
	                    outputStream2.write(buffer2, 0, bytesRead2);                  
	                }
	                 
	                byte[] imageBytes2 = outputStream2.toByteArray();
	                String base64Image2 = Base64.getEncoder().encodeToString(imageBytes2);
	                 
	                 
	                inputStream.close();
	                outputStream.close();
	                bean.setImage1(base64Image);
	                bean.setImage2(base64Image1);
	                bean.setImage3(base64Image2);
	                
	               
	                
	                
			con.close();
	            }}catch(Exception e)
		{
			
			
		}
		return bean;
		
		
		
		}



	public static int CustomerFeedback(feedback u)
	{
	
		
	 int list1 = 0;
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from feedback");  
			 
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
                
	           
		          
		        
	                
	                con.close();
	            }
	            }catch(Exception e)
		{
			
			
		}
		return list1;
		
		
		
		}

	

	
	public static List<ProductBean> statusForAddProduct(String email)
	{
		
		List<ProductBean> list = new ArrayList<ProductBean>();
		
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("Select * from mobile where sellerEmail=? and (Approve=? or Approve=?) "); 
			  ps.setString(1, email);
			  ps.setString(2, "Pending..");
			  ps.setString(3, "Reject");
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	                ProductBean bean = new ProductBean();
	                bean.setProductId(rs.getInt(1));
	                bean.setBrandName(rs.getString(2));
	                bean.setModel(rs.getString(3));
	                bean.setPrice(rs.getString(4));
	                bean.setOperatingSystem(rs.getString(5));
	                bean.setCamera(rs.getString(6));
	                bean.setRam(rs.getString(7));
	                bean.setInternalMemory(rs.getString(8));
	                bean.setSoldby(rs.getString(9));
	                bean.setWirelessTechnology(rs.getString(10));
	                bean.setItemdimensions(rs.getString(11));
	                bean.setDisplaysize(rs.getString(12));
	                bean.setWeight(rs.getString(13));
	                bean.setColor(rs.getString(14));
	                bean.setSimslot(rs.getString(15));
	                bean.setBatteryPower(rs.getString(16));
	                bean.setWhatinBox(rs.getString(17));
	                bean.setSpecialfeatures(rs.getString(18));
	                bean.setWarrenty(rs.getString(19));
	                bean.setDescription(rs.getString(20));
	                bean.setCategory(rs.getString(24));
	                bean.setQuantity(rs.getString(26));
	                bean.setApprovalstatus(rs.getString(28));
	                
	                
	                list.add(bean);
	                
	            }
			
			   
		}catch(Exception e)
		{
			
			
		}
		
		return list;
		
		
	}

	

	public static List<ProductBean> Products(String email)
	{
		
		List<ProductBean> list = new ArrayList<ProductBean>();
		
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("Select * from mobile where sellerEmail=? and Approve=?"); 
			  ps.setString(1, email);
			  ps.setString(2, "Accept");
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	                ProductBean bean = new ProductBean();
	                bean.setProductId(rs.getInt(1));
	                bean.setBrandName(rs.getString(2));
	                bean.setModel(rs.getString(3));
	                bean.setPrice(rs.getString(4));
	                bean.setOperatingSystem(rs.getString(5));
	                bean.setCamera(rs.getString(6));
	                bean.setRam(rs.getString(7));
	                bean.setInternalMemory(rs.getString(8));
	                bean.setSoldby(rs.getString(9));
	                bean.setWirelessTechnology(rs.getString(10));
	                bean.setItemdimensions(rs.getString(11));
	                bean.setDisplaysize(rs.getString(12));
	                bean.setWeight(rs.getString(13));
	                bean.setColor(rs.getString(14));
	                bean.setSimslot(rs.getString(15));
	                bean.setBatteryPower(rs.getString(16));
	                bean.setWhatinBox(rs.getString(17));
	                bean.setSpecialfeatures(rs.getString(18));
	                bean.setWarrenty(rs.getString(19));
	                bean.setDescription(rs.getString(20));
	                bean.setCategory(rs.getString(24));
	                bean.setQuantity(rs.getString(26));
	                bean.setApprovalstatus(rs.getString(28));
	                
	                
	                list.add(bean);
	                
	            }
			
			   
		}catch(Exception e)
		{
			
			
		}
		
		return list;
		
		
	}

	
	

public static int deleteProduct(String productId)
{
	int i=0;
	
	try
	{
		
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("delete from mobile where ProductId =?");
		ps.setInt(1,Integer.parseInt(productId));
		
	  i=ps.executeUpdate();
	  
	 
	  con.close();
		
		
	}catch(Exception e)
	{
		
		System.out.print(e);
	}

	return i;
	
}


public static int AcceptProduct(String productId)
{
	int i=0;
	
	try
	{
		
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("update mobile set Approve=? where ProductId =?");
		ps.setString(1,"Accept");
		ps.setInt(2,Integer.parseInt(productId));
		
	  i=ps.executeUpdate();
	  
	 
	  con.close();
		
		
	}catch(Exception e)
	{
		
		System.out.print(e);
	}

	return i;
	
}



public static int RejectProduct(String productId)
{
	int i=0;
	
	try
	{
		
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("update mobile set Approve=? where ProductId =?");
		ps.setString(1,"Reject");
		ps.setInt(2,Integer.parseInt(productId));
		
	  i=ps.executeUpdate();
	  
	 
	  con.close();
		
		
	}catch(Exception e)
	{
		
		System.out.print(e);
	}

	return i;
	
}




public static  List<ProductBean> getFilterData(String brand,String low,String high)
{
   Blob image = null;
	
   int LowPrice=Integer.parseInt(low);
   int HighPrice=Integer.parseInt(high);
	List<ProductBean> list = new ArrayList<ProductBean>();
	
	try
	{
		  Connection con=ProductDoa.getConnection(); 
		  PreparedStatement ps=con.prepareStatement("select * from mobile where price >=? AND Price <=?");  
		  ps.setInt(1,LowPrice);
		  ps.setInt(2,HighPrice);
		  ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {  
                ProductBean bean = new ProductBean();
                bean.setProductId(Integer.parseInt(rs.getString(1)));
                bean.setBrandName(rs.getString(2));
                bean.setProductId(rs.getInt(1));
                bean.setModel(rs.getString(3));
                bean.setPrice(rs.getString(4));
                bean.setQuantity(rs.getString(26));
                image = rs.getBlob(21);

                
                InputStream inputStream = image.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                 
                inputStream.close();
                outputStream.close();
                bean.setImage1(base64Image);
                list.add(bean);
                
               
                
        
            }
            }catch(Exception e){
            	
            	System.out.print(e);
		
		
	}
	return list;
	
	
	
	}


public static  int  storeProductIdInCart(Cart bean)
{
	int i =0;
	
	try {
		
		
		Connection con =ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("insert into cartproduct(Tablename,ProductId,Email) values(?,?,?)");
		
		ps.setString(1,bean.getTablename() );
		ps.setString(2,bean.getProductID());
		ps.setString(3,bean.getEmail());
		
		i=ps.executeUpdate();
		
	}catch(Exception e)
	{
		
		System.out.print(e);
	}
	
	return i;
	


}


public static List<ProductBean> getcart( String email)
{
	
	
	List<ProductBean> list = new ArrayList<ProductBean>();
	Blob image;
	
	try {
		
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps = con.prepareStatement("Select * from cartproduct where Email =?");
		ps.setString(1, email);
		ResultSet  rs=ps.executeQuery();
		while(rs.next())
		{
		
		 Cart cart=new Cart();
		 String tablename=rs.getString(1);
		 String name =(rs.getString(2));
		 
		 
		
		 
		 
		 PreparedStatement ps1=con.prepareStatement("select * from mobile where productId=?");  
		
		  ps1.setString(1, name);
		 
		  ResultSet rs1=ps1.executeQuery();  
           while(rs1.next())
           {  
           
          ProductBean bean = new ProductBean();
          bean.setProductId(Integer.parseInt(name));
          bean.setBrandName(rs1.getString(2));
          bean.setModel(rs1.getString(3));
          bean.setPrice(rs1.getString(4));
          image = rs1.getBlob(21);
         

          /*First image*/
          InputStream inputStream = image.getBinaryStream();
          ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
          byte[] buffer = new byte[4096];
          int bytesRead = -1;
           
          while ((bytesRead = inputStream.read(buffer)) != -1) {
              outputStream.write(buffer, 0, bytesRead);                  
          }
           
          byte[] imageBytes = outputStream.toByteArray();
          String base64Image = Base64.getEncoder().encodeToString(imageBytes);
          
         
           
          inputStream.close();
          outputStream.close();
          bean.setImage1(base64Image);
         

          list.add(bean);
               
             
           }
         
		
			
		}
		
	}
	catch(Exception e)
	{
		System.out.print(e);
		
	}
	return list;
	
}

public static int deleteProductFromCart(int ProductID)
{
	int i=0;
	
	try {
		
		Connection con=ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("delete from cartProduct where ProductId='"+ProductID+"'");
	    i=ps.executeUpdate();
	}catch (Exception e) {
		
		System.out.print(e);
	}
	return i;
	
}



public static List<OrderHistoryBean> getPlaceOrder(String email)
{
	
	List<OrderHistoryBean> list=new  ArrayList<OrderHistoryBean>();
	
	Blob image;
	try {
		
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from productorder where customeremail=? and place=?");
		ps.setString(1, email);
		ps.setString(2, "NotPlace");
		 ResultSet rs=ps.executeQuery();  
         while(rs.next())
         {  
        	 
        	 OrderHistoryBean bean= new OrderHistoryBean();
        	 bean.setProductID( rs.getString(3));
        	 bean.setProductName(rs.getString(5));
        	 bean.setPrice(rs.getString(6));
        	 bean.setQuantity(rs.getString(7));
        	 bean.setPurchasedate(rs.getString(8));
        	 bean.setFullName(rs.getString(10));
        	 bean.setMobileNumber(rs.getString(11));
        	 bean.setHouseno(rs.getString(12));
        	 bean.setSector(rs.getString(13));
        	 bean.setLandmark(rs.getString(14));
        	 bean.setCity(rs.getString(15));
        	 bean.setState(rs.getString(16));
        	 bean.setCountry(rs.getString(17));
        	 bean.setPincode(rs.getString(18));
        	 bean.setPaymentMode(rs.getString(19));
        	 bean.setStatus(rs.getString(20));
        	 String place=rs.getString(21);
        	 
        	 if(place.equals("Place"))
        	 {
        		 
        		 bean.setTrack("Out for Delivery"); 
        	 }
        	 else {
        		 
        		 bean.setTrack("Booked");
        	 }
        
        	 
        	 PreparedStatement ps1=con.prepareStatement("select * from mobile where  ProductId=?");
        	 ps1.setString(1, rs.getString(3));
        	 ResultSet rs1=ps1.executeQuery();  
             while(rs1.next())
             {
            	 image = rs1.getBlob(21);
                 

                 /*First image*/
                 InputStream inputStream = image.getBinaryStream();
                 ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                 byte[] buffer = new byte[4096];
                 int bytesRead = -1;
                  
                 while ((bytesRead = inputStream.read(buffer)) != -1) {
                     outputStream.write(buffer, 0, bytesRead);                  
                 }
                  
                 byte[] imageBytes = outputStream.toByteArray();
                 String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                
                  
                 inputStream.close();
                 outputStream.close();
                 bean.setImage1(base64Image);
                

                 list.add(bean);
                      
            	 
            	 
             }
     		
        	 
         }
	}catch(Exception e) {
		
		System.out.print(e);
	}
	return list;
	
}



public static List<OrderHistoryBean> getPlaceOrderHistory(String email)
{
	
	List<OrderHistoryBean> list=new  ArrayList<OrderHistoryBean>();
	
	Blob image;
	try {
		
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from productorder where customeremail=? and place=?");
		ps.setString(1, email);
		ps.setString(2, "Place");
		 ResultSet rs=ps.executeQuery();  
         while(rs.next())
         {  
        	 
        	 OrderHistoryBean bean= new OrderHistoryBean();
        	 bean.setProductID( rs.getString(3));
        	 bean.setProductName(rs.getString(5));
        	 bean.setPrice(rs.getString(6));
        	 bean.setQuantity(rs.getString(7));
        	 bean.setPurchasedate(rs.getString(8));
        	 bean.setFullName(rs.getString(10));
        	 bean.setMobileNumber(rs.getString(11));
        	 bean.setHouseno(rs.getString(12));
        	 bean.setSector(rs.getString(13));
        	 bean.setLandmark(rs.getString(14));
        	 bean.setCity(rs.getString(15));
        	 bean.setState(rs.getString(16));
        	 bean.setCountry(rs.getString(17));
        	 bean.setPincode(rs.getString(18));
        	 bean.setPaymentMode(rs.getString(19));
        	 bean.setStatus(rs.getString(20));
        	 bean.setTrack("Order Delivered");
        	 bean.setDeleiverydate(rs.getString(22));
        	
        
        	 
        	 PreparedStatement ps1=con.prepareStatement("select * from mobile where  ProductId=?");
        	 ps1.setString(1, rs.getString(3));
        	 ResultSet rs1=ps1.executeQuery();  
             while(rs1.next())
             {
            	 image = rs1.getBlob(21);
                 

                 /*First image*/
                 InputStream inputStream = image.getBinaryStream();
                 ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                 byte[] buffer = new byte[4096];
                 int bytesRead = -1;
                  
                 while ((bytesRead = inputStream.read(buffer)) != -1) {
                     outputStream.write(buffer, 0, bytesRead);                  
                 }
                  
                 byte[] imageBytes = outputStream.toByteArray();
                 String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                
                  
                 inputStream.close();
                 outputStream.close();
                 bean.setImage1(base64Image);
                

                 list.add(bean);
                      
            	 
            	 
             }
     		
        	 
         }
	}catch(Exception e) {
		
		System.out.print(e);
	}
	return list;
	
}

public static List<ProductBean> getTotalProductInCart(String Email)
{
	
	List<ProductBean> list = new ArrayList<ProductBean>();
	
	
	try {
		
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("Select count(*) from cartProduct where Email='"+Email+"'");
		
		ResultSet rs=ps.executeQuery();
		
		while(rs.next())
		{
			
			ProductBean bean=new ProductBean();
			String count =rs.getString(1);
			System.out.print(count);
			bean.setTotalInCart(count);
			
			list.add(bean);
			
		}
		
	}catch(Exception e) {
		e.printStackTrace();
		System.out.print(e);
	}
	return list;
	
	
	
}




public static List<ProductBean> getProductImage( int id)
{
	

	Blob image= null;

	List<ProductBean> list = new ArrayList<ProductBean>();
	
	
	try
	{
		  Connection con=ProductDoa.getConnection(); 
		  PreparedStatement ps=con.prepareStatement("select * from mobile where productId=?");  
		  ps.setInt(1,id); 
		  ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {      
            	
            	ProductBean bean = new ProductBean();
            	bean.setBrandName(rs.getString(2));
                bean.setModel(rs.getString(3));
                bean.setPrice(rs.getString(4));
                
                image = rs.getBlob(21);
                
                /*First image*/
                InputStream inputStream = image.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                
                 
                inputStream.close();
                outputStream.close();
                bean.setImage1(base64Image);
                
               
                list.add(bean);
                
                
		
            }
        }
	catch(Exception e)
	{
		
		e.printStackTrace();
        System.out.print("Unable to fetch image");
        
		
	}
	return list;
	
	
	
	}




}


