package com.shoppingsite.payment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.shoppingsite.payment.*;
import com.shoppingsiteproductupload.dao.ProductDoa;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Payment() {
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
		    
		    HttpSession session= request.getSession();    
    String productId=request.getParameter("product");
	String cardNumber = request.getParameter("cardnumber");
	String accountHolder = request.getParameter("Holdername");
	String cvv = request.getParameter("cvv");
	String expiryDate = request.getParameter("date");
	System.out.print(expiryDate);
	System.out.print("product Id"+productId);
	 String email=(String)session.getAttribute("Email");
	 
	 System.out.print(email);
	
	
	
	session.setAttribute("product",  productId);
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingbazzar","root","akash1996");
	    PreparedStatement stmt = con.prepareStatement("select * from account where cardnumber=? and accountHolderName=? and cvv=? and ExpiryDate=?");
	    stmt.setString(1,cardNumber);
	    stmt.setString(2,accountHolder);
	    stmt.setString(3,cvv);
	    stmt.setString(4,expiryDate);
	     
	     
	     ResultSet  rs= stmt.executeQuery();
	
	     
	      if(rs.next()){
	    	 
	  	  
	  	    String product = request.getParameter("product");
	  	   
	        String mode ="Card Payment";
	       	String paid="Paid";
	  	    session.setAttribute("product",product );
	  	    session.setAttribute("email",email );
	  	    session.setAttribute("PaymentMode",mode);
	  	    session.setAttribute("Status",paid);
	  	    
	  	    try
	  		{
	  			
	  	
	  			PreparedStatement ps=con.prepareStatement("select * from UserDetails where Email =?");
	  			 ps.setString(1,email);
	  			
	  			 ResultSet rs1=ps.executeQuery(); 
	  			 while(rs1.next())
	  			 {
	  				 String checkAddress=rs1.getString(6);
	  				 

	  			    	if(checkAddress==null)
	  			    	{
	  			    	    
	  			    	   
	  			    		 request.getRequestDispatcher("JSP/getAddress.jsp").forward(request, response); 
	  			  
	  				    	 
	  			    	}
	  			    	else
	  			    	{
	  			    		request.getRequestDispatcher("JSP/AddressExist.jsp").include(request, response);  
	  				    	 
	  			    		
	  			    	}
	  				 				 
	  			 }
	  			
	  		}catch(Exception e)
	  		{
	  			
	  			System.out.print(e);
	  		}
	  		

	  	    	

	    	  
	           }
	          else{
	        	  
	        	  int i=2;
	        	  
	        	  request.getRequestDispatcher("JSP/payment.jsp?value="+i+"").include(request, response);  
			    	 
	          
	          }
	   
		
	} 
	catch (Exception e) {
		
        System.out.print(e);
		e.printStackTrace();
		
	}
	

	
		
	}

}
