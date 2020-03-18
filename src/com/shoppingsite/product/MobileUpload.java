package com.shoppingsite.product;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.shoppingsite.productupload.bean.ProductBean;
import com.shoppingsiteproductupload.dao.ProductDoa;

/**
 * Servlet implementation class MobileUpload
 */
@WebServlet("/MobileUpload")
@MultipartConfig(maxFileSize=16177216)
public class MobileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MobileUpload() {
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
		response.setContentType("text/multipart/form-data; charset=UTF-8");
		PrintWriter out = response.getWriter(); 
		doGet(request, response);
		
		
	    HttpSession session=request.getSession();
	    String selleremail =(String)session.getAttribute("Email");
	
		
		String brandName = request.getParameter("brandName");
		String model = request.getParameter("model");
		String Price = request.getParameter("Price");
		String quantity=request.getParameter("quantity");
		String os = request.getParameter("operatingSystem");
		String camera = request.getParameter("camera");
		String ram = request.getParameter("ram");
		String intMemory = request.getParameter("internalMemory");
		String soldBy = request.getParameter("soldby");
		String wirelessTech = request.getParameter("wirelessTechnology");
		String itemDimension = request.getParameter("itemdimensions");
		String displaysize = request.getParameter("displaysize");
		String weight = request.getParameter("weight");
		String color = request.getParameter("color");
		String simSlot = request.getParameter("simslot");
		String battery = request.getParameter("batteryPower");
		String whatIsBox = request.getParameter("whatinBox");
		String specialfeatures = request.getParameter("specialfeatures");
		String warrenty = request.getParameter("warrenty");
		String description = request.getParameter("description");
		String FrontImg = request.getParameter("image1");
		out.print(FrontImg);
		System.out.println(FrontImg);
		String BackImg = request.getParameter("image2");
		String SideImg = request.getParameter("image3");
		
		
		
		ProductBean bean = new ProductBean();
		
		bean.setBrandName(brandName);
		bean.setModel(model);
		bean.setPrice(Price);
		bean.setOperatingSystem(os);
		bean.setCamera(camera);
		bean.setRam(ram);
		bean.setInternalMemory(intMemory);
		bean.setSoldby(soldBy);
		bean.setWirelessTechnology(wirelessTech);
		bean.setItemdimensions(itemDimension);
		bean.setDisplaysize(displaysize);
		bean.setWeight(weight);
		bean.setColor(color);
		bean.setSimslot(simSlot);
		bean.setBatteryPower(battery);
		bean.setWhatinBox(whatIsBox);
		bean.setSpecialfeatures(specialfeatures);
		bean.setWarrenty(warrenty);
		bean.setDescription(description);
		bean.setImage1(FrontImg);
		bean.setImage2(BackImg);
		bean.setImage3(SideImg);
	    bean.setEmail(selleremail);
	    bean.setQuantity(quantity);
		int status =ProductDoa.save(bean);
		if(status>0)
		{
			request.getRequestDispatcher("JSP/sellerHomepage.jsp").forward(request, response);  
	    	
		}
		else
		{
			
			System.out.println("Unable to insert!!!!");
		}
		
	}

}
