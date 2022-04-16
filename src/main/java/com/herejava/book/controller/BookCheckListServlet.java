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
import com.herejava.book.vo.BookData;
import com.herejava.pay.service.PayService;
import com.herejava.pay.vo.Pay;

/**
 * Servlet implementation class BookCheckListServlet
 */
@WebServlet(name = "BookCheckList", urlPatterns = { "/bookCheckList.do" })
public class BookCheckListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookCheckListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		long bookNo = Long.parseLong(request.getParameter("bookNo"));
		BookService service = new BookService();
		Book b = service.selectOneBook(bookNo);
		int d = service.diffDays(b.getCheckIn(), b.getCheckOut());
		PayService payService = new PayService();
		Pay pay = payService.selectOnePay(bookNo);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/bookcheckList.jsp");
		request.setAttribute("b", b);
		request.setAttribute("d", d);
		request.setAttribute("pay", pay);
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
