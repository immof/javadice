package com.herejava.promotion.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.herejava.promotion.service.PromotionService;
import com.herejava.promotion.vo.Promotion;

/**
 * Servlet implementation class PromotionModifyServlet
 */
@WebServlet(name = "PromotionModifyFrm", urlPatterns = { "/promotionModifyFrm.do" })
public class PromotionModifyFrmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PromotionModifyFrmServlet() {
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
		//System.out.println(promotionNo);
		//3.비즈니스로직
		PromotionService service = new PromotionService();
		Promotion p  =service.selectOnePromotion(promotionNo);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/promotion/promotionModifyFrm.jsp");
		request.setAttribute("p", p);
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
