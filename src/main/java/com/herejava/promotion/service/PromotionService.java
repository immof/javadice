package com.herejava.promotion.service;

import java.sql.Connection;

import com.herejava.promotion.dao.PromotionDao;
import com.herejava.promotion.vo.Promotion;

import common.JDBCTemplate;

public class PromotionService {

	public Promotion selectOnePromotion(int promotionNo) {
		Connection conn = JDBCTemplate.getConnection();
		PromotionDao dao = new PromotionDao();
		Promotion p = dao.selectOnePromotion(conn, promotionNo);
		JDBCTemplate.close(conn);
		return p;
	}

	

}
