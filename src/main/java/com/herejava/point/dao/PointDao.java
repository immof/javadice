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
		String query = "select * from point where member_no=? order by book_no desc";
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

	public int insertPoint(Connection conn, BookPay bpay, BookPayData bpd, long payNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into point values(point_seq.nextval,?,?,?,?,?,?,?) ";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, payNo);
			pstmt.setLong(2, bpd.getBookNo());
			pstmt.setInt(3, bpay.getMemberNo());
			pstmt.setString(4, bpd.getBookDay());
			pstmt.setInt(5, bpay.getPayAmount());
			pstmt.setInt(6, bpay.getMinusPoint());
			pstmt.setInt(7, bpay.getPlusPoint());
			
			result = pstmt.executeUpdate(); 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Point getPayPoint(Connection conn, long bookNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Point p = new Point();
		String query = "select * from point where book_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, bookNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				p.setPointNo(rset.getInt("point_no"));
				p.setPayNo(rset.getLong("pay_no"));		
				p.setBookNo(rset.getLong("book_no"));
				p.setMemberNo(rset.getInt("member_no"));
				p.setBookDay(rset.getString("book_day"));
				p.setPayAmount(rset.getInt("pay_amount"));
				p.setUsePoint(rset.getInt("use_point"));
				p.setPlusPoint(rset.getInt("plus_point"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return p;
	}

}
