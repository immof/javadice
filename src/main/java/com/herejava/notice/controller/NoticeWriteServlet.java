package com.herejava.notice.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.notice.service.NoticeService;
import com.herejava.notice.vo.Notice;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeWriteServlet
 */
@WebServlet(name = "NoticeWrite", urlPatterns = { "/noticeWrite.do" })
public class NoticeWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeWriteServlet() {
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
		//2-1. 파일업로드
		//1) 파일 업로드 경로 지정
		String root = getServletContext().getRealPath("/"); //webapp폴더 절대 경로를 구함
		String saveDirectory = root+"upload/notice";
		System.out.println("파일 저장 경로 : "+saveDirectory);
		//2) 파일업로드 최대 용량 지정
		int maxSize = 10*1024*1024;
		// 3) multipart/form-data에서 데이터를 꺼내기 위한 변환
		//request -> MultipartRequest객체로 변환(cos.jar 라이브러리 사용)
		//MultipartRequest 생성자에 매개변수 5개 전달
		//1-request, 2-파일저장경로, 3-파일최대크기, 4-인코딩타입, 5-파일명중복처리객체
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		//request - > MultipartReqeust로 변환되면서 파일이 업로드
		//2-3. 값을 추출
		String memberNick = mRequest.getParameter("memberNick");
		String noticeTitle = mRequest.getParameter("noticeTitle");
		String noticeContent = mRequest.getParameter("noticeContent");
		String filepath = mRequest.getFilesystemName("file");
		
        Notice n = new Notice();
        n.setNoticeWriter(memberNick);
        n.setNoticeTitle(noticeTitle);
        n.setNoticeContent(noticeContent);
        n.setFilepath(filepath);
        
        NoticeService service = new NoticeService();
        int result = service.writeNotice(n);
    	RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "공지사항이 등록되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "공지사항 등록 중 문제가 발생했습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/noticeList.do?reqPage=1");
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
