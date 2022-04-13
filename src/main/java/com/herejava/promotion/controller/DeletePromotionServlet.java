package com.herejava.promotion.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.promotion.service.PromotionService;

/**
 * Servlet implementation class DeletePromotionServlet
 */
@WebServlet(name = "DeletePromotion", urlPatterns = { "/deletePromotion.do" })
public class DeletePromotionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePromotionServlet() {
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
		int promotionNo = Integer.parseInt(request.getParameter("promotionNo"));
		//3.비즈니스로직
		PromotionService service = new PromotionService();
		int result = service.deletePromotion(promotionNo);
		//4.결과처리
		if(result>0) {
			RequestDispatcher view = request.getRequestDispatcher("/promotionList.do");
			view.forward(request, response);
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('프로모션 삭제 중 오류가 발생하였습니다. 프로모션 리스트를 확인해주세요.')");
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
