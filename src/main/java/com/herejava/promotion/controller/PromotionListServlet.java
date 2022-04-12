package com.herejava.promotion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.promotion.service.PromotionService;
import com.herejava.promotion.vo.Promotion;

/**
 * Servlet implementation class PromotionListServlet
 */
@WebServlet(name = "PromotionList", urlPatterns = { "/promotionList.do" })
public class PromotionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromotionListServlet() {
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
		//3.비즈니스로직
		PromotionService service = new PromotionService();
		int totalCount = service.totalCount();
		//4.결과처린
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/promotion/promotionList.jsp");
		request.setAttribute("totalCount", totalCount);
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
