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

}
