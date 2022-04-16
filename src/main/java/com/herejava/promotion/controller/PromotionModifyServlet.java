package com.herejava.promotion.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.promotion.service.PromotionService;
import com.herejava.promotion.vo.Promotion;

/**
 * Servlet implementation class PromotionModifyServlet
 */
@WebServlet(name = "PromotionModify", urlPatterns = { "/promotionModify.do" })
public class PromotionModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PromotionModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("sub"));
		System.out.println(request.getParameter("start_date"));
		System.out.println(request.getParameter("end_date"));
		System.out.println(request.getParameter("Content"));
		System.out.println(request.getParameter("file"));
		Promotion promotion = new Promotion();
		
		promotion.setPromotionNo(Integer.parseInt(request.getParameter("no")));
		promotion.setPromotionTitle(request.getParameter("title"));
		promotion.setPromotionSubTitle(request.getParameter("sub"));
		promotion.setStartDate(request.getParameter("start_date"));
		promotion.setEndDate(request.getParameter("end_date"));
		promotion.setPromotionContent(request.getParameter("Content"));
		promotion.setFilepath(request.getParameter("file"));
		
		PromotionService p = new PromotionService();
		
		int result = p.UpdatePromotion(promotion);
		
		System.out.println(result);
		
		if(result>0) {
			
			response.sendRedirect("/promotionList.do");
		
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('작성실패. 다시 시도')");
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
