package com.herejava.book.service;

import java.sql.Connection;

import com.herejava.book.dao.BookDao;
import com.herejava.book.vo.Book;

import common.JDBCTemplate;

public class BookService {

	//예약번호로 객체 1개 가져오는 service 메소드
	public Book selectOneBook(int bookNo) {
		Connection conn = JDBCTemplate.getConnection();
		BookDao dao = new BookDao();
		Book b = dao.selectOneBook(conn, bookNo);
		JDBCTemplate.close(conn);
		return b;
	}
	
}
