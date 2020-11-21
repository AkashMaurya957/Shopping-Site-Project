package com.shoppingsite.seller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingsite.productupload.bean.VendorRegisteration;
import com.shoppingsiteproductupload.dao.VendorDao;

/**
 * Servlet implementation class UpdateSellerDetails
 */
@WebServlet("/UpdateSellerDetails")
public class UpdateSellerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSellerDetails() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		HttpSession session = request.getSession();
		
		String email =(String)session.getAttribute("Email");
		
		String name = request.getParameter("name");
		String mobnum = request.getParameter("Mobilenumber");
		String gender = request.getParameter("gender");
		String hno = request.getParameter("House");
		String sec = request.getParameter("sec");
		String nearBy = request.getParameter("landmark");
		String country = request.getParameter("country");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String pin = request.getParameter("pincode");
		
		
		VendorRegisteration bean = new VendorRegisteration();
		
		bean.setName(name);
		bean.setEmail(email);
		bean.setMobile(mobnum);
		bean.setGender(gender);
		bean.setHouseNo(hno);
		bean.setSector(sec);
		bean.setArea(nearBy);
		bean.setCountry(country);
		bean.setState(state);
		bean.setCity(city);
		bean.setPincode(pin);
		
		
		int i = VendorDao.UpdateVendorProfile(bean);
		
		if(i>0) {
			
			
			request.getRequestDispatcher("JSP/sellerHomepage.jsp").forward(request, response); 
			
	    
			
		}else {
			
			System.out.print("Unable to Update Seller Details");
		}
		
		
		
		
	}

}
