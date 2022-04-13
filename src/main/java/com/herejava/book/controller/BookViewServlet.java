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
		request.setCharacterEncoding("utf-8");
		long bookNo = Long.parseLong(request.getParameter("bookNo"));
		boolean masterCheck = Boolean.parseBoolean(request.getParameter("masterCheck"));
		BookService service = new BookService();
		BookData bd = service.getBook(bookNo);
		if(masterCheck) {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admin/adminBookView.jsp");
			request.setAttribute("bd", bd);
			view.forward(request, response);
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/book/bookView.jsp");
			request.setAttribute("bd", bd);
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
