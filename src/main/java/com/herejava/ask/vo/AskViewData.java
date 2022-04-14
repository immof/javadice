package com.herejava.ask.vo;

import java.util.ArrayList;

public class AskViewData {
	private Ask a;
	private ArrayList<AskComment> commentList;
	private ArrayList<AskComment> reCommentList;
	public AskViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AskViewData(Ask a, ArrayList<AskComment> commentList, ArrayList<AskComment> reCommentList) {
		super();
		this.a = a;
		this.commentList = commentList;
		this.reCommentList = reCommentList;
	}
	public Ask getA() {
		return a;
	}
	public void setA(Ask a) {
		this.a = a;
	}
	public ArrayList<AskComment> getCommentList() {
		return commentList;
	}
	public void setCommentList(ArrayList<AskComment> commentList) {
		this.commentList = commentList;
	}
	public ArrayList<AskComment> getReCommentList() {
		return reCommentList;
	}
	public void setReCommentList(ArrayList<AskComment> reCommentList) {
		this.reCommentList = reCommentList;
	}
	
	
}
