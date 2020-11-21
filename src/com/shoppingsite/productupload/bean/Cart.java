package com.shoppingsite.productupload.bean;

public class Cart {
	
private String  tablename,ProductID,Email;


public Cart(){
	
	
}

public Cart(String tablename, String productID) {
	
	this.tablename = tablename;
	ProductID = productID;
}

public String getTablename() {
	return tablename;
}

public void setTablename(String tablename) {
	this.tablename = tablename;
}

public String getProductID() {
	return ProductID;
}

public void setProductID(String productID) {
	ProductID = productID;
}

public String getEmail() {
	return Email;
}

public void setEmail(String email) {
	Email = email;
}



}
