package com.shoppingsite.loginsignup;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
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
	 * @throws IOException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO Auto-generated method stub
		doGet(request, response);
		
		

	    response.setContentType("text/html");  
	    PrintWriter out = response.getWriter();
	    
		String name=request.getParameter("name");  
		String email=request.getParameter("email");  
		String mobileNumber=request.getParameter("mobileNumber");  
		String password=request.getParameter("psw");  
		String repassword=request.getParameter("psw-repeat"); 
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		
	       
		
		
		if(password.equals(repassword)){
   
				try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingbazzar","root","akash1996");
			PreparedStatement stmt= con.prepareStatement("insert into UserDetails(Email,UserName,Password,mobile,DateOfRegisteration,UserType) values(?,?,?,?,?,?)");
			
			String customer="Customer";
			stmt.setString(1, email);
			stmt.setString(2,name);
			stmt.setString(3, password);
			stmt.setString(4, mobileNumber);
			stmt.setDate(5,sqlDate);
			stmt.setString(6,customer);
			
			
			int i = stmt.executeUpdate();
			
			
			ServletContext  sc= getServletContext();
			sc.getRequestDispatcher("/JSP/homepage.jsp").forward(request, response);
		
			
		} 
		catch (Exception e) {
			
            out.print(e);
			e.printStackTrace();
			
		}
		}
		else{
			
			out.println("alert('Passord not match');");
			
		}
		
	}

}
