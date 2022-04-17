package com.herejava.ask.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.herejava.ask.dao.AskDao;
import com.herejava.ask.vo.Ask;
import com.herejava.ask.vo.AskComment;
import com.herejava.ask.vo.AskPageData;
import com.herejava.ask.vo.AskViewData;
import com.herejava.notice.vo.Notice;

import common.JDBCTemplate;


public class AskService {

	//문의사항 전체 불러오는 메소드
	public AskPageData selecetAllAsk(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		
		//1. 결정사항 : 한 페이지당 게시물 수
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		ArrayList<Ask> list = dao.selectAskList(conn,start,end);
		//페이징처리
		//전체 페이지곗나을 위한 전체 게시물 수 조회
		int totalCount = dao.totalAskCount(conn);
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
			pageNavi += "<a class='page-item' href='/askList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/askList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/askList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class='page-item' href='/askList.do?reqPage="+pageNo+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		AskPageData apd = new AskPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return apd;
	}
	
	//문의하기 자세히 보기 서블렛
	public AskViewData selectAskView(int askNo) {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		
		Ask a = dao.selectOneAsk(conn, askNo);
		
		ArrayList<AskComment> commentList = dao.selectAskComment(conn,askNo);
		ArrayList<AskComment> reCommentList = dao.selectAskReComment(conn,askNo);
		
		JDBCTemplate.close(conn);
		AskViewData avd = new AskViewData(a, commentList, reCommentList);
		return avd;
	}

	public Notice selectOneAsk(int askNo) {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		int result = dao.updateReadCount(conn, askNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			JDBCTemplate.close(conn);
			return null;
		}
		Ask a = dao.selectOneAsk(conn, askNo);
		JDBCTemplate.close(conn);
		return null;
	}
	
	public int insertAsk(Ask a) {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		int result = dao.insertAsk(conn,a);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Ask getAsk(int askNo) {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		Ask a = dao.selectOneAsk(conn, askNo);
		JDBCTemplate.close(conn);
		return a;
	}


	public int insertAskComment(AskComment ac) {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		int result = dao.insertAskComment(conn,ac);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
		
		
	public int UpdateAsk(Ask a) {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		int result = dao.UpdateAsk(conn, a);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<AskComment> getAskComment() {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		ArrayList<AskComment> askCo = dao.getAskComment(conn);
		return askCo;
	}

	public int delComment(int askNo, int askCommentNo) {
		Connection conn = JDBCTemplate.getConnection();
		AskDao dao = new AskDao();
		int result = dao.delComment(conn,askNo,askCommentNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	
	
	

}
