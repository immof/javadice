package com.herejava.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.book.service.BookService;
import com.herejava.book.vo.Book;
import com.herejava.book.vo.BookData;
import com.herejava.pay.service.PayService;
import com.herejava.pay.vo.Pay;

/**
 * Servlet implementation class BookViewServlet
 */
@WebServlet(name = "BookView", urlPatterns = { "/bookView.do" })
public class BookViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookViewServlet() {
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
		boolean masterCheck = Boolean.parseBoolean(request.getParameter("masterCheck"));
		//3. 비즈니스로직
		BookService service = new BookService();
		PayService payService = new PayService();
		BookData bd = service.getBook(bookNo);
		Pay pay = payService.selectOnePay(bookNo);
		//4. 화면처리
		if(masterCheck) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/adminBookView.jsp");
			request.setAttribute("bd", bd);
			request.setAttribute("pay", pay);
			view.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/book/bookView.jsp");
			request.setAttribute("bd", bd);
			request.setAttribute("pay", pay);
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
