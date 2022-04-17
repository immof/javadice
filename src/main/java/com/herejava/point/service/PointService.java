package com.herejava.point.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.herejava.book.vo.BookPay;
import com.herejava.book.vo.BookPayData;
import com.herejava.pay.dao.PayDao;
import com.herejava.pay.vo.Pay;
import com.herejava.point.dao.PointDao;
import com.herejava.point.vo.Point;

import common.JDBCTemplate;

public class PointService {

	public ArrayList<Point> pointList(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		PointDao dao = new PointDao();
		ArrayList<Point> list = dao.pointList(conn, memberNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertPoint(BookPay bpay, BookPayData bpd, long payNo) {
		Connection conn = JDBCTemplate.getConnection();
		PointDao dao = new PointDao();
		int result = dao.insertPoint(conn, bpay,bpd,payNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Point getPayPoint(long bookNo) {
		Connection conn = JDBCTemplate.getConnection();
		PointDao dao = new PointDao();
		Point p = dao.getPayPoint(conn, bookNo);
		JDBCTemplate.close(conn);
		return p;
	}
	
}
