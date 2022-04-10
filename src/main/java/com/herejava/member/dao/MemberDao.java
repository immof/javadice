package com.herejava.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.book.vo.Book;
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


	public ArrayList<Member> selectAllMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member";
		try {
			pstmt = conn.prepareStatement(query);
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
	
	//예약리스트 전체 가져오는 메소드
		public ArrayList<Book> selectAllBook(Connection conn) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Book> list = new ArrayList<Book>();
			String query = "select * from book";
			try {
				pstmt = conn.prepareStatement(query);
				rset = pstmt.executeQuery();
				while(rset.next()) {
					Book b = new Book();
					b.setBookNo(rset.getLong("book_no"));
					b.setRoomNo(rset.getInt("room_no"));
					b.setMemberNo(rset.getInt("member_no"));
					b.setBookPeople(rset.getInt("book_people"));
					b.setBookName(rset.getString("book_name"));
					b.setBookPhone(rset.getString("book_phone"));
					b.setBookDay(rset.getString("book_day"));
					b.setBookState(rset.getInt("book_state"));
					b.setCheckIn(rset.getString("check_in"));
					b.setCheckOut(rset.getString("check_out"));
					list.add(b);
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
		
	
	
}//MemberDao class
