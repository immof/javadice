package com.herejava.point.vo;

public class Point {
	private int pointNo;
	private long payNo;
	private long bookNo;
	private int memberNo;
	private String bookDay;
	private int payAmount;
	private int usePoint;
	private int plusPoint;
	public Point() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Point(int pointNo, long payNo, long bookNo, int memberNo, String bookDay, int payAmount, int usePoint,
			int plusPoint) {
		super();
		this.pointNo = pointNo;
		this.payNo = payNo;
		this.bookNo = bookNo;
		this.memberNo = memberNo;
		this.bookDay = bookDay;
		this.payAmount = payAmount;
		this.usePoint = usePoint;
		this.plusPoint = plusPoint;
	}
	public int getPointNo() {
		return pointNo;
	}
	public void setPointNo(int pointNo) {
		this.pointNo = pointNo;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
	public int getPlusPoint() {
		return plusPoint;
	}
	public void setPlusPoint(int plusPoint) {
		this.plusPoint = plusPoint;
	}
}
