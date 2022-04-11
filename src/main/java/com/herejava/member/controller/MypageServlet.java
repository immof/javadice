package com.herejava.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.book.service.BookService;
import com.herejava.book.vo.Book;
import com.herejava.book.vo.BookData;
import com.herejava.member.service.MemberService;
import com.herejava.member.vo.Member;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet(name = "Mypage", urlPatterns = { "/mypage_main.do" })
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		String memberId = request.getParameter("memberId");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		//3.비즈니스로직
		//member 객체 
		MemberService service = new MemberService();
		Member m = service.selectOneMember(memberId);
		//ArrayList<BookData> 리스트
		BookService bookService = new BookService();
		ArrayList<BookData> list = bookService.selectAllBook(memberNo);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_main_page.jsp");
		request.setAttribute("member", m);
		request.setAttribute("list", list);
		/*
		if(list.size() == 2) {
			//예약 2개 출력
			for(int i=0;i<2;i++) {
				Book b = list.get(i);//리스트에서 예약객체 1개 가져옴
				b.getRoomNo();//방 넘버(=방 이름)
				b.getCheckIn();//체크인날짜
				b.getCheckOut();//체크아웃날짜
				b.getBookState();//예약상태
			}
		}else if(list.size() == 1) {
			//예약 1개 출력
			Book b = list.get(0);//리스트에서 예약객체 1개 가져옴
			b.getRoomNo();//방 넘버(=방 이름)
			b.getCheckIn();//체크인날짜
			b.getCheckOut();//체크아웃날짜
			b.getBookState();//예약상태
		}else {
			//최근 예약내역이 없습니다.
		}
		*/
		/*
		1. list에서 객체 모두 꺼내옴 
		2. 그중 한 객체만 선택해서(예약번호로) 여기에서 예약객체 하나 완성
		*/
		
		//만약 예약내역이 있으면
		
		if(list.size() != 0) {
			for(int i=0;i<list.size();i++) {
				BookData b = list.get(i);//리스트에서 예약객체 1개 가져옴
				b.getRoomName();//방 넘버(=방 이름)
				b.getCheckIn();//체크인날짜
				b.getCheckOut();//체크아웃날짜
				b.getBookState();//예약상태
				list.add(b);
			}
		}
		
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
