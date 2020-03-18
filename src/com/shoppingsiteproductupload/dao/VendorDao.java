package com.shoppingsiteproductupload.dao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.shoppingsite.productupload.bean.ProductBean;
import com.shoppingsite.productupload.bean.UserDetails;
import com.shoppingsite.productupload.bean.VendorRegisteration;
import com.shoppingsite.productupload.bean.venderOrder;

public class VendorDao {
	
	
	public static int RegisterVendor(VendorRegisteration bean) {
		
		int i=0;
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		   
		
		try {
			String Vendor="Vendor";
			Connection con=ProductDoa.getConnection();
			PreparedStatement ps=con.prepareStatement("insert into UserDetails(Email,UserName,Password,mobile,Gender,DateOFRegisteration,HouseNo,Sector,country,State,City,Area,AreaPin,UserType) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		    ps.setString(1,bean.getEmail());
		    ps.setString(2,bean.getName());
		    ps.setString(3,"");
		    ps.setString(4,bean.getMobile());
		    ps.setString(5,bean.getGender());
		    ps.setDate(6,sqlDate);
		    ps.setString(7,bean.getHouseNo());
		    ps.setString(8,bean.getSector());
		    ps.setString(9,bean.getArea());
		    ps.setString(10,bean.getCity());
		    ps.setString(11,bean.getState());
		    ps.setString(12,bean.getCountry());
		    ps.setString(13,bean.getPincode());
		    ps.setString(14,Vendor);
		    
		    i=ps.executeUpdate();
			
		}catch(Exception e)
		{
			
		System.out.print(e);	
		}
		return i;
		
		
		
	}

	public static  List<venderOrder> getSellerProductOrder()
	{
		
		List<venderOrder> list = new ArrayList<venderOrder>();
		String cond = "NotPlace";
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from productorder where place = '"+cond+"'");  
			  
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	               venderOrder bean = new venderOrder();
	              
                    bean.setOderId(Integer.toString(rs.getInt(1)));
                    bean.setOrderNumber(rs.getString(2));
                    bean.setProductId(Integer.toString(rs.getInt(3)));
                    bean.setCatgory(rs.getString(4));
                    bean.setProductName(rs.getString(5));
                    bean.setPrice(rs.getString(6));
                    bean.setQuantity(rs.getString(7));
                    bean.setPurchaseDate(rs.getString(8));
                    bean.setCustomeremail(rs.getString(9));
                    bean.setFullName(rs.getString(10));
                    bean.setMobileNumber(rs.getString(11));
                    bean.setHouseNo(rs.getString(12));
                    bean.setSector(rs.getString(13));
                    bean.setLandmark(rs.getString(14));
                    bean.setCity(rs.getString(15));
                    bean.setState(rs.getString(16));
                    bean.setCountry(rs.getString(17));
                    bean.setPincode(rs.getString(18));
                    bean.setStatus(rs.getString(19));
                    bean.setPaymentMode(rs.getString(20));
                    list.add(bean);
	                
		
			}}catch(Exception e)
		{
			
			
		}
		return list;
		
		
		
		}


	

	public static  List<venderOrder> getOrderDelivered()
	{
		
		List<venderOrder> list = new ArrayList<venderOrder>();
		String cond = "Place";
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from productorder where place = '"+cond+"'");  
			  
			  ResultSet rs=ps.executeQuery();  
	            while(rs.next())
	            {  
	               venderOrder bean = new venderOrder();
	              
                    bean.setOderId(Integer.toString(rs.getInt(1)));
                    bean.setOrderNumber(rs.getString(2));
                    bean.setProductId(Integer.toString(rs.getInt(3)));
                    bean.setCatgory(rs.getString(4));
                    bean.setProductName(rs.getString(5));
                    bean.setPrice(rs.getString(6));
                    bean.setQuantity(rs.getString(7));
                    bean.setPurchaseDate(rs.getString(8));
                    bean.setCustomeremail(rs.getString(9));
                    bean.setFullName(rs.getString(10));
                    bean.setMobileNumber(rs.getString(11));
                    bean.setHouseNo(rs.getString(12));
                    bean.setSector(rs.getString(13));
                    bean.setLandmark(rs.getString(14));
                    bean.setCity(rs.getString(15));
                    bean.setState(rs.getString(16));
                    bean.setCountry(rs.getString(17));
                    bean.setPincode(rs.getString(18));
                    bean.setStatus(rs.getString(19));
                    bean.setPaymentMode(rs.getString(20));
                    list.add(bean);
	                
		
			}}catch(Exception e)
		{
			
			
		}
		return list;
		
		
		
		}


	
	public static int updateProductPlace(String id)
	{
		
		int i=0;
		String place="Place";
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
	       
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("update productorder set place=? ,Delivereddate=? where oderid=?");  
			  ps.setString(1,place);
			  ps.setDate(2, sqlDate);
			  ps.setString(3, id);
			   i=ps.executeUpdate();
		}catch(Exception e)
		{
			
			System.out.print(e);
			
		}
		return i;
		
		
		
		}
	
	
	
	public static List<VendorRegisteration> showVendorProfile(String id)
	{
		
		List<VendorRegisteration> list = new ArrayList<VendorRegisteration>();
	
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("select * from UserDetails where Email=?");  
			  ps.setString(1,id);
			  ResultSet rs=ps.executeQuery();
			  
			  while(rs.next())
			  {
				VendorRegisteration bean=new VendorRegisteration();

				bean.setEmail(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setMobile(String.valueOf(rs.getInt(4)));
				bean.setGender(rs.getString(5));
				bean.setDateOFRegisteration(rs.getString(22));
				bean.setHouseNo(rs.getString(8));
				bean.setSector(rs.getString(9));
				bean.setCountry(rs.getString(10));
				bean.setState(rs.getString(11));
				bean.setCity(rs.getString(12));
				bean.setPincode(rs.getString(14));
				
				list.add(bean);
				
				
				
				
				  
				  
			  }
			  
		}catch(Exception e)
		{
			
			
		}
		return list;
		
		
		
		}
	
	public static int updateVendorProfile(String id)
	{
		
		int i=0;
		String place="Place";
		try
		{
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("update UserDetails set place=?  where oderid='"+id+"'");  
			  ps.setString(1,place);
			   i=ps.executeUpdate();
		}catch(Exception e)
		{
			
			
		}
		return i;
		
		
		
		}
	
	
	
    public static List<VendorRegisteration> getVendor()
    {
    	List<VendorRegisteration> list=new ArrayList<VendorRegisteration>();
    	
    	try {
    		
    		
    		
    		Connection con=ProductDoa.getConnection();
    		PreparedStatement ps=con.prepareStatement("select * from UserDetails where VendorStatus='Valid' and UserType='Vendor'");
    		
    		ResultSet rs=ps.executeQuery();
    		
    		while(rs.next())
    		{
    			VendorRegisteration bean = new VendorRegisteration();
    			
    			
    			bean.setEmail(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setMobile(rs.getString(4));
				bean.setGender(rs.getString(5));
				//bean.setDateOFRegisteration(rs.getString(22));
				bean.setHouseNo(rs.getString(8));
				bean.setSector(rs.getString(9));
				bean.setCountry(rs.getString(10));
				bean.setState(rs.getString(11));
				bean.setCity(rs.getString(12));
				bean.setPincode(rs.getString(14));
				bean.setBlockUnblock(rs.getString(17));
    			
    			list.add(bean);
    			
    		}
    		
    		
    	}catch(Exception e)
    	{
    		
    		System.out.print(e);
    	}
    	
    	return list;
    }
	

	
    public static List<VendorRegisteration> getVendorRequest()
    {
    	List<VendorRegisteration> list=new ArrayList<VendorRegisteration>();
    	
    	try {
    		
    		
    		
    		Connection con=ProductDoa.getConnection();
    		PreparedStatement ps=con.prepareStatement("select * from UserDetails where VendorStatus='InValid' and UserType='Vendor'");
    		
    		ResultSet rs=ps.executeQuery();
    		
    		while(rs.next())
    		{
    			VendorRegisteration bean = new VendorRegisteration();

    			bean.setEmail(rs.getString(1));
				bean.setName(rs.getString(2));
				bean.setMobile(rs.getString(4));
				bean.setGender(rs.getString(5));
				bean.setDateOFRegisteration(rs.getString(22));
				bean.setHouseNo(rs.getString(8));
				bean.setSector(rs.getString(9));
				bean.setCountry(rs.getString(10));
				bean.setState(rs.getString(11));
				bean.setCity(rs.getString(12));
				bean.setPincode(rs.getString(14));
				bean.setBlockUnblock(rs.getString(20));
    			
    			list.add(bean);
    			
    		}
    		
    		
    	}catch(Exception e)
    	{
    		
    		System.out.print(e);
    	}
    	
    	return list;
    }
	
	
	public static int getVendorDetails(String email,String Block)
	{
		int i=0;
		
		try
		{
		
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("update UserDetails set BlockUnblock=?  where Email=?");  
			  ps.setString(1,Block);
			  ps.setString(2, email);
			   i=ps.executeUpdate();
			
		}catch(Exception e)
		{
			
			
		}
		return i;
	}
	
	
	public static int AcceptVendor(String email)
	{
		int i=0;
		
		try
		{
		
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("update UserDetails set VendorStatus=?  where Email=?");  
			  ps.setString(1,"Valid");
			  ps.setString(2, email);
			   i=ps.executeUpdate();
			
		}catch(Exception e)
		{
			
			System.out.print(e);
		}
		return i;
	}
	
	

	public static int RejectVendor(String email)
	{
		int i=0;
		
		try
		{
		
			  Connection con=ProductDoa.getConnection(); 
			  PreparedStatement ps=con.prepareStatement("delete from UserDetails  where Email=?");  
			  ps.setString(1,email);
			 
			   i=ps.executeUpdate();
			
		}catch(Exception e)
		{
			
			System.out.print(e);
		}
		return i;
	}
	


    
    		
    

    
    
}
