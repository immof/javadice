package com.herejava.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.herejava.book.vo.Book;
import common.JDBCTemplate;

public class BookDao {
	
	//예약번호로 예약객체 1개 가져오는 dao 메소드
	public Book selectOneBook(Connection conn, long bookNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Book b = null;
		String query = "select * from book where book_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, bookNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new Book();
				b.setBookNo(rset.getLong("book_no"));
				b.setRoomNo(rset.getInt("room_no"));
				b.setMemberNo(rset.getInt("member_no"));
				b.setBookPeople(rset.getInt("book_people"));
				b.setBookName(rset.getString("book_name"));
				b.setBookPhone(rset.getString("book_phone"));
				b.setBookDay(rset.getString("book_day"));
				b.setBookState(rset.getInt("book_state"));
				b.setCheckIn(rset.getString("check_in"));
				b.setCheckOut(rset.getString("check_out"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}

	public int searchBookCount(Connection conn, int roomNo, String dayToStr) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) from book where room_no = ? and check_in <= ? and check_out > ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, roomNo);
			pstmt.setString(2, dayToStr);
			pstmt.setString(3, dayToStr);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("count(*)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
}
















