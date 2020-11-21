package com.shoppingsiteproductupload.dao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.mysql.cj.Session;
import com.shoppingsite.productupload.bean.ProductBean;
import com.shoppingsite.productupload.bean.UserDetails;

public class CustomerInfoDao {

	
	
	public static int SaveUserDetails(UserDetails user)
	{
	int i=0;	
	
	
	try {

	    
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("update UserDetails set fullname=? ,mobilenumber=? ,houseno=? ,Sector=?,Area =?  ,city=? ,state=? ,country=?,AreaPin=? where email =?");
		ps.setString(1,user.getFullName());
		ps.setString(2, user.getMobilenumber());
		ps.setString(3,user.getHno());
		ps.setString(4,user.getSector());
		ps.setString(5, user.getLandmark());
		ps.setString(6,user.getCity());
		ps.setString(7,user.getState());
		ps.setString(8,user.getCountry());
		ps.setString(9, user.getPincode());
		ps.setString(10, user.getEmail());
		
		 i=ps.executeUpdate();  
		
		
	}catch(Exception e)
	{
		
		System.out.print(e);
	}
	
		return i;
		
		
		
	}
	
	public static List<UserDetails> getUserDetails( String id)
	{
		
		
		List<UserDetails> list = new ArrayList<UserDetails>();
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from UserDetails where Email=?");  
			  ps.setString(1,id); 
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  

	            	UserDetails bean = new UserDetails();
	           
	            	bean.setEmail(id);
	            	
	            	bean.setName(rs.getString(2));
	            	bean.setMobile(rs.getString(4));
	            	bean.setHno(rs.getString(8));
	            	bean.setSector(rs.getString(9));
	            	bean.setCountry(rs.getString(10));
	            	bean.setState(rs.getString(11));
	            	bean.setCity(rs.getString(12));
	            	bean.setLandmark(rs.getString(13));
	            	bean.setPincode(rs.getString(14));
	            	
	            	list.add(bean);
	            	
	            	
	            	 
	               
	                
	                
			con.close();
	            }}catch(Exception e)
		{
			
			
		}
		return list;
		
		
		
		}


	public static UserDetails getUserDetail( String id)
	{
		
		UserDetails bean =null;
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from UserDetails where Email=?");  
			  ps.setString(1,id); 
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  

	            	
	                bean = new UserDetails();
	            	bean.setEmail(rs.getString(1));
	            	bean.setName(rs.getString(2));
	            	bean.setPassword(rs.getString(3));
	            	bean.setMobile(rs.getString(4));
	            	bean.setFullName(rs.getString(5));
	            	bean.setMobilenumber(rs.getString(6));
	            	bean.setDateOfRegisteration(rs.getString(7));
	            	bean.setHno(rs.getString(8));
	            	bean.setSector(rs.getString(9));
	            	bean.setLandmark(rs.getString(10));
	            	bean.setCity(rs.getString(11));
	            	bean.setState(rs.getString(12));
	            	bean.setCountry(rs.getString(13));
	            	bean.setPincode(rs.getString(14));
	            
	            	
	            	
	            	 
	               
	                
	                
			con.close();
	            }}catch(Exception e)
		{
			
			
		}
		return bean;
		
		
		
		}



	
	public static List<UserDetails> getUserDetail()
	{
		UserDetails bean = null;
		
		List<UserDetails> list = new ArrayList<UserDetails>();
		
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from UserDetails");  
			
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  

	            	
	            	bean = new UserDetails();
	            	bean.setEmail(rs.getString(1));
	            	bean.setName(rs.getString(2));
	            	bean.setPassword(rs.getString(3));
	            	bean.setMobile(rs.getString(4));
	            	bean.setFullName(rs.getString(6));
	            	bean.setMobilenumber(rs.getString(7));
	            	//bean.setDateOfRegisteration(rs.getString(7));
	            	bean.setBlock(rs.getString(17));
	            	
	            	list.add(bean);
	            	
	            	
	            	 
	               
	                
	                
			
	            }}catch(Exception e)
		{
			System.out.print(e);
			
		}
		return list;
		
		
		
		}

	
	public static int block(String Email,String block)
	{
		int i=0;
		
		
		try {
			
			 
			Connection con = ProductDoa.getConnection();
			PreparedStatement ps=con.prepareStatement("update UserDetails set BlockUnblock=? where Email=?");
			ps.setString(1,block);
			ps.setString(2,Email);
			 i=ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.print(e);
			
		}
		
		return i;
		
		
		
	}
	


	
	public static int blockVendor(String Email,String block)
	{
		int i=0;
		
		
		try {
			
			 
			Connection con = ProductDoa.getConnection();
			PreparedStatement ps=con.prepareStatement("update UserDetails set BlockUnblock=? where Email=?");
			ps.setString(1,block);
			ps.setString(2,Email);
			 i=ps.executeUpdate();
			
		}catch(Exception e)
		{
			System.out.print(e);
			
		}
		
		return i;
		
		
		
	}
	

	
	
	public static int ChangeUserName(UserDetails user)
	{
	int i=0;	
	
	
	try {

	    
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("update UserDetails set name=? where email =?");
		ps.setString(1,user.getName());
		ps.setString(2, user.getEmail());
		
		 i=ps.executeUpdate();  
		
		
	}catch(Exception e)
	{
		
		System.out.print(e);
	}
	
		return i;
		
		
		
	}
	
	public static int ChangeMobileNumber(UserDetails user)
	{
	int i=0;	
	
	
	try {

	    
		Connection con = ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("update UserDetails set mobile=? where email =?");
		ps.setString(1,user.getMobile());
		ps.setString(2, user.getEmail());
		
		 i=ps.executeUpdate();  
		
		
	}catch(Exception e)
	{
		
		System.out.print(e);
	}
	
		return i;
		
		
		
	}
	
	public static int ChangeUserPassword(UserDetails user)
	{
	int i=0;	
	
	
	try {

	    
		Connection con = ProductDoa.getConnection();
	     PreparedStatement ps=con.prepareStatement("select * from  UserDetails where Password=? and email =?");
		ps.setString(1,user.getPassword());
		ps.setString(2, user.getEmail());
		ResultSet rs=ps.executeQuery(); 
		if(rs.next()) {
			
			PreparedStatement ps1=con.prepareStatement("update UserDetails set Password=? where email =?");
			ps1.setString(1,user.getNewPAssword());
			ps1.setString(2, user.getEmail());
			 i=ps1.executeUpdate();
		}
		
		
	}catch(Exception e)
	{
		
		System.out.print(e);
	}
	
		return i;
		
		
		
	}
	
	
}
