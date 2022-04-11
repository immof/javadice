package com.herejava.book.vo;

public class BookData {
	private String filePath;
	private String roomName;
	private String checkIn;
	private String checkOut;
	private int bookState;
	private int bookPeople;
	private String bookName;
	private String bookPhone;
	public BookData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookData(String filePath, String roomName, String checkIn, String checkOut, int bookState, int bookPeople,
			String bookName, String bookPhone) {
		super();
		this.filePath = filePath;
		this.roomName = roomName;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.bookState = bookState;
		this.bookPeople = bookPeople;
		this.bookName = bookName;
		this.bookPhone = bookPhone;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
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
	public int getBookState() {
		return bookState;
	}
	public void setBookState(int bookState) {
		this.bookState = bookState;
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
	
}
