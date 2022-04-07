package com.herejava.promotion.vo;

public class Promotion {
	private int promotionNo;
	private String promotionTitle;
	private String promotionSubTitle;
	private String promotionContent;
	private String startDate;
	private String endDate;
	private String filepath;
	public Promotion() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Promotion(int promotionNo, String promotionTitle, String promotionSubTitle, String promotionContent,
			String startDate, String endDate, String filepath) {
		super();
		this.promotionNo = promotionNo;
		this.promotionTitle = promotionTitle;
		this.promotionSubTitle = promotionSubTitle;
		this.promotionContent = promotionContent;
		this.startDate = startDate;
		this.endDate = endDate;
		this.filepath = filepath;
	}
	public int getPromotionNo() {
		return promotionNo;
	}
	public void setPromotionNo(int promotionNo) {
		this.promotionNo = promotionNo;
	}
	public String getPromotionTitle() {
		return promotionTitle;
	}
	public void setPromotionTitle(String promotionTitle) {
		this.promotionTitle = promotionTitle;
	}
	public String getPromotionSubTitle() {
		return promotionSubTitle;
	}
	public void setPromotionSubTitle(String promotionSubTitle) {
		this.promotionSubTitle = promotionSubTitle;
	}
	public String getPromotionContent() {
		return promotionContent;
	}
	public String getPromotionContentBr() {
		return promotionContent.replaceAll("\r\n", "<br>");
	}
	public void setPromotionContent(String promotionContent) {
		this.promotionContent = promotionContent;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}
