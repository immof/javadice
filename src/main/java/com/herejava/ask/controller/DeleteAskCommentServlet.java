package com.herejava.ask.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.ask.service.AskService;

/**
 * Servlet implementation class DeleteAskCommentServlet
 */
@WebServlet(name = "DeleteAskComment", urlPatterns = { "/deleteAskComment.do" })
public class DeleteAskCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAskCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int askNo = Integer.parseInt(request.getParameter("askNo"));
		int	askCommentNo= Integer.parseInt(request.getParameter("askCommentNo"));
		AskService service = new AskService();
		int result = service.delComment(askNo, askCommentNo);
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.print(1);
		}else {
			out.print(0);
		}
	
	}//

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
