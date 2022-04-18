package com.herejava.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.member.service.MemberService;
import com.herejava.member.vo.Member;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet(name = "Join", urlPatterns = { "/join.do" })
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
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
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String memberNick = request.getParameter("memberNick");
		String memberPhone = request.getParameter("memberPhone");
		String filepath = null;
		//3.비즈니스로직
		Random r = new Random();
		int fileRandom = r.nextInt(5)+1;
		switch(fileRandom) {
		case 1:
			filepath = "banana.png";
			break;
		case 2:
			filepath = "octopus.png";
			break;
		case 3:
			filepath = "pearl.png";
			break;
		case 4:
			filepath = "sun.png";
			break;
		case 5:
			filepath = "volcano.png";
			break;
		}
		System.out.println(fileRandom);
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPw(memberPw);
		m.setMemberName(memberName);
		m.setMemberNick(memberNick);
		m.setMemberPhone(memberPhone);
		m.setFilepath(filepath);
		MemberService service = new MemberService();
		int result = service.insertMember(m);
		//4.결과처리
		if(result>0) {
			RequestDispatcher view  = request.getRequestDispatcher("/login.do");
			request.setAttribute("memberId", memberId);
			request.setAttribute("memberPw", memberPw);
			view.forward(request, response);
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원가입 중 오류가 발생하였습니다. 다시 가입하여주세요.')");
			out.println("history.back()");
			out.println("</script>");
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
