package com.herejava.review.vo;

public class Review {
	private int reviewNo;
	private long bookNo;
	private int memberNo;
	private int reviewScore;
	private String reviewContent;
	private String reviewEnrollDate;
	private String filepath1;
	private String filepath2;
	private String filepath3;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewNo, int bookNo, int memberNo, int reviewScore, String reviewContent,
			String reviewEnrollDate, String filepath1, String filepath2, String filepath3) {
		super();
		this.reviewNo = reviewNo;
		this.bookNo = bookNo;
		this.memberNo = memberNo;
		this.reviewScore = reviewScore;
		this.reviewContent = reviewContent;
		this.reviewEnrollDate = reviewEnrollDate;
		this.filepath1 = filepath1;
		this.filepath2 = filepath2;
		this.filepath3 = filepath3;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public long getBookNo() {
		return bookNo;
	}
	public void setBookNo(long bookNo) {
		this.bookNo = bookNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public String getReviewContentBr() {
		return reviewContent.replaceAll("\r\n", "<br>");
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewEnrollDate() {
		return reviewEnrollDate;
	}
	public void setReviewEnrollDate(String reviewEnrollDate) {
		this.reviewEnrollDate = reviewEnrollDate;
	}
	public String getFilepath1() {
		return filepath1;
	}
	public void setFilepath1(String filepath1) {
		this.filepath1 = filepath1;
	}
	public String getFilepath2() {
		return filepath2;
	}
	public void setFilepath2(String filepath2) {
		this.filepath2 = filepath2;
	}
	public String getFilepath3() {
		return filepath3;
	}
	public void setFilepath3(String filepath3) {
		this.filepath3 = filepath3;
	}
	
}
