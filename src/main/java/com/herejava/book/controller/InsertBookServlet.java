package com.herejava.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.book.service.BookService;
import com.herejava.book.vo.BookPay;
import com.herejava.book.vo.BookPayData;

/**
 * Servlet implementation class InsertBookServlet
 */
@WebServlet(name = "InsertBook", urlPatterns = { "/insertBook.do" })
public class InsertBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//2.값추출
		BookPay bpay = new BookPay();
		bpay.setBookName(request.getParameter("bookName"));
		bpay.setBookPeople(Integer.parseInt(request.getParameter("bookPeople")));
		bpay.setBookPhone(request.getParameter("bookPhone"));
		bpay.setCheckIn(request.getParameter("checkIn"));
		bpay.setCheckOut(request.getParameter("checkOut"));
		bpay.setMemberNo(Integer.parseInt(request.getParameter("memberNo")));
		bpay.setMemberPoint(Integer.parseInt(request.getParameter("memberPoint")));
		bpay.setMinusPoint(Integer.parseInt(request.getParameter("usePoint")));
		bpay.setPlusPoint(Integer.parseInt(request.getParameter("plusPoint")));
		bpay.setPayAmount(Integer.parseInt(request.getParameter("price")));
		bpay.setPayRoomPrice(Integer.parseInt(request.getParameter("payRoomPrice")));
		bpay.setPayStayDay(Integer.parseInt(request.getParameter("payStayDay")));
		bpay.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		bpay.setRoomName(request.getParameter("roomName"));
		
		//3.비즈니스로직
		//3-1. 예약테이블 추가
		BookService serviceB = new BookService();
		int resultB = serviceB.insertBook(bpay);
		//생성된 예약번호,예약날짜 가져오기
		BookPayData bpd = serviceB.searchBookNo(bpay);
		//3-2. 결제테이블 추가
		int resultP = serviceB.insertPay(bpay,bpd);
		
		//3-3. 적립금테이블 추가
		//3-4. 멤버테이블에 회원포인트 변경
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
