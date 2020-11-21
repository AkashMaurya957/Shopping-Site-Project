package com.shoppingsite.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoppingsiteproductupload.dao.ProductDoa;

/**
 * Servlet implementation class AcceptProduct
 */
@WebServlet("/AcceptProduct")
public class AcceptProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptProduct() {
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


		   
				String productId = request.getParameter("product");
				System.out.print(productId);
				
				
				int i=ProductDoa. AcceptProduct(productId);
				
				 if(i>0) {
						
					  request.getRequestDispatcher("JSP/adminHomepage.jsp").include(request, response);  
				    	  
				  }else {
					  
					  System.out.print("Error ");
				  }
				 
				 
	}

}
