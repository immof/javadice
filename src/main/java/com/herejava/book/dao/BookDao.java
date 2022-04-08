package com.herejava.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;

public class BookDao {

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
