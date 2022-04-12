package com.herejava.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.book.service.BookService;
import com.herejava.book.vo.Book;

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
		//3. 비즈니스로직
		BookService service = new BookService();
		int result = service.updateBook(bookNo);
		System.out.println(result);
		//4. 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		view.forward(request, response);
		
		if(result>0) {
			request.setAttribute("title", "성공");
			request.setAttribute("icon", "succcess");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/mypage_main.do");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
