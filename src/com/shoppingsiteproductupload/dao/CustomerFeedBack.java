package com.shoppingsiteproductupload.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import com.shoppingsite.productupload.bean.ReplyBean;
import com.shoppingsite.productupload.bean.feedback;


public class CustomerFeedBack {

	
	
	
	public static List<feedback> getProductReview(String productID,String eamil)
	{
		
		

		List<feedback> list = new ArrayList<feedback>();
	
		
		try {
			Connection con=ProductDoa.getConnection();
			PreparedStatement ps = con.prepareStatement("Select * from feedback where ProductID=?");
			ps.setString(1,productID);
		    ResultSet rs=ps.executeQuery();  
	        while(rs.next()) {
	            	
	            feedback bean= new feedback();
	            bean.setLoginCustomerMail(eamil);
	            bean.setCustomerEmail(rs.getString(1));
	            bean.setCustomerName(rs.getString(2));
	            bean.setProductID(rs.getString(4));
	            bean.setComment(rs.getString(5));
	            bean.setRating(rs.getString(6));
	            bean.setId(rs.getString(7));
	           
	            list.add(bean);
	        	
	            	
	            }
			
			
		}
		catch (Exception e) {
			System.out.print(e);
		}
		
		return list;
		
		
		
	}
	
	
	
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
	            bean.setId(rs.getString(7));
	           
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
	
	
	
	public static int Reply(ReplyBean bean) {
		
		int i=0;
		
		try {
			
		 Connection con = ProductDoa.getConnection();
		 PreparedStatement ps = con.prepareStatement("insert into reply_section(id,comment,emailId,name) values(?,?,?,?)");
		 ps.setString(1,bean.getId().trim());
		 ps.setString(2,bean.getComment());
		 ps.setString(3,bean.getEmail());
		 ps.setString(4, bean.getName());
			
		  i=ps.executeUpdate();
			
		}catch(Exception e) {
			
			System.out.print(e);
			
		}
		
		return i;
		
	}
	
	

	public static List<feedback> gettReview(String commentId)
	{
		
		System.out.print("Get Id : "+commentId);
		
		

		List<feedback> list = new ArrayList<feedback>();
	
		
		try {
			Connection con=ProductDoa.getConnection();
			PreparedStatement ps = con.prepareStatement("Select * from feedback where id=?");
			ps.setString(1,commentId);
		    ResultSet rs=ps.executeQuery();  
	        while(rs.next()) {
	            	
	            feedback bean= new feedback();
	            
	            bean.setCustomerEmail(rs.getString(1));
	            bean.setCustomerName(rs.getString(2));
	            bean.setComment(rs.getString(5));
	            bean.setRating(rs.getString(6));
	           
	            list.add(bean);
	        	
	            	
	            }
			
			
		}
		catch (Exception e) {
			System.out.print(e);
		}
		
		return list;
		
		
		
	}
	
	
	
	
	public static List<ReplyBean> getReplyReview(String id,String email){
		
		List<ReplyBean> list = new ArrayList<>();
	

		try {
			Connection con=ProductDoa.getConnection();
			PreparedStatement ps = con.prepareStatement("Select * from reply_section where id=?");
			ps.setString(1,id);
		    ResultSet rs=ps.executeQuery();  
	        while(rs.next()) {
	            	
	           ReplyBean bean = new ReplyBean();
	           
	           bean.setReplyID(rs.getString(2));
	           bean.setComment(rs.getString(3));
	           bean.setEmail(rs.getString(4));
	           bean.setName(rs.getString(5));
	           bean.setLoginCustomerEmail(email);
	           
	           
	           System.out.print("Customer Email :"+email);
	           
	           
	           list.add(bean);
	        	
	            	
	            }
			
			
		}
		catch (Exception e) {
			System.out.print(e);
		}
		
	
		
		return list;
		
	} 
		 
	
	
	
	
