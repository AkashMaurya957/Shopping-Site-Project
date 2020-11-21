package com.shoppingsite.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingsite.productupload.bean.ReplyBean;
import com.shoppingsiteproductupload.dao.CustomerFeedBack;

/**
 * Servlet implementation class AddCommentReply
 */
@WebServlet("/AddCommentReply")
public class AddCommentReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommentReply() {
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
	
	
	HttpSession session =request.getSession();
 	
	
	String reply = request.getParameter("reply");
	String idcomment = request.getParameter("commentId");
	String Email=(String)session.getAttribute("Email"); 
	String Username=(String)session.getAttribute("user");
	   
	System.out.print(idcomment);
	
if(session.getAttribute("user")==null)
{

	session.setAttribute("CurrentPage","JSP/replySection.jsp?commentId="+idcomment+"&");
	response.sendRedirect("JSP/Login.jsp");
	
	
}
if(session.getAttribute("user")!=null)
{

	   
	
	ReplyBean bean = new ReplyBean();
	
	bean.setId(idcomment);
    bean.setComment(reply);
    bean.setEmail(Email);
    bean.setName(Username);
	
    System.out.println("value"+idcomment);
    System.out.println("value"+idcomment);
    
	int i =CustomerFeedBack.Reply(bean);
	
	if(i>0) {
		
		System.out.print("forword to next");
		
		request.getRequestDispatcher("JSP/replySection.jsp").forward(request, response);;
		
	}else {
		
		System.out.print("Unable to save reply message");
		
	}
	
	
}

	}

}
