package com.herejava.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.book.service.BookService;
import com.herejava.book.vo.BookPageData;
import com.herejava.member.service.MemberService;
import com.herejava.member.vo.Member;

/**
 * Servlet implementation class AdminBookListServlet
 */
@WebServlet(name = "AdminBookList", urlPatterns = { "/adminBookList.do" })
public class AdminBookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//관리자가 회원 예약 리스트 블러오는 servlet
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		String memberNick = request.getParameter("memberNick");
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		//3. 비즈니스로직
		BookService service = new BookService();
		//데이터 가져오기 전에 예약상태 현재 날짜 기준으로 최신화 시켜주기
		BookPageData bpd = service.selectBookListAdmin(memberNo,memberNick,reqPage);
		MemberService serviceM = new MemberService();
		Member mem = serviceM.selectOneMember3(memberNick);
		//4. 화면출력
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/oneMemberBookList.jsp");
		request.setAttribute("list", bpd.getBookList());
		request.setAttribute("pageNavi", bpd.getPageNavi());
		request.setAttribute("mem", mem);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
