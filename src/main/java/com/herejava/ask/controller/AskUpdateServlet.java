package com.herejava.ask.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.ask.service.AskService;
import com.herejava.ask.vo.Ask;
import com.herejava.review.vo.Review;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class AskUpdateServlet
 */
@WebServlet(name = "AskUpdate", urlPatterns = { "/askUpdate.do" })
public class AskUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskUpdateServlet() {
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
		String saveDirectory = root+"upload/ask";
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
		int askNo = Integer.parseInt(mRequest.getParameter("askNo"));
		String askTitle = mRequest.getParameter("askTitle");
		String askContent = mRequest.getParameter("askContent");
		
		String oldFilepath1 = mRequest.getParameter("oldFilepath1");
		String oldFilepath2 = mRequest.getParameter("oldFilepath2");
		String oldFilepath3 = mRequest.getParameter("oldFilepath3");
		
		Enumeration files = mRequest.getFileNames(); //파일명정보를 배열로 만들다(files에 name들이 담겨있다)
		String arr[] = new String[3];
		int i = 0;
		while(files.hasMoreElements()){
		    String name = (String)files.nextElement(); //각각의 파일 name을 String name에 담는다.
		    String filename = mRequest.getFilesystemName(name); //각각의 파일 name을 통해서 파일의 정보를 얻는다.
		    arr[i] = filename;
		    i++;
		}
		String filepath1 = arr[0];
		String filepath2 = arr[1];
		String filepath3 = arr[2];
		if(filepath1 == null && oldFilepath1 != null) {
			filepath1 = oldFilepath1;
		}
		if(filepath2 == null && oldFilepath2 != null) {
			filepath2 = oldFilepath2;
		}
		if(filepath3 == null && oldFilepath3 != null) {
			filepath3 = oldFilepath3;
		}
		//수정 전 파일이 존재했으면 값 있음! , 수정 전 파일이 없으면 null
	
		//새파일이 null이면 기존 파일명으로 덮어씌우기
		Ask a = new Ask();
		a.setAskNo(askNo);
		a.setAskTitle(askTitle);
		a.setAskContent(askContent);
		//3. 비즈니스로직
		AskService service = new AskService();
		int result = service.UpdateAsk(a);
		//4. 결과처리zd
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
		request.setAttribute("loc", "askList.do?reqPage=1");
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
