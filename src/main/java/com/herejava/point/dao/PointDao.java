package com.herejava.point.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.book.vo.BookPay;
import com.herejava.book.vo.BookPayData;
import com.herejava.point.vo.Point;

import common.JDBCTemplate;

public class PointDao {

	public ArrayList<Point> pointList(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Point> list = new ArrayList<Point>();
		Point p = null;
		String query = "select * from point where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				p = new Point();
				p.setPointNo(rset.getInt("point_no"));
				p.setPayNo(rset.getLong("pay_no"));		
				p.setBookNo(rset.getLong("book_no"));
				p.setMemberNo(rset.getInt("member_no"));
				p.setBookDay(rset.getString("book_day"));
				p.setPayAmount(rset.getInt("pay_amount"));
				p.setUsePoint(rset.getInt("use_point"));
				p.setPlusPoint(rset.getInt("plus_point"));
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	public int insertPoint(Connection conn, BookPay bpay, BookPayData bpd) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into point values(point_seq.nextval,?,?,?,0,?,?,?,?,?,?) ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, bpd.getBookNo());
			pstmt.setInt(2, bpay.getRoomNo());
			pstmt.setString(3, bpay.getRoomName());
			pstmt.setString(4, bpd.getBookDay());
			pstmt.setInt(5, bpay.getPayAmount());
			pstmt.setInt(6, bpay.getMinusPoint());
			pstmt.setInt(7, bpay.getPayStayDay());
			pstmt.setInt(8, bpay.getMemberNo());
			pstmt.setInt(9, bpay.getPayRoomPrice());
			
			result = pstmt.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

}