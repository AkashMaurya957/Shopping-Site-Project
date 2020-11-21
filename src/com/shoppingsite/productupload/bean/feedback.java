package com.shoppingsite.productupload.bean;

public class feedback {
	
	private String customerEmail,customerName,Category,ProductID,Comment,Rating,id,showRating,LoginCustomerMail;
	
	int fiveStar,fourStar,threeStar,twoStar,onestar,TotalCount;
	
	

	public String getLoginCustomerMail() {
		return LoginCustomerMail;
	}

	public void setLoginCustomerMail(String loginCustomerMail) {
		LoginCustomerMail = loginCustomerMail;
	}

	public int getTotalCount() {
		return TotalCount;
	}

	public void setTotalCount(int totalCount) {
		TotalCount = totalCount;
	}

	public String getShowRating() {
		return showRating;
	}

	public void setShowRating(String showRating) {
		this.showRating = showRating;
	}


	public int getFiveStar() {
		return fiveStar;
	}

	public void setFiveStar(int fiveStar) {
		this.fiveStar = fiveStar;
	}

	public int getFourStar() {
		return fourStar;
	}

	public void setFourStar(int fourStar) {
		this.fourStar = fourStar;
	}

	public int getThreeStar() {
		return threeStar;
	}

	public void setThreeStar(int threeStar) {
		this.threeStar = threeStar;
	}

	public int getTwoStar() {
		return twoStar;
	}

	public void setTwoStar(int twoStar) {
		this.twoStar = twoStar;
	}

	public int getOnestar() {
		return onestar;
	}

	public void setOnestar(int onestar) {
		this.onestar = onestar;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getCategory() {
		return Category;
	}

	public void setCategory(String category) {
		Category = category;
	}

	public String getProductID() {
		return ProductID;
	}

	public void setProductID(String productID) {
		ProductID = productID;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getComment() {
		return Comment;
	}

	public void setComment(String comment) {
		Comment = comment;
	}

	public String getRating() {
		return Rating;
	}

	public void setRating(String rating) {
		Rating = rating;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	

}
