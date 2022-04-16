package com.herejava.pay.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.herejava.book.vo.Book;
import com.herejava.member.vo.Member;
import com.herejava.pay.vo.Pay;

import common.JDBCTemplate;

public class PayDao {

	public Pay selectOnePay(Connection conn, long bookNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Pay pay = null;
		String query = "select * from pay where book_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, bookNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				pay = new Pay();
				pay.setPayNo(rset.getLong("pay_no"));
				pay.setRoomNo(rset.getInt("room_no"));
				pay.setBookNo(rset.getLong("book_no"));
				pay.setRoomName(rset.getString("room_name"));
				pay.setBookState(rset.getInt("book_state"));
				pay.setBookDay(rset.getString("book_day"));
				pay.setPayAmount(rset.getInt("pay_amount"));
				pay.setUsePoint(rset.getInt("use_point"));
				pay.setPayStayday(rset.getInt("pay_stayday"));
				pay.setMemberNo(rset.getInt("member_no"));
				pay.setPayRoomprice(rset.getInt("pay_room_price"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return pay;
	}

	public Pay getPayAmount(Connection conn, long bookNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Pay pay = null;
		String query = "select use_point, pay_amount from pay where book_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, bookNo);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				pay = new Pay();
				pay.setUsePoint(rset.getInt("use_point"));
				pay.setPayAmount(rset.getInt("pay_amount"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return pay;
	}
}
