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
import com.herejava.promotion.vo.Promotion;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class PromotionInsertServlet
 */
@WebServlet(name = "PromotionInsert", urlPatterns = { "/promotionInsert.do" })
public class PromotionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PromotionInsertServlet() {
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
		//2-1. 파일업로드
		//1) 파일업로드 경로 지정
		String root = getServletContext().getRealPath("/");//webapp 폴더 절대경로를 구함
		String saveDirectory = root+"img";
		//2) 파일업로드 최대용량 지정
		int maxSize = 10*1024*1024;
		//3) multipart/form-data에서 데이터를 꺼내기 위한 변환
		//request -> MultipartRequest 객체로 변환 (cos.jar 라이브러리 사용)
		//1-request, 2-파일저장경로, 3-파일최대크기, 4-인코딩타입, 5-파일명중복처리객체
		MultipartRequest mRequest = new MultipartRequest(request, 
														saveDirectory, 
														maxSize, 
														"UTF-8", 
														new DefaultFileRenamePolicy()
														);
		//request -> MultipartRequest로 변환되면서 파일이 업로드
		//2-3. 값을 추출
		String promotionTitle = mRequest.getParameter("title");
		String promotionSubTitle = mRequest.getParameter("sub");
		String startDate = mRequest.getParameter("start_date");
		String endDate = mRequest.getParameter("end_date");
		String promotionContent = mRequest.getParameter("Content");
		String filepath = mRequest.getOriginalFileName("file");
		/*
		System.out.println(promotionTitle);
		System.out.println(promotionSubTitle);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(promotionContent);
		System.out.println(filepath);
		*/
		Promotion p = new Promotion();
		p.setPromotionTitle(promotionTitle);
		p.setPromotionSubTitle(promotionSubTitle);
		p.setStartDate(startDate);
		p.setEndDate(endDate);
		p.setPromotionContent(promotionContent);
		p.setFilepath(filepath);
		//3.비즈니스로직
		PromotionService service = new PromotionService();
		int result = service.InsertPromotion(p);
		//4.결과처리
		if(result>0) {
			response.sendRedirect("/promotionList.do");
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('작성 중 오류가 발생하였습니다. 다시 시도 하여주세요')");
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
