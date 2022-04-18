package com.herejava.member.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.StringTokenizer;

import com.herejava.book.dao.BookDao;
import com.herejava.book.vo.Book;
import com.herejava.book.vo.BookCheckPage;
import com.herejava.book.vo.BookPay;
import com.herejava.member.dao.MemberDao;
import com.herejava.member.vo.Member;
import com.herejava.member.vo.MemberPageData;
import common.JDBCTemplate;

public class MemberService {

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.selecOneMember(conn, memberId);
		JDBCTemplate.close(conn);
		return m;
	}

	public Member selectOneMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.selectOneMember(conn,member);
		JDBCTemplate.close(conn);
		return m;
	}
	public Member selectOneMember2(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.selectOneMember2(conn,member);
		JDBCTemplate.close(conn);
		return m;
	}//회원페이지 정보수정 용
	
	public Member selectOneMember3(String memberNick) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		Member m = dao.selectOneMember3(conn,memberNick);
		JDBCTemplate.close(conn);
		return m;
	}//회원페이지 닉네임 중복체크용

	public MemberPageData selectAllMember(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int numPerPage = 10;
		int end = reqPage*numPerPage;
		int start = end-numPerPage+1;
		ArrayList<Member> list = dao.selectAllMember(conn,start,end);
		
		//페이징처리
		
		int totalMemberCount = dao.totalMemberCount(conn);	//전체회원수
		int totalPage = 0;	// 전체 페이지수
		if(totalMemberCount % numPerPage == 0) {
			totalPage = totalMemberCount / numPerPage;
		}else {
			totalPage = (totalMemberCount / numPerPage) +1;
		}
		int pageNaviSize = 5;	//페이지 네비게이션 길이
		
		//페이지 네비게이션 시작번호 계산
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		//페이지 네비게이션 제작 시작
		String pageNavi = "<ul class='pagination circle-style'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		//페이지숫자
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/memberList.do?reqPage="+pageNo+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+pageNo+"'>";
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
			pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+pageNo+"'>";		//위에 pageNo++로 이미 숫자가 커졌기때문에 pageNo+1이 아니다
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		MemberPageData mpd = new MemberPageData(list,pageNavi);
		
		JDBCTemplate.close(conn);
		return mpd;
	}
	public int memberNickChk(String memberNick) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.memberNickChk(conn, memberNick);
		JDBCTemplate.close(conn);
		return result;
	}

  public int updateMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.updateMember(conn, member);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
  
	public int updatePw(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.updatePw(conn, member);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.deleteMember(conn, memberId);
    if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

  public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.insertMember(conn,m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

public MemberPageData searchMember(String searchMember, int reqPage) {
	Connection conn = JDBCTemplate.getConnection();
	MemberDao dao = new MemberDao();
	int numPerPage = 10;
	int end = reqPage*numPerPage;
	int start = end-numPerPage+1;
	ArrayList<Member> list = dao.searchMember(conn,start,end,searchMember);
	
	//페이징처리
	
	int totalMemberCount = dao.totalMemberCount(conn);	//전체회원수
	int totalPage = 0;	// 전체 페이지수
	if(totalMemberCount % numPerPage == 0) {
		totalPage = totalMemberCount / numPerPage;
	}else {
		totalPage = (totalMemberCount / numPerPage) +1;
	}
	int pageNaviSize = 5;	//페이지 네비게이션 길이
	
	//페이지 네비게이션 시작번호 계산
	int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
	//페이지 네비게이션 제작 시작
	String pageNavi = "<ul class='pagination circle-style'>";
	//이전버튼
	if(pageNo != 1) {
		pageNavi += "<li>";
		pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+(pageNo-1)+"'>";
		pageNavi += "<span class='material-icons'>chevron_left</span>";
		pageNavi += "</a></li>";
	}
	//페이지숫자
	for(int i=0;i<pageNaviSize;i++) {
		if(pageNo == reqPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item active-page' href='/memberList.do?reqPage="+pageNo+"'>";
			pageNavi += pageNo;
			pageNavi += "</a></li>";
		}else {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+pageNo+"'>";
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
		pageNavi += "<a class='page-item' href='/memberList.do?reqPage="+pageNo+"'>";		//위에 pageNo++로 이미 숫자가 커졌기때문에 pageNo+1이 아니다
		pageNavi += "<span class='material-icons'>chevron_right</span>";
		pageNavi += "</a></li>";
	}
	pageNavi += "</ul>";
	MemberPageData mpd = new MemberPageData(list,pageNavi);
	
	JDBCTemplate.close(conn);
	return mpd;
}

public boolean delMember(String memberNoArr) {
	Connection conn = JDBCTemplate.getConnection();
	MemberDao dao = new MemberDao();
	
	//데이터편집
	StringTokenizer sT = new StringTokenizer(memberNoArr,"/");
	boolean result = true;
	while(sT.hasMoreTokens()) {
		int memberNo = Integer.parseInt(sT.nextToken());
		int chkResult = dao.delMember(conn,memberNo);
		if(chkResult == 0) {
			result = false;
			break;
		}
	}
	if(result) {
		JDBCTemplate.commit(conn);
	}else {
		JDBCTemplate.rollback(conn);
	}
	JDBCTemplate.close(conn);
	return result;
}

//비밀번호 찾기
public int passChange(String memberId, String memberPw) {
	Connection conn = JDBCTemplate.getConnection();
	MemberDao dao = new MemberDao();
	int result = dao.passChange(conn, memberId, memberPw);
	if(result>0) {
		JDBCTemplate.commit(conn);
	}else {
		JDBCTemplate.rollback(conn);
	}
	JDBCTemplate.close(conn);
	return result;
}

public int updateMemberPoint(BookPay bpay) {
	Connection conn = JDBCTemplate.getConnection();
	MemberDao dao = new MemberDao();
	int newPoint = bpay.getMemberPoint()-bpay.getMinusPoint()+bpay.getPlusPoint();
	System.out.println("newPoint: "+newPoint);
	int result = dao.updateMemberPoint(conn, bpay , newPoint);
	if(result>0) {
		JDBCTemplate.commit(conn);
	}else {
		JDBCTemplate.rollback(conn);
	}
	JDBCTemplate.close(conn);
	return result;
}
  
public int getPoint(int memberNo) {
	Connection conn = JDBCTemplate.getConnection();
	MemberDao dao = new MemberDao();
	int totalPoint = dao.getPoint(conn, memberNo);
	return totalPoint;
}

public Member getMemberInfo(int memberNo) {
	Connection conn = JDBCTemplate.getConnection();
	MemberDao dao = new MemberDao();
	Member m = dao.getMemberInfo(conn,memberNo);
	JDBCTemplate.close(conn);
	return m;
}

  
}//MemberService class
