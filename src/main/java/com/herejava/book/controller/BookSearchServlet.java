package com.herejava.book.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.book.service.BookService;
import com.herejava.book.vo.Book;
import com.herejava.room.vo.Room;

/**
 * Servlet implementation class BookSearchServlet
 */
@WebServlet(name = "BookSearch", urlPatterns = { "/bookSearch.do" })
public class BookSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//숙소 예약 버튼에서 체크인 체크아웃 에약하려는 인원을 받아와가지고 예약 가능한 객실 검색 결과를 보여주는 서블릿입니다.
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int bookPeople = Integer.parseInt(request.getParameter("bookPeople"));
		System.out.println(checkIn);
		System.out.println(checkOut);
		System.out.println(bookPeople);
		//int bookPeople = Integer.parseInt(request.getParameter("bookPeople"));
		Book book = new Book();
		book.setCheckIn(checkIn);
		book.setCheckOut(checkOut);
		book.setBookPeople(bookPeople);
		//3.비즈니스로직
		BookService service = new BookService();
		ArrayList<Room> list = service.selectSearchRoom(book);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/room/roomSearch.jsp");
		request.setAttribute("list", list);
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
