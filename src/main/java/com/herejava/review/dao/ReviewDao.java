package com.herejava.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.ask.vo.Ask;
import com.herejava.review.vo.Review;
import com.herejava.review.vo.ReviewList;
import com.herejava.review.vo.ReviewListAdmin;

import common.JDBCTemplate;

public class ReviewDao {

	public ArrayList<ReviewList> myReview(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewList> reviewList = new ArrayList<ReviewList>();
		String query = "select * from review r,book b where r.book_no=b.book_no and r.member_no=? order by review_enroll_date desc";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewList rv = new ReviewList();
				rv.setReviewNo(rset.getInt("review_no"));
				rv.setBookNo(rset.getLong("book_no"));
				rv.setMemberNo(rset.getInt("member_no"));
				rv.setReviewScore(rset.getInt("review_score"));
				rv.setReviewContent(rset.getString("review_content"));
				rv.setReviewEnrollDate(rset.getString("review_enroll_date"));
				rv.setFilepath1(rset.getString("filepath1"));
				rv.setFilepath2(rset.getString("filepath2"));
				rv.setFilepath3(rset.getString("filepath3"));
				rv.setRoomNo(rset.getInt("room_no"));
				rv.setBookPeople(rset.getInt("book_people"));
				rv.setBookName(rset.getString("book_name"));
				rv.setBookPhone(rset.getString("book_phone"));
				rv.setBookDay(rset.getString("book_day"));
				rv.setBookState(rset.getInt("book_state"));
				rv.setCheckIn(rset.getString("check_in"));
				rv.setCheckOut(rset.getString("check_out"));
				reviewList.add(rv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return reviewList;
	}

	public ReviewList getReview(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReviewList list = null;
		String query = "select * from review r,book b where r.book_no=b.book_no and r.review_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				list = new ReviewList();
				list.setReviewNo(rset.getInt("review_no"));
				list.setBookNo(rset.getLong("book_no"));
				list.setMemberNo(rset.getInt("member_no"));
				list.setReviewScore(rset.getInt("review_score"));
				list.setReviewContent(rset.getString("review_content"));
				list.setReviewEnrollDate(rset.getString("review_enroll_date"));
				list.setFilepath1(rset.getString("filepath1"));
				list.setFilepath2(rset.getString("filepath2"));
				list.setFilepath3(rset.getString("filepath3"));
				list.setRoomNo(rset.getInt("room_no"));
				list.setBookPeople(rset.getInt("book_people"));
				list.setBookName(rset.getString("book_name"));
				list.setBookPhone(rset.getString("book_phone"));
				list.setBookDay(rset.getString("book_day"));
				list.setBookState(rset.getInt("book_state"));
				list.setCheckIn(rset.getString("check_in"));
				list.setCheckOut(rset.getString("check_out"));
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

	public int reviewUpdate(Connection conn, Review rev) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update review set review_score=?, review_content=?, filepath1=?, filepath2=?, filepath3=? where review_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rev.getReviewScore());
			pstmt.setString(2, rev.getReviewContent());
			pstmt.setString(3, rev.getFilepath1());
			pstmt.setString(4, rev.getFilepath2());
			pstmt.setString(5, rev.getFilepath3());
			pstmt.setInt(6, rev.getReviewNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int reviewWrite(Connection conn, Review rev) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into review values(review_seq.nextval,?,?,?,?,to_char(sysdate,'yyyy-mm-dd'),?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setLong(1, rev.getBookNo());
			pstmt.setInt(2, rev.getMemberNo());
			pstmt.setInt(3, rev.getReviewScore());
			pstmt.setString(4, rev.getReviewContent());
			pstmt.setString(5, rev.getFilepath1());
			pstmt.setString(6, rev.getFilepath2());
			pstmt.setString(7, rev.getFilepath3());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int reviewDelete(Connection conn, int reviewNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete review where review_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<ReviewListAdmin> getAllReview(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewListAdmin> reviewList = new ArrayList<ReviewListAdmin>();
		String query = "select r.*,b.*,m.filepath memberProfile from review r,book b,member m where r.book_no=b.book_no and r.member_no=m.member_no order by review_enroll_date desc";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewListAdmin rv = new ReviewListAdmin();
				rv.setReviewNo(rset.getInt("review_no"));
				rv.setBookNo(rset.getLong("book_no"));
				rv.setMemberNo(rset.getInt("member_no"));
				rv.setReviewScore(rset.getInt("review_score"));
				rv.setReviewContent(rset.getString("review_content"));
				rv.setReviewEnrollDate(rset.getString("review_enroll_date"));
				rv.setFilepath1(rset.getString("filepath1"));
				rv.setFilepath2(rset.getString("filepath2"));
				rv.setFilepath3(rset.getString("filepath3"));
				rv.setRoomNo(rset.getInt("room_no"));
				rv.setBookPeople(rset.getInt("book_people"));
				rv.setBookName(rset.getString("book_name"));
				rv.setBookPhone(rset.getString("book_phone"));
				rv.setBookDay(rset.getString("book_day"));
				rv.setBookState(rset.getInt("book_state"));
				rv.setCheckIn(rset.getString("check_in"));
				rv.setCheckOut(rset.getString("check_out"));
				rv.setMemberProfile(rset.getString("memberProfile"));
				reviewList.add(rv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return reviewList;
	}

	public ArrayList<ReviewListAdmin> selectAllReview(Connection conn, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReviewListAdmin> list = new ArrayList<ReviewListAdmin>();
		String query = "select * from (select * from (select rownum as rnum,n.* from (select r.*,b.room_no,b.book_people,b.book_name,b.book_phone,b.book_day,b.book_state,b.check_in,b.check_out,m.filepath memberProfile from review r,book b,member m where r.book_no=b.book_no and r.member_no=m.member_no order by review_enroll_date desc)n) where rnum between ? and ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReviewListAdmin rv = new ReviewListAdmin();
				rv.setReviewNo(rset.getInt("review_no"));
				rv.setBookNo(rset.getLong("book_no"));
				rv.setMemberNo(rset.getInt("member_no"));
				rv.setReviewScore(rset.getInt("review_score"));
				rv.setReviewContent(rset.getString("review_content"));
				rv.setReviewEnrollDate(rset.getString("review_enroll_date"));
				rv.setFilepath1(rset.getString("filepath1"));
				rv.setFilepath2(rset.getString("filepath2"));
				rv.setFilepath3(rset.getString("filepath3"));
				rv.setRoomNo(rset.getInt("room_no"));
				rv.setBookPeople(rset.getInt("book_people"));
				rv.setBookName(rset.getString("book_name"));
				rv.setBookPhone(rset.getString("book_phone"));
				rv.setBookDay(rset.getString("book_day"));
				rv.setBookState(rset.getInt("book_state"));
				rv.setCheckIn(rset.getString("check_in"));
				rv.setCheckOut(rset.getString("check_out"));
				rv.setMemberProfile(rset.getString("memberProfile"));
				list.add(rv);
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

	public int selectAllReviewCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = "select count(*) as cnt from review";
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


}
