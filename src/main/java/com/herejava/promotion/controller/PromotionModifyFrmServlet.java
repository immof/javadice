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
		request.setCharacterEncoding("utf-8");


		
	
		int Value = Integer.parseInt(request.getParameter("promotionNo"));
		System.out.println(Value);
		PromotionService p = new PromotionService();
		Promotion pro  =p.selectModify(Value);
		System.out.println(pro.getStartDate());
		request.setAttribute("pro", pro);
		RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/promotion/promotionModifyFrm.jsp");
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
