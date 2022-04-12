package com.herejava.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.herejava.member.service.MemberService;
import com.herejava.member.vo.Member;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet(name = "UpdateMember", urlPatterns = { "/updateMember.do" })
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
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
		Member member = new Member();
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberNick(request.getParameter("memberNick"));
		member.setMemberPhone(request.getParameter("memberPhone"));
		//3.비즈니스로직
		MemberService service = new MemberService();
		int result = service.updateMember(member);
		Member m = service.selectOneMember2(member);
		//4.결과처리
		PrintWriter out = response.getWriter();
		if(result > 0 && m!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("m", m);
			out.print(1);
		}else {
			out.print(0);
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
