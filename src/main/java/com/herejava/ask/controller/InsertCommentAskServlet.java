package com.herejava.ask.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.ask.service.AskService;
import com.herejava.ask.vo.AskComment;


/**
 * Servlet implementation class InsertCommentAskServlet
 */
@WebServlet(name = "InsertCommentAsk", urlPatterns = { "/insertCommentAsk.do" })
public class InsertCommentAskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertCommentAskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 인코딩
				request.setCharacterEncoding("utf-8");
				//2. 값추출
				AskComment ac = new AskComment();
				ac.setAskCommentWriter(request.getParameter("askCommentWriter"));
				ac.setAskRef(Integer.parseInt(request.getParameter("askRef")));
				ac.setAskCommentRef(Integer.parseInt(request.getParameter("askCommentRef")));
				ac.setAskCommentContent(request.getParameter("askCommentContent"));
				
				//3. 비즈니스로직
				AskService service = new AskService();
				int result = service.insertAskComment(ac);
				//4. 결과처리
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
				if(result>0) {
					request.setAttribute("title", "성공");
					request.setAttribute("msg", "댓글 등록 완료");
					request.setAttribute("icon", "success");
				}else {
					request.setAttribute("title", "실패");
					request.setAttribute("msg", "댓글 등록 실패");
					request.setAttribute("icon", "error");
				}
				request.setAttribute("loc", "/askView.do?askNo="+ac.getAskRef());
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
