package com.herejava.ask.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.ask.service.AskService;
import com.herejava.ask.vo.AskViewData;
import com.herejava.notice.vo.Notice;

/**
 * Servlet implementation class AskViewServlet
 */
@WebServlet(name = "AskView", urlPatterns = { "/askView.do" })
public class AskViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int askNo = Integer.parseInt(request.getParameter("askNo"));
		
		AskService service = new AskService();
		AskViewData avd = service.selectAskView(askNo);
		//Notice n = service.selectOneAsk(askNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/ask/askView.jsp");
		request.setAttribute("a", avd.getA());
		request.setAttribute("commentList", avd.getCommentList());
		request.setAttribute("reCommentList", avd.getReCommentList());
	
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
