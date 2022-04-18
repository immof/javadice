package com.herejava.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.book.vo.Book;
import com.herejava.book.vo.BookPay;
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
	
	public Member selectOneMember2(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
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
	}//마이페이지 회원정보 수정용 

	public Member selectOneMember3(Connection conn, String memberNick) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_nick = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNick);
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
	}//마이페이지 닉네임 중복체크용


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

	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member set member_name=?, member_nick=?, member_phone=? where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberName());
			pstmt.setString(2, member.getMemberNick());
			pstmt.setString(3, member.getMemberPhone());
			pstmt.setString(4, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int updatePw(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member set member_pw=? where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPw());
			pstmt.setString(2, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
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

	//DB에 회원정보 insert
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into member values(member_seq.nextval,?,?,?,?,?,'0','1',?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberNick());
			pstmt.setString(5, m.getMemberPhone());
			pstmt.setString(6, m.getFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	public ArrayList<Member> searchMember(Connection conn, int start, int end, String searchMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from (select rownum rnum, m.* from (select * from member where member_id = ? or member_name = ? or member_nick = ?) m) where rnum between ? and ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchMember);
			pstmt.setString(2, searchMember);
			pstmt.setString(3, searchMember);
			pstmt.setInt(4, start);
			pstmt.setInt(5, end);
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


	public int delMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from member where member_no=?";
		try {
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	//비밀번호 찾기
	public int passChange(Connection conn, String memberId, String memberPw) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update member set member_pw = ? where member_id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberPw);
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
  
 	public int updateMemberPoint(Connection conn, BookPay bpay, int newPoint) {
 		PreparedStatement pstmt = null;
 		int result = 0;
 		System.out.println("dao도착");
 		System.out.println("dao도착하고 넘버:"+bpay.getMemberNo());
 		System.out.println("dao도착하고 포인트:"+newPoint);
 		System.out.println("---------------그다음에 query---------");
 		String query = "update member set member_point = ? where member_no = ?";
 		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, newPoint);
			pstmt.setInt(2, bpay.getMemberNo());
			result = pstmt.executeUpdate();
			System.out.println("newPoint- "+newPoint);
			System.out.println("bpay.getMemberNo()- "+bpay.getMemberNo());
			System.out.println("result- "+result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
 		System.out.println("다오에서 result출력?>"+result);
		return result;
	} 
  
	public int getPoint(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int totalPoint = 0;
		String query = "select member_point from member where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				totalPoint = rset.getInt("member_point");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return totalPoint;
	}


	public Member getMemberInfo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
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
		
	}


	
	
	
}//MemberDao class
