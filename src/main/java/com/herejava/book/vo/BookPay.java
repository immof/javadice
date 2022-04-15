package com.herejava.book.vo;

public class BookPay {
	private int memberNo;
	private int roomNo;
	private String bookName;
	private int bookPeople;
	private String bookPhone;
	private int payAmount;
	private int payStayDay;
	private int payRoomPrice;
	private String checkIn;
	private String checkOut;
	private int memberPoint;
	private int minusPoint;
	private int plusPoint;
	private String roomName;
	public BookPay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookPay(int memberNo, int roomNo, String bookName, int bookPeople, String bookPhone, int payAmount,
			int payStayDay, int payRoomPrice, String checkIn, String checkOut, int memberPoint, int minusPoint,
			int plusPoint, String roomName) {
		super();
		this.memberNo = memberNo;
		this.roomNo = roomNo;
		this.bookName = bookName;
		this.bookPeople = bookPeople;
		this.bookPhone = bookPhone;
		this.payAmount = payAmount;
		this.payStayDay = payStayDay;
		this.payRoomPrice = payRoomPrice;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.memberPoint = memberPoint;
		this.minusPoint = minusPoint;
		this.plusPoint = plusPoint;
		this.roomName = roomName;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public int getBookPeople() {
		return bookPeople;
	}
	public void setBookPeople(int bookPeople) {
		this.bookPeople = bookPeople;
	}
	public String getBookPhone() {
		return bookPhone;
	}
	public void setBookPhone(String bookPhone) {
		this.bookPhone = bookPhone;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	public int getPayStayDay() {
		return payStayDay;
	}
	public void setPayStayDay(int payStayDay) {
		this.payStayDay = payStayDay;
	}
	public int getPayRoomPrice() {
		return payRoomPrice;
	}
	public void setPayRoomPrice(int payRoomPrice) {
		this.payRoomPrice = payRoomPrice;
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
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public int getMinusPoint() {
		return minusPoint;
	}
	public void setMinusPoint(int minusPoint) {
		this.minusPoint = minusPoint;
	}
	public int getPlusPoint() {
		return plusPoint;
	}
	public void setPlusPoint(int plusPoint) {
		this.plusPoint = plusPoint;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	
}