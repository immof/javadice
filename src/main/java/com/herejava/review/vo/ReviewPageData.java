package com.herejava.review.vo;

import java.util.ArrayList;

import com.herejava.ask.vo.Ask;


public class ReviewPageData {
	private ArrayList<ReviewListAdmin> list;
	private String pageNavi;
	public ReviewPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewPageData(ArrayList<ReviewListAdmin> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<ReviewListAdmin> getList() {
		return list;
	}
	public void setList(ArrayList<ReviewListAdmin> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
