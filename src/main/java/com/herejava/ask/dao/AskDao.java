package com.herejava.ask.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.ask.vo.Ask;
import com.herejava.ask.vo.AskComment;

import common.JDBCTemplate;

public class AskDao {

	public ArrayList<Ask> selectAskList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ask> list = new ArrayList<Ask>();
		String query = "select * from(select * from (select rownum as rnum,n. * from (select * from ask join member using(member_no) order by ask_no desc) n) where rnum between ? and ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Ask a = new Ask();
				a.setAskNo(rset.getInt("ask_no"));
				a.setMemberNo(rset.getInt("member_no"));
				a.setMemberNick(rset.getString("member_Nick"));
				a.setAskTitle(rset.getNString("ask_title"));
				a.setAskContent(rset.getString("ask_content"));
				a.setAskEnrollDate(rset.getString("ask_enroll_date"));
				a.setAskReadCount(rset.getString("ask_read_count"));
				a.setFilepath1(rset.getString("filepath1"));
				a.setFilepath2(rset.getString("filepath2"));
				a.setFilepath3(rset.getString("filepath3"));
				list.add(a);
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

	public int totalAskCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from ask";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			};
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Ask selectOneAsk(Connection conn, int askNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Ask a = null;
		String query = "select * from ask join member using(member_no) where ask_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, askNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				a = new Ask();
				a.setAskNo(rset.getInt("ask_no"));
				a.setMemberNo(rset.getInt("member_no"));
				a.setMemberNick(rset.getString("member_Nick"));
				a.setAskTitle(rset.getNString("ask_title"));
				a.setAskContent(rset.getString("ask_content"));
				a.setAskEnrollDate(rset.getString("ask_enroll_date"));
				a.setAskReadCount(rset.getString("ask_read_count"));
				a.setFilepath1(rset.getString("filepath1"));
				a.setFilepath2(rset.getString("filepath2"));
				a.setFilepath3(rset.getString("filepath3"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return a;
	}

	public ArrayList<AskComment> selectAskComment(Connection conn, int askNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AskComment> list = new ArrayList<AskComment>();
		String query = "select * from ask_comment where ask_comment_ref=? and ask_ref is null";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, askNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				AskComment a = new AskComment();
				a.setAskCommentNo(rset.getInt("ask_comment_no"));
				a.setAskCommentWriter(rset.getString("ask_comment_writer"));
				a.setAskRef(rset.getInt("ask_ref"));
				a.setAskCommentRef(rset.getInt("ask_comment_ref"));
				a.setAskCommentContent(rset.getString("ask_comment_content"));
				a.setAskCommentEnrollDate(rset.getString("ask_comment_enroll_date"));
				list.add(a);
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

	public ArrayList<AskComment> selectAskReComment(Connection conn, int askNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AskComment> list = new ArrayList<AskComment>();
		String query = "select * from ask_comment where ask_comment_ref=? and ask_ref is null";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, askNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				AskComment a = new AskComment();
				a.setAskCommentNo(rset.getInt("ask_comment_no"));
				a.setAskCommentWriter(rset.getString("ask_comment_writer"));
				a.setAskRef(rset.getInt("ask_ref"));
				a.setAskCommentRef(rset.getInt("ask_comment_ref"));
				a.setAskCommentContent(rset.getString("ask_comment_content"));
				a.setAskCommentEnrollDate(rset.getString("ask_comment_enroll_date"));
				list.add(a);
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

	public int updateReadCount(Connection conn, int askNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query= "update ask set ask_read_count = ask_read_count+1 where ask_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, askNo);
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
