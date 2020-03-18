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
 * Servlet implementation class EditCustomerPassword
 */
@WebServlet("/EditCustomerPassword")
public class EditCustomerPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCustomerPassword() {
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
	    String OldPass=request.getParameter("Password");
	    String NewPass=request.getParameter("Confirm");
	    
	    UserDetails bean= new UserDetails();
	    bean.setPassword(OldPass);
	    bean.setNewPAssword(NewPass);
	    bean.setEmail(email);
	    
	    int i =CustomerInfoDao.ChangeUserPassword(bean);
		
		request.getRequestDispatcher("JSP/showCustomerProfile.jsp").include(request, response);  
	    	
		
	}


}
