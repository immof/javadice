package com.herejava.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.review.service.ReviewService;
import com.herejava.review.vo.ReviewPageData;

/**
 * Servlet implementation class ReviewList_admin2Servlet
 */
@WebServlet("/ReviewList_admin2Servlet")
public class ReviewList_admin2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewList_admin2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int reqPage= Integer.parseInt(request.getParameter("reqPage"));
		ReviewService service = new ReviewService();
		ReviewPageData rpd = service.selectAllReview(reqPage);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/admion/admin_review.jsp");
		request.setAttribute("list", rpd.getList());
		request.setAttribute("pageNavi", rpd.getPageNavi());
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
