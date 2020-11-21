package com.shoppingsite.productupload.bean;

public class ReplyBean {
	
	private String id,comment,email,name,replyID,LoginCustomerEmail;

	
	
	
	public String getLoginCustomerEmail() {
		return LoginCustomerEmail;
	}

	public void setLoginCustomerEmail(String loginCustomerEmail) {
		LoginCustomerEmail = loginCustomerEmail;
	}

	public String getReplyID() {
		return replyID;
	}

	public void setReplyID(String replyID) {
		this.replyID = replyID;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
