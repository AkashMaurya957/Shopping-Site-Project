package com.shoppingsite.loginsignup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.shoppingsiteproductupload.dao.ProductDoa;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		

	    response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
	    
		boolean status=false;
		String email=request.getParameter("email");  
		String password=request.getParameter("psw");  

		
		try {
			
			
			Connection  con=ProductDoa.getConnection();
		    PreparedStatement stmt = con.prepareStatement("select * from adminDetails where EmailID=? and Password=?");
		    stmt.setString(1,email);
		    stmt.setString(2,password);
		     
		     ResultSet  rs= stmt.executeQuery();
		     status=rs.next();
		     
		      if(status){
		    	  
		    	  
		    	  String  emailid =rs.getString(2);
   		    	  String username = rs.getString(1);
		    	  
	   		    	  HttpSession session=request.getSession();
	   		    	  session.setAttribute("userAdmin",username);
	   		    	  session.setAttribute("Email", emailid);
	   		    	  request.getRequestDispatcher("JSP/adminHomepage.jsp").include(request, response);  
	   		    	
	   		    		  
	   		    	  
		           }
		      else
        	  {
        		
		    	 PreparedStatement stmt1 = con.prepareStatement("select * from UserDetails where Email=? and Password=?");
  			    stmt1.setString(1,email);
  			    stmt1.setString(2,password);
  			     
  			     ResultSet  rs1= stmt1.executeQuery();
  			     status=rs1.next();
  			     
        		 if(status) {
        			 
        			 
        			 
   		    	  
   		    	  String  emailid =rs1.getString(1);
   		    	  String username = rs1.getString(2);
   		    	  String UserType=rs1.getString(15);
   		    	    
   		    	 
   		    	  
   		    	  if(UserType.equals("Customer")) {
   		    		  
   			    	  String LoginStatus = rs1.getString(17);
   			    	  HttpSession session=request.getSession();
   			    	  if(LoginStatus.equals("Block"))
   			    	  {
   			    		  
   			    	
   			    	  session.setAttribute("user",username);
   			    	  session.setAttribute("Email", emailid);
   			    	  String productIdAfterLogin=(String)session.getAttribute("productId");
   			    	  session.setAttribute("productIdAfterLogin",  productIdAfterLogin);
   			    	  String Currentpage=(String)session.getAttribute("CurrentPage");
   			    	  response.sendRedirect(""+Currentpage+"?product="+productIdAfterLogin);
   			    	  
   			    	  }
   			    	  else {
   			    		  
                          session.removeAttribute("IncorrectDetailsForLogin");                         
   			    		  session.setAttribute("LoginStatus","You are Blocked By Shopping Bazzar");
   				    	  response.sendRedirect("JSP/Login.jsp");
   			    	  }
   		    	  
   		    	  }
   		    	  if(UserType.equals("Vendor")) {
   		    		  
   		    		  
   		    		  String BlockOrNot = rs1.getString(17);
   			    	  String LoginStatus = rs1.getString(18);
   			    	  HttpSession session=request.getSession();
   			    	 
   			    	  if(LoginStatus.equals("Valid"))
   			    	  {
   			    		  if(BlockOrNot.equals("Block")) {
   			    			  
   			    			  session.setAttribute("userSeller",username);
   					    	  session.setAttribute("Email", emailid);
   					    	  request.getRequestDispatcher("JSP/sellerHomepage.jsp").include(request, response);  
   					    	  
   			    		  }else {
   			    			  
   			    			  session.removeAttribute("IncorrectDetailsForLogin");
   			        		  session.setAttribute("LoginStatus", "You are Blocked By Shopping Bazzar");
   					    	  response.sendRedirect("JSP/Login.jsp");
   			    			  
   			    		  }
   			    		  
   			    	 
   			    	  }else
   			    	  {
   			    		  session.removeAttribute("IncorrectDetailsForLogin");
   			    		  session.setAttribute("LoginStatus", "Your Request Under Process");
   				    	  response.sendRedirect("JSP/Login.jsp");
   			    	  }
   	        		
   		    	  }
   		    	  
        			 
        			 
        		 }else
        		 {
        	      
        	      HttpSession Incorrect=request.getSession();
        		  Incorrect.removeAttribute("LoginStatus");
        		  Incorrect.setAttribute("IncorrectDetailsForLogin","Incorrect");
                   response.sendRedirect("JSP/Login.jsp");
                  out.close();
                  
        		 }
        		 
          }
		      
		   		   
			
		} 
		catch (Exception e) {
			
            out.print(e);
			e.printStackTrace();
			
		}
		
		
	}

}
