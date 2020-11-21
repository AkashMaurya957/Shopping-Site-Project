<%@page import="com.shoppingsiteproductupload.dao.CustomerFeedBack"%>
<%

String product = request.getParameter("ProductId");

String IDComment = request.getParameter("ID");

System.out.print(product);

System.out.print(IDComment);


int i = CustomerFeedBack.DeleteComment(Integer.parseInt(IDComment));


if(i>0){
	
	System.out.print("Sucess");
	
}
else{
	

	System.out.print("UnSucess");
	
}


%>