	public static List<feedback> getTotalProductRating(int ProductID) {
		
	
		List<feedback> list = new ArrayList<>();
		
		
		int five=0,fourhalf=0,four=0,threehalf=0,three=0,twohalf=0,two=0,onehalf=0,one=0,half=0,TotalCount=0;
		
		try {
		
			feedback bean = new feedback();
			Connection con=ProductDoa.getConnection();
			PreparedStatement ps = con.prepareStatement("Select count(*) from feedback where rating='"+5+"' and ProductID=?");
			ps.setInt(1,ProductID);
		    ResultSet rs=ps.executeQuery();  
	        while(rs.next()) {
	          
	        	five = rs.getInt(1);
	        	
	            	
	            }
	        
	        
			PreparedStatement ps1 = con.prepareStatement("Select count(*) from feedback where rating='"+4.5+"' and ProductID=?");
			ps1.setInt(1,ProductID);
		    ResultSet rs1=ps1.executeQuery();  
	        while(rs1.next()) {
	          
	        	fourhalf = rs1.getInt(1);
	        	
	        	
	            }
	        
            PreparedStatement ps2 = con.prepareStatement("Select count(*) from feedback where rating='"+4+"' and ProductID=?");
			ps2.setInt(1,ProductID);
		    ResultSet rs2=ps2.executeQuery();  
	        while(rs2.next()) {
	          
	        	four = rs2.getInt(1);
	        	
	            	
	            }
	        
            PreparedStatement ps3 = con.prepareStatement("Select count(*) from feedback where rating='"+3.5+"' and ProductID=?");
			ps3.setInt(1,ProductID);
		    ResultSet rs3=ps3.executeQuery();  
	        while(rs3.next()) {
	          
	        	threehalf = rs3.getInt(1);
	        	
	            	
	            }

			PreparedStatement ps4 = con.prepareStatement("Select count(*) from feedback where rating='"+3+"' and ProductID=?");
			ps4.setInt(1,ProductID);
		    ResultSet rs4=ps4.executeQuery();  
	        while(rs4.next()) {
	          
	        	three = rs4.getInt(1);
	        	
	            	
	            }

			PreparedStatement ps5 = con.prepareStatement("Select count(*) from feedback where rating='"+2.5+"' and ProductID=?");
			ps5.setInt(1,ProductID);
		    ResultSet rs5=ps5.executeQuery();  
	        while(rs5.next()) {
	          
	        	twohalf = rs5.getInt(1);
	        	
	            	
	            }

			PreparedStatement ps6 = con.prepareStatement("Select count(*) from feedback where rating='"+2+"' and ProductID=?");
			ps6.setInt(1,ProductID);
		    ResultSet rs6=ps6.executeQuery();  
	        while(rs6.next()) {
	          
	        	two = rs6.getInt(1);
	        	
	            	
	            }

			PreparedStatement ps7 = con.prepareStatement("Select count(*) from feedback where rating='"+1.5+"' and ProductID=?");
			ps7.setInt(1,ProductID);
		    ResultSet rs7=ps7.executeQuery();  
	        while(rs7.next()) {
	          
	        	onehalf = rs7.getInt(1);
	        	
	            	
	            }

			PreparedStatement ps8 = con.prepareStatement("Select count(*) from feedback where rating='"+1+"' and ProductID=?");
			ps8.setInt(1,ProductID);
		    ResultSet rs8=ps8.executeQuery();  
	        while(rs8.next()) {
	          
	        	one = rs8.getInt(1);
	        	
	            	
	            }
	        

			PreparedStatement ps9 = con.prepareStatement("Select count(*) from feedback where rating='"+0.5+"' and ProductID=?");
			ps9.setInt(1,ProductID);
		    ResultSet rs9=ps9.executeQuery();  
	        while(rs9.next()) {
	          
	        	half = rs9.getInt(1);
	        	
	            	
	            }
			
	        

	        PreparedStatement ps10 = con.prepareStatement("Select count(*) from feedback where ProductID=?");
	     	ps10.setInt(1,ProductID);
	     	ResultSet rs10=ps10.executeQuery();  
	     	while(rs10.next()) {
	     	          
	     	TotalCount = rs10.getInt(1);
	     	        	
	     	 }  
	     	
	     	
	     	
	     	
	     	int fivestar =( five +fourhalf)*100/TotalCount;
	     
	     	
	     	int fourstar =( four +threehalf)*100/TotalCount;
	 
	     	
	     	int threestar =( three +twohalf)*100/TotalCount;
	     	
	     	int twostar =(  two + onehalf)*100/TotalCount;
	     	
	     	int onestar =(one + half)*100/TotalCount;
	        
	        double rating =(five*5 + fourhalf*4.5 + four*4 + threehalf*3.5 + three*3 + twohalf*2.5 + two*2 + onehalf*1.5 + one*1 + half*0.5)/(five+fourhalf+four+threehalf+three+twohalf+two+onehalf+one+half);
	      
	        NumberFormat formatter = new DecimalFormat("0.0");     
	        String ratirn =  formatter.format(rating);
	         
	         bean.setShowRating(ratirn);
	         bean.setFiveStar(fivestar);
	         bean.setFourStar(fourstar);
	         bean.setThreeStar(threestar);
	         bean.setTwoStar(twostar);
	         bean.setOnestar(onestar);
	         bean.setTotalCount(TotalCount);
	         
	         
	         list.add(bean);
			
		}
		catch(Exception e) {
			
			e.printStackTrace();
			System.out.print("Unable to get Rating");
		}
		return list;
		
	}
	
	
	public static int DeleteComment(int id) {
		
		int i=0;
		
		try {
			
			Connection con = ProductDoa.getConnection();
			
			PreparedStatement ps = con.prepareStatement("Delete feedback,reply_section from feedback INNER JOIN reply_section  ON feedback.id=reply_section.id where feedback.id=? and reply_section.id=?");
			
			ps.setInt(1,id);
			ps.setInt(2,id);
			i=ps.executeUpdate();
			
		}catch(Exception e) {
			
		e.printStackTrace();	
		System.out.print(e);
			
		}
		
		return i;
		
	}
	
	
	
}
