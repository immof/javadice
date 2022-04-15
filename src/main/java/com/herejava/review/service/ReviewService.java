package com.herejava.review.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.herejava.review.dao.ReviewDao;
import com.herejava.review.vo.Review;
import com.herejava.review.vo.ReviewList;

import common.JDBCTemplate;

public class ReviewService {

	public ArrayList<ReviewList> myReview(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		ReviewDao dao = new ReviewDao();
		ArrayList<ReviewList> reviewList = dao.myReview(conn, memberNo);
		JDBCTemplate.close(conn);
		return reviewList;
	}

	public ReviewList getReview(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		ReviewDao dao = new ReviewDao();
		ReviewList list = dao.getReview(conn, reviewNo);
		JDBCTemplate.close(conn);
		return list;
	}

	public int reviewUpdate(Review rev) {
		Connection conn = JDBCTemplate.getConnection();
		ReviewDao dao = new ReviewDao();
		int result = dao.reviewUpdate(conn, rev);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
