package com.herejava.promotion.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	//프로모션의 총 갯수를 구해오는 메소드
	public int totalCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalCount = 0;
		String query = "select count(*) cnt from promotion";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalCount = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return totalCount;
	}
	
	//프로모션 더보기
	public ArrayList<Promotion> promotionMore(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Promotion> list = new ArrayList<Promotion>();
		String query = "select * from (select rownum as rnum, p.* from (select * from promotion order by 1 desc)p) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Promotion p = setPromotion(rset);
				list.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

	//프로모션 삭제
	public int deletePromotion(Connection conn, int promotionNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from promotion where promotion_no = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, promotionNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertPromotion(Connection conn, Promotion p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into promotion values(promotion_seq.nextval,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPromotionTitle());
			pstmt.setString(2, p.getPromotionSubTitle());
			pstmt.setString(3, p.getPromotionContent());
			pstmt.setString(4, p.getStartDate());
			pstmt.setString(5, p.getEndDate());
			pstmt.setString(6, p.getFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updatePromotion(Connection conn, Promotion p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update promotion set promotion_title =?,promotion_sub_title =?, promotion_content =?, start_date=?, end_date=?, filepath=? where promotion_no=?";
		/*
		System.out.println(p.getPromotionNo());
		System.out.println(p.getPromotionTitle());
		System.out.println(p.getPromotionSubTitle());
		System.out.println(p.getPromotionContent());
		System.out.println(p.getStartDate());
		System.out.println(p.getEndDate());
		System.out.println(p.getFilepath());
		*/
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getPromotionTitle());
			pstmt.setString(2, p.getPromotionSubTitle());
			pstmt.setString(3, p.getPromotionContent());
			pstmt.setString(4, p.getStartDate());
			pstmt.setString(5, p.getEndDate());
			pstmt.setString(6, p.getFilepath());
			pstmt.setInt(7, p.getPromotionNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			JDBCTemplate.close(pstmt);
		}
		//System.out.println("다오"+result);
		return result;
	}

}
