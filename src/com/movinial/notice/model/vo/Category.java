package com.movinial.notice.model.vo;

public class Category {
	
	private int categoryNO; // CATEGORY_NO	NUMBER
	private String categoryName; // CATEGORY_NAME	VARCHAR2(30 BYTE)
	public Category() {
		super();
	}
	public Category(int categoryNO, String categoryName) {
		super();
		this.categoryNO = categoryNO;
		this.categoryName = categoryName;
	}
	public int getCategoryNO() {
		return categoryNO;
	}
	public void setCategoryNO(int categoryNO) {
		this.categoryNO = categoryNO;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "Category [categoryNO=" + categoryNO + ", categoryName=" + categoryName + "]";
	}
}