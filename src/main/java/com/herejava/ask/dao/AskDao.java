package com.herejava.ask.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.ask.vo.Ask;
import com.herejava.book.vo.Book;
import com.herejava.member.vo.Member;
import com.herejava.notice.vo.Notice;

import common.JDBCTemplate;

public class AskDao {

	public ArrayList<Ask> selectAskList(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Ask> list = new ArrayList<Ask>();
		String query = "select * from (select rownum as rnum,n. * from (select * from ask join member using(member_no)) n) where rnum between ? and ?";
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

	public Member selectOneNickName(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m1 = null;
		String query = "select * from member where member_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m1 = new Member();
				m1.setMemberNo(rset.getInt("member_no"));
				m1.setMemberId(rset.getString("member_id"));
				m1.setMemberPw(rset.getString("member_pw"));
				m1.setMemberName(rset.getString("member_name"));
				m1.setMemberNick(rset.getString("member_nick"));
				m1.setMemberPhone(rset.getString("member_phone"));
				m1.setMemberPoint(rset.getInt("member_point"));
				m1.setMemberLevel(rset.getInt("member_level"));
				m1.setFilepath(rset.getString("filepath"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m1;
	}
}
