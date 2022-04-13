package com.herejava.ask.vo;

public class Ask {
	private int askNo;
	private int memberNo;
	private String memberNick;
	private String askTitle;
	private String askContent;
	private String askEnrollDate;
	private String askReadCount;
	private String filepath1;
	private String filepath2;
	private String filepath3;
	public Ask() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Ask(int askNo, int memberNo,String memberNick, String askTitle, String askContent, String askEnrollDate, String askReadCount,
			String filepath1, String filepath2, String filepath3) {
		super();
		this.askNo = askNo;
		this.memberNo = memberNo;
		this.memberNick = memberNick;
		this.askTitle = askTitle;
		this.askContent = askContent;
		this.askEnrollDate = askEnrollDate;
		this.askReadCount = askReadCount;
		this.filepath1 = filepath1;
		this.filepath2 = filepath2;
		this.filepath3 = filepath3;
	}
	public int getAskNo() {
		return askNo;
	}
	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getAskTitle() {
		return askTitle;
	}
	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}
	public String getAskContent() {
		return askContent;
	}
	public String getAskContentBr() {
		return askContent.replaceAll("\r\n", "<br>");
	}
	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}
	public String getAskEnrollDate() {
		return askEnrollDate;
	}
	public void setAskEnrollDate(String askEnrollDate) {
		this.askEnrollDate = askEnrollDate;
	}
	public String getAskReadCount() {
		return askReadCount;
	}
	public void setAskReadCount(String askReadCount) {
		this.askReadCount = askReadCount;
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
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	
}
