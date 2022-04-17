package com.herejava.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.book.service.BookService;
import com.herejava.book.vo.Book;
import com.herejava.member.service.MemberService;
import com.herejava.member.vo.Member;
import com.herejava.pay.service.PayService;
import com.herejava.pay.vo.Pay;
import com.herejava.point.service.PointService;
import com.herejava.point.vo.Point;

/**
 * Servlet implementation class BookCancleServlet
 */
@WebServlet(name = "BookCancle", urlPatterns = { "/bookCancle.do" })
public class BookCancleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCancleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
		request.setCharacterEncoding("utf-8");
		//2. 값추출
		long bookNo = Long.parseLong(request.getParameter("bookNo"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		PointService pointService2 = new PointService();
		Point p = pointService2.getPayPoint(bookNo);
		int usepoint = p.getUsePoint();
		int pluspoint = p.getPlusPoint();
		//list에서 use-point랑 plus-point 받아서 다 더해서 최신 member-point 만듬
		MemberService service = new MemberService();
		int currentPoint = service.getPoint(memberNo);
		int newPoint = currentPoint + usepoint - pluspoint;
		//3. 비즈니스로직
		BookService bookService = new BookService();
		PointService pointService = new PointService();
		//list에서 use-point랑 plus-point 받아서 다 더해서 최신 member-point 만듬
		ArrayList<Point> list = pointService.pointList(memberNo);
		int memberPoint = 0;
		for(Point point : list) {
			memberPoint += point.getPlusPoint();
			memberPoint += point.getUsePoint();
		};
		int totalResult = bookService.updateBook(bookNo, memberNo, memberPoint);
		BookService bookService2 = new BookService();
		int result = bookService2.updateMemberPoint(memberNo, newPoint);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(totalResult>0) {
			request.setAttribute("title", "예약취소 성공");
			request.setAttribute("msg", "메인페이지로 돌아갑니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "예약취소 실패");
			request.setAttribute("msg", "관리자에게 문의하세요.");
			request.setAttribute("icon", "warning");
		}
		
		request.setAttribute("loc", "/index.jsp");
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
