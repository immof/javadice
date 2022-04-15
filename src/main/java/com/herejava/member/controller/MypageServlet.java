package com.herejava.member.controller;

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
import com.herejava.book.vo.BookData;
import com.herejava.member.service.MemberService;
import com.herejava.member.vo.Member;
import com.herejava.review.service.ReviewService;
import com.herejava.review.vo.Review;
import com.herejava.review.vo.ReviewList;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet(name = "Mypage", urlPatterns = { "/mypage_main.do" })
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		String memberId = request.getParameter("memberId");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int memberLevel = Integer.parseInt(request.getParameter("memberLevel"));
		//3.비즈니스로직
		//member 객체 
		MemberService service = new MemberService();
		BookService bookService = new BookService();
		ReviewService reviewService = new ReviewService();
		Member m = service.selectOneMember(memberId);
		ArrayList<BookData> list = bookService.selectAllBook(memberNo);
		ArrayList<ReviewList> reviewList = reviewService.myReview(memberNo);
		//4.결과처리
		if(memberLevel==1) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_main_page.jsp");
			request.setAttribute("m", m);
			request.setAttribute("list", list);
			request.setAttribute("reviewList", reviewList);
			view.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/admin_main.jsp");
			view.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
