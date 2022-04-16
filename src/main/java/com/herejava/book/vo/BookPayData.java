package com.herejava.book.vo;

public class BookPayData {
	private long bookNo;
	private String bookDay;
	public BookPayData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookPayData(long bookNo, String bookDay) {
		super();
		this.bookNo = bookNo;
		this.bookDay = bookDay;
	}
	public long getBookNo() {
		return bookNo;
	}
	public void setBookNo(long bookNo) {
		this.bookNo = bookNo;
	}
	public String getBookDay() {
		return bookDay;
	}
	public void setBookDay(String bookDay) {
		this.bookDay = bookDay;
	}
	
}
