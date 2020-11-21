package com.shoppingsite.productupload.bean;

import java.io.InputStream;

import com.mysql.cj.jdbc.Blob;

public class ProductBean {
	
	private String brandName,model,price,operatingSystem,camera,ram,internalMemory,soldby,
	 wirelessTechnology,itemdimensions,displaysize,weight,color,simslot,batteryPower,whatinBox,
	 specialfeatures,warrenty,description,image1,image2,image3,category,email,quantity,reason,Approvalstatus,TotalInCart;
	
	
	private int productId;
	
	
	public String getTotalInCart() {
		return TotalInCart;
	}

	public void setTotalInCart(String totalInCart) {
		TotalInCart = totalInCart;
	}

	public String getEmail() {
		return email;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getApprovalstatus() {
		return Approvalstatus;
	}

	public void setApprovalstatus(String approvalstatus) {
		Approvalstatus = approvalstatus;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}


	
	public String getDescription() {
		return description;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setDescription(String description) {
		this.description = description;
	}



	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getOperatingSystem() {
		return operatingSystem;
	}

	public void setOperatingSystem(String operatingSystem) {
		this.operatingSystem = operatingSystem;
	}

	public String getCamera() {
		return camera;
	}

	public void setCamera(String camera) {
		this.camera = camera;
	}

	public String getRam() {
		return ram;
	}

	public void setRam(String ram) {
		this.ram = ram;
	}

	public String getInternalMemory() {
		return internalMemory;
	}

	public void setInternalMemory(String internalMemory) {
		this.internalMemory = internalMemory;
	}

	public String getSoldby() {
		return soldby;
	}

	public void setSoldby(String soldby) {
		this.soldby = soldby;
	}

	public String getWirelessTechnology() {
		return wirelessTechnology;
	}

	public void setWirelessTechnology(String wirelessTechnology) {
		this.wirelessTechnology = wirelessTechnology;
	}

	public String getItemdimensions() {
		return itemdimensions;
	}

	public void setItemdimensions(String itemdimensions) {
		this.itemdimensions = itemdimensions;
	}

	public String getDisplaysize() {
		return displaysize;
	}

	public void setDisplaysize(String displaysize) {
		this.displaysize = displaysize;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getSimslot() {
		return simslot;
	}

	public void setSimslot(String simslot) {
		this.simslot = simslot;
	}

	public String getBatteryPower() {
		return batteryPower;
	}

	public void setBatteryPower(String batteryPower) {
		this.batteryPower = batteryPower;
	}

	public String getWhatinBox() {
		return whatinBox;
	}

	public void setWhatinBox(String whatinBox) {
		this.whatinBox = whatinBox;
	}

	public String getSpecialfeatures() {
		return specialfeatures;
	}

	public void setSpecialfeatures(String specialfeatures) {
		this.specialfeatures = specialfeatures;
	}

	public String getWarrenty() {
		return warrenty;
	}

	public void setWarrenty(String warrenty) {
		this.warrenty = warrenty;
	}

	


	

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}


	
}
