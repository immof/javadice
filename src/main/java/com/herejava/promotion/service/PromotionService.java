package com.herejava.promotion.service;

import java.sql.Connection;
import java.util.ArrayList;

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

	public int totalCount() {
		Connection conn = JDBCTemplate.getConnection();
		PromotionDao dao = new PromotionDao();
		int totalCount = dao.totalCount(conn);
		JDBCTemplate.close(conn);
		return totalCount;
	}
	
	//프로모션 더보기
	public ArrayList<Promotion> promotionMore(int start, int amount) {
		Connection conn = JDBCTemplate.getConnection();
		int end = start + amount - 1 ;
		PromotionDao dao = new PromotionDao();
		ArrayList<Promotion> list = dao.promotionMore(conn, start, end);
		JDBCTemplate.close(conn);
		return list;
	}

	//프로모션 삭제
	public int deletePromotion(int promotionNo) {
		Connection conn = JDBCTemplate.getConnection();
		PromotionDao dao = new PromotionDao();
		int result = dao.deletePromotion(conn, promotionNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int InsertPromotion(Promotion p) {
		Connection conn = JDBCTemplate.getConnection();
		PromotionDao dao = new PromotionDao();
		int result = dao.insertPromotion(conn, p);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updatePromotion(Promotion p) {
		Connection conn = JDBCTemplate.getConnection();
		PromotionDao dao = new PromotionDao();
		int result = dao.updatePromotion(conn, p);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		//System.out.println("서비스"+result);
		return result;
	}

	

}
