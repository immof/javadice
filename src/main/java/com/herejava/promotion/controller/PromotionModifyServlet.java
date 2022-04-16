package com.herejava.promotion.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

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
		int promotionNo = Integer.parseInt(mRequest.getParameter("no"));
		String promotionTitle = mRequest.getParameter("title");
		String promotionSubTitle = mRequest.getParameter("sub");
		String startDate = mRequest.getParameter("start_date");
		String endDate = mRequest.getParameter("end_date");
		String promotionContent = mRequest.getParameter("Content");
		//filename, filepath는 새첨부파일 있으면 파일명으로, 새첨부파일이 없으면 null
		String filepath = mRequest.getOriginalFileName("file");
		//수정 전 파일이 존재했으면 값 있음, 수정 전 파일이 없으면 null
		String oldFilepath = mRequest.getParameter("oldFilepath");
		//수정 전 유지했으면 stay, 수정 전 삭제했으면 delete
		String status = mRequest.getParameter("status");
		/*
		 * System.out.println(promotionNo);
		System.out.println(promotionTitle);
		System.out.println(promotionSubTitle);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(promotionContent);
		System.out.println(filepath);
		System.out.println(oldFilepath);
		System.out.println(status);
		*/
		if(status.equals("delete")) {  //올드 파일이 있고 삭제버튼을 눌렀을때 올드 파일 삭제하는 작업
			File delFile = new File(saveDirectory+"/"+oldFilepath);
			delFile.delete(); 
		}else if(oldFilepath != null){ 
			//비즈니스 로직에서 한번에 처리하기 위해 올드 파일이 있으면서 그걸 삭제하지 않은 경우 filename, filepath로 업데이트하는 작업
			filepath = oldFilepath;
		}
		Promotion p = new Promotion();
		p.setPromotionNo(promotionNo);
		p.setPromotionTitle(promotionTitle);
		p.setPromotionSubTitle(promotionSubTitle);
		p.setStartDate(startDate);
		p.setEndDate(endDate);
		p.setPromotionContent(promotionContent);
		p.setFilepath(filepath);
		//3.비즈니스로직
		PromotionService service = new PromotionService();
		int result = service.updatePromotion(p);
		//System.out.println("서블릿"+result);
		//4.결과처리
		if(result>0) {
			response.sendRedirect("/promotionList.do");
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 중 오류가 발생하였습니다. 다시 시도 하여주세요.')");
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
