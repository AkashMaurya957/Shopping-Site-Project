package com.shoppingsite.payment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PaymentPage
 */
@WebServlet("/PaymentPage")
public class PaymentPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentPage() {
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

		
		HttpSession session=request.getSession();
		
String productId=(String)session.getAttribute("productId");
System.out.print("New ID "+productId);

String quantity =request.getParameter("quantity");
System.out.println("Quantity"+quantity);


session.setAttribute("Quantity",quantity);

if(session.getAttribute("user")==null)
{

	session.setAttribute("CurrentPage","JSP/paymentPage.jsp");
	response.sendRedirect("JSP/Login.jsp");
	
	
}
if(session.getAttribute("user")!=null)
{

	response.sendRedirect("JSP/paymentPage.jsp");
	
	
}


	}

}
