package com.herejava.review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.herejava.review.vo.ReviewList;

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
				rv.setBookNo(rset.getInt("book_no"));
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

}
