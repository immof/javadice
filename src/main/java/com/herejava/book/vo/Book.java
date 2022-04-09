package com.herejava.book.vo;

public class Book {
	private long bookNo;
	private int roomNo;
	private int memberNo;
	private int bookPeople;
	private String bookName;
	private String bookPhone;
	private String bookDay;
	private int bookState;
	private String checkIn;
	private String checkOut;
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Book(long bookNo, int roomNo, int memberNo, int bookPeople, String bookName, String bookPhone,
			String bookDay, int bookState, String checkIn, String checkOut) {
		super();
		this.bookNo = bookNo;
		this.roomNo = roomNo;
		this.memberNo = memberNo;
		this.bookPeople = bookPeople;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
		this.bookDay = bookDay;
		this.bookState = bookState;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
	}
	public long getBookNo() {
		return bookNo;
	}
	public void setBookNo(long bookNo) {
		this.bookNo = bookNo;
	}
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	
	
}
