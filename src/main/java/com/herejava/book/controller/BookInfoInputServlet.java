package com.herejava.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.herejava.member.service.MemberService;
import com.herejava.member.vo.Member;

/**
 * Servlet implementation class BookInsertServlet
 */
@WebServlet(name = "BookInfoInput", urlPatterns = { "/bookInfoInput.do" })
public class BookInfoInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookInfoInputServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//예약정보입력 서블릿
		request.setCharacterEncoding("utf-8");
		//2.값추출
		int roomNo = Integer.parseInt(request.getParameter("roomNo"));
		int roomPrice = Integer.parseInt(request.getParameter("roomPrice"));
		int roomCapacity = Integer.parseInt(request.getParameter("roomCapacity"));
		int bookPeople = Integer.parseInt(request.getParameter("bookPeople"));
		String checkIn = request.getParameter("checkIn");
		String checkOut = request.getParameter("checkOut");
		int payStayDay = Integer.parseInt(request.getParameter("payStayDay"));
		String roomName = request.getParameter("roomName");
		
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/book/bookInfoInput.jsp");
		request.setAttribute("roomNo", roomNo);
		request.setAttribute("roomPrice", roomPrice);
		request.setAttribute("roomCapacity", roomCapacity);
		request.setAttribute("bookPeople", bookPeople);
		request.setAttribute("checkIn", checkIn);
		request.setAttribute("checkOut", checkOut);
		request.setAttribute("payStayDay", payStayDay);
		request.setAttribute("roomName", roomName);
		
		view.forward(request, response);
	}

	/**;
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
