package com.herejava.notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.notice.service.NoticeService;
import com.herejava.notice.vo.NoticePageData;



/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet(name = "NoticeList", urlPatterns = { "/noticeList.do" })
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
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
				int reqPage = Integer.parseInt(request.getParameter("reqPage"));
				//3. 비즈니스로직
				NoticeService service = new NoticeService();
				NoticePageData npd = service.selecetNoticeList(reqPage);
				//4. 결과처리\
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/noticeList.jsp");
				request.setAttribute("list", npd.getList());
				request.setAttribute("pageNavi", npd.getPageNavi());
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
