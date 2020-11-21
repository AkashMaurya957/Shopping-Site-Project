package com.shoppingsiteproductupload.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

public class LoginDao {

	public static int ChangePassword(String email,String Password)
	{
		
		int i=0;
		boolean status=false;
		try {
			

			Connection  con=ProductDoa.getConnection();
		    PreparedStatement stmt = con.prepareStatement("select * from adminDetails where EmailID=?");
		    stmt.setString(1,email);
		 		     
		     ResultSet  rs= stmt.executeQuery();
		     status=rs.next();
		     
		      if(status){
		    	 
		    	  PreparedStatement setPass=con.prepareStatement("update adminDetails set Password=? where EmailID=?");
		          setPass.setString(1, Password);
		          setPass.setString(2,email);
		          
		          i=setPass.executeUpdate();
		    	  
		           }
		          else{
		        	  PreparedStatement stmt2 = con.prepareStatement("select * from userdetails where Email=? ");
			  		   stmt2.setString(1,email);
			  		     
			  		  ResultSet  rs2= stmt2.executeQuery();
				  		 
			        	 
		        	  if(rs2.next())
		        	  {
		        		  PreparedStatement setPass1=con.prepareStatement("update userdetails set Password=? where Email=?");
				          setPass1.setString(1, Password);
				          setPass1.setString(2,email);
				          
				        i=setPass1.executeUpdate();
				    	  
				          
		        		  
		        	  }
		          }
		   

			
			
			
		}catch(Exception e) 
		{
			
			
		}
		
		return i;
		
	}
}
