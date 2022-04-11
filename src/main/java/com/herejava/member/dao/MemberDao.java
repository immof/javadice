package com.herejava.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.member.vo.Member;

import common.JDBCTemplate;

public class MemberDao {
	public Member getMember(ResultSet rset) {
		Member m = new Member();
		try {
			m.setMemberNo(rset.getInt("member_no"));
			m.setMemberId(rset.getString("member_id"));
			m.setMemberPw(rset.getString("member_pw"));
			m.setMemberName(rset.getString("member_name"));
			m.setMemberNick(rset.getString("member_nick"));
			m.setMemberPhone(rset.getString("member_phone"));
			m.setMemberPoint(rset.getInt("member_point"));
			m.setMemberLevel(rset.getInt("member_level"));
			m.setFilepath(rset.getString("filepath"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return m;
	}
	

	public Member selecOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = getMember(rset);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}//selecOneMember

	public Member selectOneMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_id = ? and member_pw = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPw());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = getMember(rset);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}//로그인용 DB 조회


	public ArrayList<Member> selectAllMember(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from (select rownum rnum, m.* from member m) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = getMember(rset);
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return list;
	}


	public int totalMemberCount(Connection conn) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		int totalMemberCount= 0;
		String query = "select count(*) c from member";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalMemberCount = rset.getInt("c");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		
		return totalMemberCount;
	}


	public int memberNickChk(Connection conn, String memberNick) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select * from member where member_nick = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNick);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	
	
	
	
}//MemberDao class
