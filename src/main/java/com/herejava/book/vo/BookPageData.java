package com.herejava.book.vo;

import java.util.ArrayList;

public class BookPageData {

	private ArrayList<BookData> bookList;
	private String pageNavi;
	public BookPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookPageData(ArrayList<BookData> bookList, String pageNavi) {
		super();
		this.bookList = bookList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<BookData> getBookList() {
		return bookList;
	}
	public void setBookList(ArrayList<BookData> bookList) {
		this.bookList = bookList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
