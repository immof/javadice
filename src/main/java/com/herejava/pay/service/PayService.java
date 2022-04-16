package com.herejava.pay.service;

import java.sql.Connection;

import com.herejava.pay.dao.PayDao;
import com.herejava.pay.vo.Pay;

import common.JDBCTemplate;

public class PayService {

	//예약번호로 Pay 1개 가져오는 메소드
	public Pay selectOnePay(long bookNo) {
		Connection conn = JDBCTemplate.getConnection();
		PayDao dao = new PayDao();
		Pay pay = dao.selectOnePay(conn, bookNo);
		JDBCTemplate.close(conn);
		return pay;
	}

	public Pay getPayAmount(long bookNo) {
		Connection conn = JDBCTemplate.getConnection();
		PayDao dao = new PayDao();
		Pay pay = dao.getPayAmount(conn, bookNo);
		return pay;
	}
	
}
