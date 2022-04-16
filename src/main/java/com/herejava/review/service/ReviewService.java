package com.herejava.review.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.herejava.ask.vo.Ask;
import com.herejava.review.dao.ReviewDao;
import com.herejava.review.vo.Review;
import com.herejava.review.vo.ReviewList;
import com.herejava.review.vo.ReviewListAdmin;
import com.herejava.review.vo.ReviewPageData;

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

	public int revieWrite(Review rev) {
		Connection conn = JDBCTemplate.getConnection();
		ReviewDao dao = new ReviewDao();
		int result = dao.reviewWrite(conn, rev);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int reviewDelete(int reviewNo) {
		Connection conn = JDBCTemplate.getConnection();
		ReviewDao dao = new ReviewDao();
		int result = dao.reviewDelete(conn, reviewNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<ReviewListAdmin> getAllReview() {
		Connection conn = JDBCTemplate.getConnection();
		ReviewDao dao = new ReviewDao();
		ArrayList<ReviewListAdmin> reviewList = dao.getAllReview(conn);
		JDBCTemplate.close(conn);
		return reviewList;
	}

	public ReviewPageData selectAllReview(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		ReviewDao dao = new ReviewDao();
		//1. 결정사항 : 한 페이지당 게시물 수
				int numPerPage = 5;
				int end = reqPage*numPerPage;
				int start = end - numPerPage + 1;
				ArrayList<ReviewListAdmin> list = dao.selectAllReview(conn,start,end);
				//페이징처리
				//전체 페이지곗나을 위한 전체 게시물 수 조회
				int totalCount = dao.selectAllReviewCount(conn);
				//전체 페이지 수
				int totalPage = 0;
				if(totalCount%numPerPage == 0) {
					totalPage = totalCount/numPerPage;
				}else {
					totalPage = totalCount/numPerPage + 1;
				}
				//페이지 네비게이션의 길이 지정
				int pageNaviSize = 5;
				//페이지 네비게이션 시작 번호 계산
				int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
				
				//페이지 네비게이션 제작 시작
				String pageNavi = "<ul class='pagination circle-style'>";
				//이전버튼
				if(pageNo != 1) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/reviewList_admin.do?reqPage="+(pageNo-1)+"'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				//페이지숫자
				for(int i=0;i<pageNaviSize;i++) {
					if(pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/reviewList_admin.do?reqPage="+pageNo+"'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/reviewList_admin.do?reqPage="+pageNo+"'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}
					pageNo++;
					if(pageNo > totalPage) {
						break;
					}
				}
				//다음버튼
				if(pageNo <= totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/reviewList_admin.do?reqPage="+pageNo+"'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
				ReviewPageData rpd = new ReviewPageData(list, pageNavi);
				JDBCTemplate.close(conn);
				return rpd;
		
	}//selectAllReview

}//class
