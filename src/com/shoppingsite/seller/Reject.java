package com.shoppingsite.seller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

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

import com.shoppingsiteproductupload.dao.VendorDao;

/**
 * Servlet implementation class Reject
 */
@WebServlet("/Reject")
public class Reject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reject() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
		  PrintWriter out = response.getWriter();
	
		  System.out.print("Reject");
		  String vendor=request.getParameter("VendorReject");
		  System.out.print(vendor);
		  int i=VendorDao.RejectVendor(vendor);
			 
		  if(i>0){
			  
			  final String messg = "Your Request for selling Product with us .\n We found your details is not correct";
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

	    		            new InternetAddress(vendor));
	    		    message.setSubject(subject);
	    		    message.setText(messg);
	    		    Transport.send(message);

	    		  
	    		  
	    		} catch (MessagingException mex) {

	    		    mex.printStackTrace();

	    		  
	    		}


	    		
	    		response.sendRedirect("JSP/adminHomepage.jsp");

		  }else {
			  
			  
			  System.out.print("UNsuccess");
			  
		  }
		  
 
	}

}
