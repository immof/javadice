package com.herejava.review.vo;

public class ReviewListAdmin {
	private int reviewNo;
	private long bookNo;
	private int memberNo;
	private int reviewScore;
	private String reviewContent;
	private String reviewEnrollDate;
	private String filepath1;
	private String filepath2;
	private String filepath3;
	private int roomNo;
	private int bookPeople;
	private String bookName;
	private String bookPhone;
	private String bookDay;
	private int bookState;
	private String checkIn;
	private String checkOut;
	private String memberProfile;
	public ReviewListAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewListAdmin(int reviewNo, long bookNo, int memberNo, int reviewScore, String reviewContent,
			String reviewEnrollDate, String filepath1, String filepath2, String filepath3, int roomNo, int bookPeople,
			String bookName, String bookPhone, String bookDay, int bookState, String checkIn, String checkOut,
			String memberProfile) {
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
		this.roomNo = roomNo;
		this.bookPeople = bookPeople;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
		this.bookDay = bookDay;
		this.bookState = bookState;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.memberProfile = memberProfile;
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
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getBookPeople() {
		return bookPeople;
	}
	public void setBookPeople(int bookPeople) {
		this.bookPeople = bookPeople;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookPhone() {
		return bookPhone;
	}
	public void setBookPhone(String bookPhone) {
		this.bookPhone = bookPhone;
	}
	public String getBookDay() {
		return bookDay;
	}
	public void setBookDay(String bookDay) {
		this.bookDay = bookDay;
	}
	public int getBookState() {
		return bookState;
	}
	public void setBookState(int bookState) {
		this.bookState = bookState;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	
}
