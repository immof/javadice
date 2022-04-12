package com.herejava.book.vo;

import java.util.ArrayList;

public class BookCheckPage {
	private ArrayList<Book> list;
	private String pageNavi;
	public BookCheckPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookCheckPage(ArrayList<Book> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Book> getList() {
		return list;
	}
	public void setList(ArrayList<Book> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
