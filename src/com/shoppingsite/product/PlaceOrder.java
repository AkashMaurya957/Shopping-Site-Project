package com.shoppingsite.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shoppingsite.productupload.bean.ProductBean;
import com.shoppingsite.productupload.bean.UserDetails;
import com.shoppingsiteproductupload.dao.CustomerInfoDao;
import com.shoppingsiteproductupload.dao.ProductDoa;

/**
 * Servlet implementation class PlaceOrder
 */
@WebServlet("/PlaceOrder")
public class PlaceOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PlaceOrder() {
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
	  
	    HttpSession session=request.getSession();

        String product =(String)session.getAttribute("product");
        String customer  = (String)session.getAttribute("email");
        String PaymentMode=(String)session.getAttribute("PaymentMode");
        String paid=(String)session.getAttribute("Status");


        String Quantity = (String)session.getAttribute("Quantity");
        java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
        ProductBean bean=ProductDoa.getProductDetail(Integer.parseInt(product));
        
       UserDetails userbean=CustomerInfoDao.getUserDetail(customer);

try
{
	  Connection con=ProductDoa.getConnection(); 
	  PreparedStatement ps=con.prepareStatement("insert into productorder(ProductId,Catgory,Productname,Price,Quantity,PurchaseDate,CustomerEmail,FullName,MobileNumber,houseNo,sector,Landmark,City,State,Country,Pincode,Status,PaymentMode,SellerEmail) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
	  String name=bean.getBrandName() + bean.getModel();
	  ps.setInt(1,bean.getProductId()); 
	  ps.setString(2,bean.getCategory()); 
	  ps.setString(3,name); 
	  ps.setString(4,bean.getPrice()); 
	  ps.setString(5,Quantity); 
	  ps.setDate(6,sqlDate); 
	  ps.setString(7,customer); 
	  ps.setString(8,userbean.getFullName()); 
	  ps.setString(9,userbean.getMobilenumber()); 
	  ps.setString(10,userbean.getHno()); 
	  ps.setString(11,userbean.getSector()); 
	  ps.setString(12,userbean.getLandmark()); 
	  ps.setString(13,userbean.getCity()); 
	  ps.setString(14,userbean.getState()); 
	  ps.setString(15,userbean.getCountry()); 
	  ps.setString(16,userbean.getPincode()); 
	  ps.setString(17,PaymentMode); 
	  ps.setString(18,paid); 
	  ps.setString(19,bean.getEmail());
	  
	  
	   int  i=ps.executeUpdate(); 
	   if(i>0)
	   {
		   
		   request.getRequestDispatcher("JSP/homepage.jsp").forward(request, response); 
			  
	   System.out.print("Success");
	   }
	 
}catch(Exception e)
{
	System.out.println(e);
}

        
        




	}

}
