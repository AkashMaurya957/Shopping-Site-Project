package com.shoppingsiteproductupload.dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.shoppingsite.productupload.bean.PlaceOrder;
import com.shoppingsite.productupload.bean.AdminBean;
import com.shoppingsite.productupload.bean.UserDetails;

public class AdminDao {
	
	
	public static List<AdminBean> getAdminDetails( String id)
	{
		
		List<AdminBean> list = new ArrayList<AdminBean>();
		
		try
		{
			Connection con=ProductDoa.getConnection();
					
		    PreparedStatement ps=con.prepareStatement("Select * from admindetails where EmailID=?");		
		    ps.setString(1, id);
		    ResultSet rs = ps.executeQuery();
		    while(rs.next())
		    {
		    	
		    	
		    	AdminBean bean=new AdminBean();
		    	
		    	bean.setName(rs.getString(1));
		    	bean.setEmail(rs.getString(2));
		    	bean.setMobileNumber(rs.getString(3));
		    	bean.setTwitterPage(rs.getString(6));
		    	bean.setInstagramPage(rs.getString(7));
		    	bean.setFacebookPage(rs.getString(8));
		    	
		    	list.add(bean);
		    	
		    }
			
		}catch(Exception e) {
			
			System.out.print(e);
		}
		
		return list;
	}
	
	
	
	public static List<AdminBean> getAdminDetailsForFooter()
	{
		
		List<AdminBean> list = new ArrayList<AdminBean>();
		
		try
		{
			Connection con=ProductDoa.getConnection();
					
		    PreparedStatement ps=con.prepareStatement("Select * from admindetails");		
		 
		    ResultSet rs = ps.executeQuery();
		    while(rs.next())
		    {
		    	
		    	
		    	AdminBean bean=new AdminBean();
		    	
		    	bean.setName(rs.getString(1));
		    	bean.setEmail(rs.getString(2));
		    	bean.setMobileNumber(rs.getString(3));
		    	bean.setPassword(rs.getString(4));
		    	bean.setOtp(rs.getString(5));
		    	bean.setTwitterPage(rs.getString(6));
		    	bean.setInstagramPage(rs.getString(7));
		    	bean.setFacebookPage(rs.getString(8));
		    	
		    	list.add(bean);
		    	
		    }
			
		}catch(Exception e) {
			
			System.out.print(e);
		}
		
		return list;
	}
	
	
	public static List<UserDetails> getTotalCustomer()
	{
		
		List<UserDetails> list = new ArrayList<UserDetails>();
		
		
		try {
			
			Connection con = ProductDoa.getConnection();
			PreparedStatement ps=con.prepareStatement("Select count(*) from UserDetails");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				
				UserDetails bean=new UserDetails();
				String count =rs.getString(1);
				System.out.print(count);
				bean.setTotalCustomer(count);
				
				list.add(bean);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e);
		}
		return list;
		
		
		
	}

	
	
	public static List<UserDetails> getNewCustomer()
	{
		
		List<UserDetails> list = new ArrayList<UserDetails>();
		
		Date date=Calendar.getInstance().getTime();
		DateFormat dateFormate = new SimpleDateFormat("YYYY-MM-dd");
		String strDate=dateFormate.format(date);
		System.out.print(strDate);
		
		
		try {
			
			Connection con = ProductDoa.getConnection();
			PreparedStatement ps=con.prepareStatement("Select count(*) from UserDetails where dateofregisteration=?");
			ps.setString(1,strDate);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				
				UserDetails bean=new UserDetails();
				String count =rs.getString(1);
				System.out.print(count);
			    bean.setNewCustomer(count);
				
				list.add(bean);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e);
		}
		return list;
		
		
		
	}


	public static List<PlaceOrder> getTotalOrder()
	{
		
		List<PlaceOrder> list = new ArrayList<PlaceOrder>();
		
		String Place = "NotPlace";
		try {
			
			Connection con = ProductDoa.getConnection();
			PreparedStatement ps=con.prepareStatement("Select count(*) from productOrder where place='"+Place+"'");
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				
				PlaceOrder bean=new PlaceOrder();
				String count =rs.getString(1);
				System.out.print(count);
				bean.setTotalOrder(count);
				
				list.add(bean);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e);
		}
		return list;
		
		
		
	}
	
	public static List<PlaceOrder> getTotalIncome()
	{
		
		List<PlaceOrder> list = new ArrayList<PlaceOrder>();
		
		Date date=Calendar.getInstance().getTime();
		DateFormat dateFormate = new SimpleDateFormat("YYYY-MM-dd");
		String strDate=dateFormate.format(date);
		System.out.print(strDate);
		
		try {
			
			Connection con = ProductDoa.getConnection();
			PreparedStatement ps=con.prepareStatement("Select sum(price*quantity) from productOrder where PurchaseDate=?");
			ps.setString(1,strDate);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				
				PlaceOrder bean=new PlaceOrder();
				
			
				bean.setTotalincome(rs.getString(1));
				
				System.out.print("Total balance"+rs.getString(1));
				list.add(bean);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.print(e);
		}
		return list;
		
		
		
	}
	
	public static int UpdateAdminDetails(AdminBean admin)
	{
	int i=0;
	
	
	try {
		Connection con=ProductDoa.getConnection();
		PreparedStatement ps=con.prepareStatement("update adminDetails set name=? ,EmailID=?,mobilenumber=?, TwitterPage=?, InstagramPage=?,facebookPage=? ");
		ps.setString(1, admin.getName());
		ps.setString(2, admin.getEmail());
		ps.setString(3, admin.getMobileNumber());
		ps.setString(4, admin.getTwitterPage());
		ps.setString(5, admin.getInstagramPage());
		ps.setString(6, admin.getFacebookPage());
	
		
		i=ps.executeUpdate();
		
		
	}catch(Exception e) {
		
		System.out.print(e);
	}
	return i;	
	}
	
}
