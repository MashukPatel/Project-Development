package com.model;

public class ProductModel 
{
	private int menproductid,sellingprice,originalprice;
	private String menproductname,image,productcategory,womenproductname,producttype,discount;

	
	public int getSellingprice() {
		return sellingprice;
	}
	public void setSellingprice(int sellingprice) {
		this.sellingprice = sellingprice;
	}
	public int getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(int originalprice) {
		this.originalprice = originalprice;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getWomenproductname() {
		return womenproductname;
	}
	public String getProducttype() {
		return producttype;
	}
	public void setProducttype(String producttype) {
		this.producttype = producttype;
	}
	public void setWomenproductname(String womenproductname) {
		this.womenproductname = womenproductname;
	}
	public String getProductcategory() {
		return productcategory;
	}
	public void setProductcategory(String productcategory) {
		this.productcategory = productcategory;
	}
		
	public int getMenproductid() {
		return menproductid;
	}
	public void setMenproductid(int menproductid) {
		this.menproductid = menproductid;
	}
	public String getMenproductname() {
		return menproductname;
	}
	public void setMenproductname(String menproductname) {
		this.menproductname = menproductname;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
		
}
