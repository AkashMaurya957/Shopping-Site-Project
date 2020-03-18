package com.shoppingsite.seller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingsite.productupload.bean.VendorRegisteration;
import com.shoppingsiteproductupload.dao.VendorDao;

/**
 * Servlet implementation class sellerRegisteration
 */
@WebServlet("/sellerRegisteration")
public class sellerRegisteration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sellerRegisteration() {
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
		    
		String name = request.getParameter("name");
		String mobile_no = request.getParameter("mobile_no");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String house_no = request.getParameter("house_no");
		String sector = request.getParameter("sector");
		String area = request.getParameter("area");
		String city = request.getParameter("city");
		String pin = request.getParameter("pin");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		    
		
		VendorRegisteration bean = new VendorRegisteration();
		bean.setName(name);
		bean.setMobile(mobile_no);
		bean.setEmail(email);
		bean.setGender(gender);
		bean.setHouseNo(house_no);
		bean.setSector(sector);
		bean.setArea(area);
		bean.setCity(city);
		bean.setPincode(pin);
		bean.setState(state);
		bean.setCountry(country);
		
		int i=VendorDao.RegisterVendor(bean);
		if(i>0)
		{
			 out.println("<script type=\"text/javascript\">");
			 out.println("location='JSP/homepage.jsp';");
			 out.println("alert('When Your Request is Accept By Shopping Bazzar Password sent to Your Email Address Within 3 days ');");
			 out.println("</script>");
		}
		else {
			
			System.out.print("Not Success");
		}
		
		
	}

}
