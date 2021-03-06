package com.shoppingsite.customerInfoUpdate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingsite.productupload.bean.UserDetails;
import com.shoppingsiteproductupload.dao.CustomerInfoDao;

/**
 * Servlet implementation class EditCustomerName
 */
@WebServlet("/EditCustomerName")
public class EditCustomerName extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCustomerName() {
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
		PrintWriter out = response.getWriter();
	    
	    HttpSession session = request.getSession();
	    String email=(String)session.getAttribute("Email");
	    String name=request.getParameter("Username");
	    
	    UserDetails bean= new UserDetails();
	    bean.setName(name);
	    bean.setEmail(email);
	    
	    int i =CustomerInfoDao.ChangeUserName(bean);
		if(i>0)
		{
			
			request.getRequestDispatcher("JSP/showCustomerProfile.jsp").include(request, response);  
	    	
		}
		else
		{
			
			System.out.println("Unable to insert!!!!");
		}
	    
	}

}
