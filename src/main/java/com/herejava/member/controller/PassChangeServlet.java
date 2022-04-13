package com.herejava.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.member.service.MemberService;

/**
 * Servlet implementation class PassChangeServlet
 */
@WebServlet(name = "PassChange", urlPatterns = { "/passChange.do" })
public class PassChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PassChangeServlet() {
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
		//3.비즈니스로직
		MemberService service = new MemberService();
		int result = service.passChange(memberId,memberPw);
		//4.결과처리
		if(result>0) {
			RequestDispatcher view  = request.getRequestDispatcher("/loginFrm.do");
			view.forward(request, response);
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호 변경 중 오류가 발생하였습니다. 다시 시도해도 안되면 관리자에게 문의해주세요.')");
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
