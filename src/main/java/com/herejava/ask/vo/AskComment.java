package com.herejava.ask.vo;

public class AskComment {
	private int askCommentNo;
	private String askCommentWriter;
	private int askRef;
	private int askCommentRef;
	private String askCommentContent;
	private String askCommentEnrollDate;
	public AskComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AskComment(int askCommentNo, String askCommentWriter, int askRef, int askCommentRef,
			String askCommentContent, String askCommentEnrollDate) {
		super();
		this.askCommentNo = askCommentNo;
		this.askCommentWriter = askCommentWriter;
		this.askRef = askRef;
		this.askCommentRef = askCommentRef;
		this.askCommentContent = askCommentContent;
		this.askCommentEnrollDate = askCommentEnrollDate;
	}
	public int getAskCommentNo() {
		return askCommentNo;
	}
	public void setAskCommentNo(int askCommentNo) {
		this.askCommentNo = askCommentNo;
	}
	public String getAskCommentWriter() {
		return askCommentWriter;
	}
	public void setAskCommentWriter(String askCommentWriter) {
		this.askCommentWriter = askCommentWriter;
	}
	public int getAskRef() {
		return askRef;
	}
	public void setAskRef(int askRef) {
		this.askRef = askRef;
	}
	public int getAskCommentRef() {
		return askCommentRef;
	}
	public void setAskCommentRef(int askCommentRef) {
		this.askCommentRef = askCommentRef;
	}
	public String getAskCommentContent() {
		return askCommentContent;
	}
	public String getAskCommentContentBr() {
		return askCommentContent.replaceAll("\r\n", "<br>");
	}
	public void setAskCommentContent(String askCommentContent) {
		this.askCommentContent = askCommentContent;
	}
	public String getAskCommentEnrollDate() {
		return askCommentEnrollDate;
	}
	public void setAskCommentEnrollDate(String askCommentEnrollDate) {
		this.askCommentEnrollDate = askCommentEnrollDate;
	}
	
}
