package com.shoppingsiteproductupload.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MailSendDao {

	
	public static int SendOtp(int s,String email) {
		
		int i=0;
    	
		try
		{
               	 boolean status = false;
    	         Connection conn=ProductDoa.getConnection();
		         PreparedStatement ps=conn.prepareStatement("select * from UserDetails where Email=?");
		         ps.setString(1,email);
		
		         ResultSet  rs= ps.executeQuery();
	             status=rs.next();
	     
	     if(status){
	    	 
	    	      PreparedStatement psSave=conn.prepareStatement("update UserDetails set otp=? where Email=?");
	    	      psSave.setInt(1, s);
	    	      psSave.setString(2,email);
	    	 
	    	      i=psSave.executeUpdate();
	     
	     }
		
		}catch(Exception e)
		{
			System.out.print(e);
		}
		return i;
	}
}
