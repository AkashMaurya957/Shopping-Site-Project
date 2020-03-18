package com.shoppingsiteproductupload.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.shoppingsite.productupload.bean.feedback;


public class CustomerFeedBack {

	
	
	
	public static List<feedback> getProductReview(String productID)
	{
		
		

		List<feedback> list = new ArrayList<feedback>();
	
		
		try {
			Connection con=ProductDoa.getConnection();
			PreparedStatement ps = con.prepareStatement("Select * from feedback where ProductID=?");
			ps.setString(1,productID);
		    ResultSet rs=ps.executeQuery();  
	        while(rs.next()) {
	            	
	            feedback bean= new feedback();
	            
	            bean.setCustomerEmail(rs.getString(1));
	            bean.setCustomerName(rs.getString(2));
	            bean.setComment(rs.getString(5));
	            bean.setRating(rs.getString(6));
	            
	            System.out.println(rs.getString(6));
	            list.add(bean);
	        	
	            	
	            }
			
			
		}
		catch (Exception e) {
			System.out.print(e);
		}
		
		return list;
		
		
		
	}
	
	
	
	
	public static int ProductReview(feedback bean)
	{
	
		int i=0;
		try {
			Connection con=ProductDoa.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into feedback(CutomerEmail,CustomerName,Category,ProductID,userComment,rating) values(?,?,?,?,?,?)");
		
		    ps.setString(1,bean.getCustomerEmail());
		    ps.setString(2,bean.getCustomerName());
		    ps.setString(3,bean.getCategory());
		    ps.setString(4,bean.getProductID());
		    ps.setString(5,bean.getComment());
		    ps.setString(6,bean.getRating());
		      
	        i=ps.executeUpdate();    
	        
			
		}
		catch (Exception e) {
			System.out.print(e);
		}
		
			
	return i;
		
	}
	
	
		
	
}
