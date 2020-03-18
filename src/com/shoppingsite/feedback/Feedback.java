package com.shoppingsite.feedback;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingsite.productupload.bean.feedback;
import com.shoppingsiteproductupload.dao.CustomerFeedBack;

/**
 * Servlet implementation class Feedback
 */
@WebServlet("/Feedback")
public class Feedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Feedback() {
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
	        PrintWriter out=response.getWriter();  
	       
	        HttpSession session=request.getSession();
	        String value=(String)session.getAttribute("productId");
	        
	        String rating = request.getParameter("rating");
	        String comment = request.getParameter("comment");
	        String email=(String)session.getAttribute("Email");
	        String name=(String)session.getAttribute("user");
	        String category=request.getParameter("category");
	        String Product=(String)session.getAttribute("productId");
	       
	        if(session.getAttribute("Email")!=null)
	        {
	        	
	        	feedback bean=new feedback();
	        	bean.setCustomerEmail(email);
	        	bean.setCategory(category);
	        	bean.setCustomerName(name);
	        	bean.setProductID(Product);
	        	bean.setRating(rating);
	        	bean.setComment(comment);
	        	
	        	int i=CustomerFeedBack.ProductReview(bean);
	        	
	        	if(i>0)
	        	{
	        		
	        		response.sendRedirect("JSP/ProductView.jsp?product="+value+"");
	        		
	        		
	        	}
	        	
	        }
	        else
	        {
	        	session.setAttribute("CurrentPage","JSP/ProductView.jsp");
	        	response.sendRedirect("JSP/Login.jsp");
		           out.close();
	        }
		
	}

}
