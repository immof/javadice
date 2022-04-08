package com.herejava.promotion.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.herejava.promotion.vo.Promotion;

import common.JDBCTemplate;

public class PromotionDao {
	
	private Promotion setPromotion(ResultSet rset) {
		Promotion p = new Promotion();
		try {
			p.setPromotionNo(rset.getInt("promotion_no"));
			p.setPromotionTitle(rset.getString("promotion_title"));
			p.setPromotionSubTitle(rset.getString("promotion_sub_title"));
			p.setPromotionContent(rset.getString("promotion_content"));
			p.setStartDate(rset.getString("start_date"));
			p.setEndDate(rset.getString("end_date"));
			p.setFilepath(rset.getString("filepath"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
	
	public Promotion selectOnePromotion(Connection conn, int promotionNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Promotion p = null;
		String query = "select * from promotion where promotion_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, promotionNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				p = setPromotion(rset);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return p;
	}

}
