package com.herejava.book.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.herejava.book.service.BookService;
import com.herejava.book.vo.BookPay;
import com.herejava.book.vo.BookPayData;
import com.herejava.member.service.MemberService;
import com.herejava.point.service.PointService;

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
		bpay.setPayAmount(Integer.parseInt(request.getParameter("payAmount")));
		bpay.setPayRoomPrice(Integer.parseInt(request.getParameter("payRoomPrice")));
		bpay.setPayStayDay(Integer.parseInt(request.getParameter("payStayDay")));
		bpay.setRoomNo(Integer.parseInt(request.getParameter("roomNo")));
		bpay.setRoomName(request.getParameter("roomName"));
		int memberNo = bpay.getMemberNo();
		//3.비즈니스로직
		
		//3-1. 예약테이블 추가
		BookService serviceBook = new BookService();
		int resultBook = serviceBook.insertBook(bpay);
		//생성된 예약번호,예약날짜 가져오기
		BookPayData bpd = serviceBook.searchBookNo(bpay);
		
		//3-2. 결제테이블 추가
		int resultPay = serviceBook.insertPay(bpay,bpd);
		//생성된 결제번호 가져오기
		long payNo = serviceBook.searchPayNo(bpd);
		
		//3-4. 적립금테이블 추가 (회원시)
		PointService servicePoint = new PointService();
		int resultPoint = 0;
		if(memberNo==0) {
			resultPoint = 1;
		}else {
			resultPoint = servicePoint.insertPoint(bpay,bpd,payNo);
		}
		
		//3-3. 멤버테이블에 회원포인트 변경 (회원시)
		int resultMember = 0;
		if(memberNo==0) {
			resultMember = 1;
		}else{
			MemberService serviceMember = new MemberService();
			resultMember = serviceMember.updateMemberPoint(bpay);
		}
		
		//조회결과 m을 js객체타입으로 변환
		
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/book/payComplete.jsp");
		request.setAttribute("bpay", bpay);
		request.setAttribute("bpd", bpd);
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
