package com.herejava.book.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

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
		
		
		System.out.println("BookName : "+bpay.getBookName());
		System.out.println("BookPeople : "+bpay.getBookPeople());
		System.out.println("BookPhone : "+bpay.getBookPhone());
		System.out.println("CheckIn : "+bpay.getCheckIn());
		System.out.println("CheckOut : "+bpay.getCheckOut());
		System.out.println("MemberNo : "+bpay.getMemberNo());
		System.out.println("MemberPoint : "+bpay.getMemberPoint());
		System.out.println("MinusPoint : "+bpay.getMinusPoint());
		System.out.println("PlusPoint : "+bpay.getPlusPoint());
		System.out.println("PayAmount : "+bpay.getPayAmount());
		System.out.println("PayRoomPrice : "+bpay.getPayRoomPrice());
		System.out.println("PayStayDay : "+bpay.getPayStayDay());
		System.out.println("RoomNo : "+bpay.getRoomNo());
		System.out.println("RoomName : "+bpay.getRoomName());
		
		//3.비즈니스로직
		
		//3-1. 예약테이블 추가
		BookService serviceBook = new BookService();
		int resultBook = serviceBook.insertBook(bpay);
		//생성된 예약번호,예약날짜 가져오기
		BookPayData bpd = serviceBook.searchBookNo(bpay);
		System.out.println("bookNo : " +bpd.getBookNo());
		System.out.println("bookDay : " +bpd.getBookDay());
		
		//3-2. 결제테이블 추가
		int resultPay = serviceBook.insertPay(bpay,bpd);
		//생성된 결제번호 가져오기
		long payNo = serviceBook.searchPayNo(bpd);
		System.out.println("payNo : "+payNo);
		
		//3-4. 적립금테이블 추가
		PointService servicePoint = new PointService();
		int resultPoint = servicePoint.insertPoint(bpay,bpd,payNo);
		
		
		//3-3. 멤버테이블에 회원포인트 변경 (회원시)
		int resultMember = 0;
		if(bpay.getMemberNo()!=0) {
			MemberService serviceMember = new MemberService();
			resultMember = serviceMember.updateMemberPoint(bpay);
		}else {
			resultMember = 1;
		}
		
		System.out.println("resultBook : " +resultBook);
		System.out.println("resultPay : " +resultPay);
		System.out.println("resultPoint : " +resultPoint);
		System.out.println("resultMember : " +resultMember);
		//조회결과 m을 js객체타입으로 변환
		JSONObject result = null;	//HashMap<String,Object>와 같음
		result = new JSONObject();
		result.put("resultBook", resultBook);
		result.put("resultPay", resultPay);
		result.put("resultMember", resultMember);
		result.put("resultPoint", resultPoint);
		
		//4.결과처리
		response.setContentType("application/json"); //되돌려주는 데이터의 타입이 json임을 명시(안하면 string으로 취급됨)
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
