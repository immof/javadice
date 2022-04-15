package com.herejava.point.service;

import java.sql.Connection;
import java.util.ArrayList;

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

}
