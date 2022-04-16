package com.herejava.point.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.member.service.MemberService;
import com.herejava.point.dao.PointDao;
import com.herejava.point.service.PointService;
import com.herejava.point.vo.Point;

/**
 * Servlet implementation class Mypage_pointServlet
 */
@WebServlet(name = "Mypage_point", urlPatterns = { "/mypage_point.do" })
public class Mypage_pointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mypage_pointServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		PointService service = new PointService();
		ArrayList<Point> list = service.pointList(memberNo);
		MemberService service2 = new MemberService();
		int totalPoint = service2.getPoint(memberNo);
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/mypage_point.jsp");
		request.setAttribute("list", list);
		request.setAttribute("totalPoint", totalPoint);
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
