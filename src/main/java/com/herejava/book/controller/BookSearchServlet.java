package com.herejava.book.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
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
		//처음 숙소 예약 들어갈때 얼럿 안 뜨도록 하는 변수
		int StartChk = 0;
		if(checkIn.equals("2020-01-01")) {
			StartChk = 1;
		}
		//3.비즈니스로직
		//오늘 이전 날짜로 검색하였을 시 예외 처리하기 위한 변수
		String checkDay = LocalDate.now().toString();
		BookService service = new BookService();
		//오늘 이전 날짜면 체크아웃을 오늘의 다음 날로 만들기 경고 띄워서 예외처리
		int checkDays = service.diffDays(checkDay, checkIn);
		String alert = null;
		if(checkDays<0) {
			checkIn = checkDay;
			checkOut = LocalDate.now().plusDays(1).toString();
			alert = "오늘 이전 날짜는 예약하실 수 없습니다."; 
		}
		//검색이 아니라 숙소 예약 클릭했는지 확인해서 얼럿 안띄우도록 함
		if(StartChk == 1) {
			alert = null;
		}
		Book book = new Book();
		book.setCheckIn(checkIn);
		book.setCheckOut(checkOut);
		book.setBookPeople(bookPeople);
		ArrayList<Room> list = service.selectSearchRoom(book);
		int diffDays = service.diffDays(checkIn, checkOut);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/room/roomSearch.jsp");
		request.setAttribute("list", list);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("bookPeople", bookPeople);
		request.setAttribute("diffDays", diffDays);
		request.setAttribute("alert", alert);
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
