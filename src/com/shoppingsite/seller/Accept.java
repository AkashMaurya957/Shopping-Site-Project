package com.shoppingsite.seller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.PUBLIC_MEMBER;

import com.shoppingsite.productupload.bean.VendorRegisteration;
import com.shoppingsiteproductupload.dao.ProductDoa;
import com.shoppingsiteproductupload.dao.VendorDao;

/**
 * Servlet implementation class Accept
 */
@WebServlet("/Accept")
public class Accept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Accept() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	}

	/**
	 * @return 
	 * @return 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected  void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");  
	   PrintWriter out = response.getWriter();
	
		  
	  String Email=request.getParameter("AcceptVendor");
	  
	  int i=VendorDao.AcceptVendor(Email);
	 
	  if(i>0){
		try {
			Connection con=ProductDoa.getConnection();
    		PreparedStatement ps=con.prepareStatement("select * from UserDetails where Email=? ");
    		ps.setString(1, Email);
    		ResultSet rs=ps.executeQuery();
    		
    		Random num = new Random();
    		int rand = num.nextInt(10000);
    		
    		String add = ""+rand;
    		
    		while(rs.next())
    		{
    	    String name=rs.getString(2);
    	    String[] arrOfStr = name.split(" ");
    	    
    	     String Password=arrOfStr[0]+add;
    		
    		PreparedStatement ps1=con.prepareStatement("update UserDetails set Password=? where Email=? ");
    		ps1.setString(1, Password);
    		ps1.setString(2, Email);
    		
    		int j=ps1.executeUpdate();
    		
    		
    		final String messg = "Your Password "+Password+" \n for Login with Shopping Bazzar \nYou Can Change Your Password from Your Profile If You want \nThanks For Join with us and selling Product with us";
    		final String from = "shoppingbazar100@gmail.com";
    		final String pass = "superb100";
    		final String subject="Reset Password OTP ";
    		String host = "smtp.gmail.com";
    		Properties props = new Properties();
    		props.put("mail.smtp.host", host);
    		props.put("mail.transport.protocol", "smtp");
    		props.put("mail.smtp.auth", "true");
    		props.put("mail.smtp.starttls.enable", "true");
    		props.put("mail.user", from);
    		
    		props.put("mail.password", pass);
    		props.put("mail.smtp.port", "465");
    		props.put("mail.smtp.socketFactory.port", "465");
    		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    		props.put("mail.smtp.socketFactory.fallback", "false");
    		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {

    		    @Override

    		    protected PasswordAuthentication getPasswordAuthentication() {

    		        return new PasswordAuthentication(from, pass);

    		    }

    		});

    		try {

    			
    		    MimeMessage message = new MimeMessage(mailSession);
    		    message.setFrom(new InternetAddress(from));
    		    message.addRecipient(Message.RecipientType.TO,

    		            new InternetAddress(Email));
    		    message.setSubject(subject);
    		    message.setText(messg);
    		    Transport.send(message);

    		  
    		  
    		} catch (MessagingException mex) {

    		    mex.printStackTrace();

    		  
    		}


    		
    		response.sendRedirect("JSP/adminHomepage.jsp");
    		
    		}
			
		}catch(Exception e)
		{
			
			System.out.print(e);
		}
	   
		  
	  }else {
		  
		  
		  System.out.print("UNsuccess");
		  
	  }
	}

}
