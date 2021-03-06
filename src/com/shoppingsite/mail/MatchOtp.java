package com.shoppingsite.mail;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MatchOtp
 */
@WebServlet("/MatchOtp")
public class MatchOtp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatchOtp() {
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
		
		String email=(String)session.getAttribute("email");
		int Otp=(Integer)session.getAttribute("OTP");
		String OTP=String.valueOf(Otp);
		String getEnterOtp=request.getParameter("secretcode");
	
		if(OTP.equals(getEnterOtp))
		{
			
			response.sendRedirect("JSP/changePassword.jsp");
		}
		else {
			
			session.setAttribute("OtpNotMatch", "NotMatch");
			response.sendRedirect("JSP/OtpForm.jsp");
		}
			
	}

}
