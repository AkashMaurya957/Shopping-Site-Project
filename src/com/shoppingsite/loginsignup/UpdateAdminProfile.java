package com.shoppingsite.loginsignup;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingsite.productupload.bean.AdminBean;
import com.shoppingsiteproductupload.dao.AdminDao;
import com.shoppingsiteproductupload.dao.CustomerInfoDao;

/**
 * Servlet implementation class UpdateAdminProfile
 */
@WebServlet("/UpdateAdminProfile")
public class UpdateAdminProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdminProfile() {
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
	
		String name=request.getParameter("name");
		String email=request.getParameter("Email");
		String mobileNumber=request.getParameter("Mobilenumber");
		String twitter=request.getParameter("Twitter");	
		String instagram=request.getParameter("Instagram");
		String facebook=request.getParameter("Facebook");
		
		
		AdminBean bean=new AdminBean();
		
		bean.setName(name);
		bean.setEmail(email);
		bean.setMobileNumber(mobileNumber);
		bean.setTwitterPage(twitter);
		bean.setInstagramPage(instagram);
		bean.setFacebookPage(facebook);
		
		int i =AdminDao.UpdateAdminDetails(bean);
		if(i>0)
		{
			
			request.getRequestDispatcher("JSP/adminHomepage.jsp").include(request, response);  
	    	
		}
		else
		{
			
			System.out.println("Unable to insert!!!!");
		}
		
		
			
	
	}

}
