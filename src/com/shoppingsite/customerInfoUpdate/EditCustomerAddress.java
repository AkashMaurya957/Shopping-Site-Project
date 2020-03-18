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
 * Servlet implementation class EditCustomerAddress
 */
@WebServlet("/EditCustomerAddress")
public class EditCustomerAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCustomerAddress() {
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
		    
		    HttpSession session = request.getSession();
		    
		    
		    String email=(String)session.getAttribute("Email");
		    
		    String  userName= request.getParameter("name");
		    String  mobileNumber= request.getParameter("mbno");
		    String  houseNo= request.getParameter("hno");
		    String  sector= request.getParameter("sector");
		    String  landmark= request.getParameter("landmark");
		    String  city= request.getParameter("city");
		    String  state= request.getParameter("state");
		    String  country= request.getParameter("country");
		    String  pincode= request.getParameter("pincode");
		    
			
			
			UserDetails address= new UserDetails();
			address.setFullName(userName);
			address.setMobilenumber(mobileNumber);
			address.setHno(houseNo);
			address.setSector(sector);
			address.setLandmark(landmark);
			address.setCity(city);
			address.setState(state);
			address.setCountry(country);
			address.setPincode(pincode);
			address.setEmail(email);
			
			int i =CustomerInfoDao.SaveUserDetails(address);
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


