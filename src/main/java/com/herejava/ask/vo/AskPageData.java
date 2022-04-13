package com.herejava.ask.vo;

import java.util.ArrayList;

public class AskPageData {
	private ArrayList<Ask> list;
	private String pageNavi;
	public AskPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AskPageData(ArrayList<Ask> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Ask> getList() {
		return list;
	}
	public void setList(ArrayList<Ask> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
