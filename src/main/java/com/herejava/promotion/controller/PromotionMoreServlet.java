package com.herejava.promotion.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.promotion.service.PromotionService;
import com.herejava.promotion.vo.Promotion;

/**
 * Servlet implementation class PromotionMoreServlet
 */
@WebServlet(name = "PromotionMore", urlPatterns = { "/promotionMore.do" })
public class PromotionMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromotionMoreServlet() {
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
		//int start = Integer.parseInt(request.getParameter("start"));
		//int amount = Integer.parseInt(request.getParameter("amount"));
		int start = 1;
		int amount = 2;
		//3.비즈니스로직
		PromotionService service = new PromotionService();
		ArrayList<Promotion> list = service.promotionMore(start,amount);
		for(Promotion p : list) {
			System.out.println(p.getPromotionContent());
		}
		//4.결과처리
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
