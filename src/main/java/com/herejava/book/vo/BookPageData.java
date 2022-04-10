package com.herejava.book.vo;

import java.util.ArrayList;

public class BookPageData {

	private ArrayList<Book> bookList;
	private String pageNavi;
	public BookPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookPageData(ArrayList<Book> bookList, String pageNavi) {
		super();
		this.bookList = bookList;
		this.pageNavi = pageNavi;
	}
	public ArrayList<Book> getBookList() {
		return bookList;
	}
	public void setBookList(ArrayList<Book> bookList) {
		this.bookList = bookList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
