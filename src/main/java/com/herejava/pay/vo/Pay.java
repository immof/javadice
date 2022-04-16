package com.herejava.pay.vo;

public class Pay {
	private long payNo;
	private long bookNo;
	private int roomNo;
	private String roomName;
	private int bookState;
	private String bookDay;
	private int payAmount;
	private int usePoint;
	private int payStayday;
	private int memberNo;
	private int payRoomprice;
	public Pay() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pay(long payNo, long bookNo, int roomNo, String roomName, int bookState, String bookDay, int payAmount,
			int usePoint, int payStayday, int memberNo, int payRoomprice) {
		super();
		this.payNo = payNo;
		this.bookNo = bookNo;
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.bookState = bookState;
		this.bookDay = bookDay;
		this.payAmount = payAmount;
		this.usePoint = usePoint;
		this.payStayday = payStayday;
		this.memberNo = memberNo;
		this.payRoomprice = payRoomprice;
	}
	public long getPayNo() {
		return payNo;
	}
	public void setPayNo(long payNo) {
		this.payNo = payNo;
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public int getBookState() {
		return bookState;
	}
	public void setBookState(int bookState) {
		this.bookState = bookState;
	}
	public String getBookDay() {
		return bookDay;
	}
	public void setBookDay(String bookDay) {
		this.bookDay = bookDay;
	}
	public int getPayAmount() {
		return payAmount;
	}
	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public int getPayStayday() {
		return payStayday;
	}
	public void setPayStayday(int payStayday) {
		this.payStayday = payStayday;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getPayRoomprice() {
		return payRoomprice;
	}
	public void setPayRoomprice(int payRoomprice) {
		this.payRoomprice = payRoomprice;
	}
	
}
