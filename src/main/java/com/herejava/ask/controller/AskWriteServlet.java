package com.herejava.ask.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.ask.service.AskService;
import com.herejava.ask.vo.Ask;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;



/**
 * Servlet implementation class AskWriteServlet
 */
@WebServlet(name = "AskWrite", urlPatterns = { "/askWrite.do" })
public class AskWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskWriteServlet() {
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
				int memberNo = Integer.parseInt(mRequest.getParameter("memberNo"));
				String askTitle = mRequest.getParameter("askTitle");
				System.out.println(askTitle);
				String askContent = mRequest.getParameter("askContent");
				//파일이렇게안꺼내요 꺼내는거확인해보셔야돼요이건
				//파일3개인데 컬럼은 1개씩이면 저장은 어떻게해요3개를? 아 3개다있구나 파일꺼내는것만 수업때한거찾아보세요 파일은 getParameter로꺼내는게아니에요
				String filepath1 = mRequest.getOriginalFileName("filepath1");
				String filepath2 = mRequest.getParameter("filepath2");
				String filepath3 = mRequest.getParameter("filepath3");
				Ask a = new Ask();
				a.setMemberNo(memberNo);
				a.setAskTitle(askTitle);
				a.setAskContent(askContent);
				a.setFilepath1(filepath1);
				a.setFilepath2(filepath2);
				a.setFilepath3(filepath3);
				//3. 비즈니스로직
				AskService service = new AskService();
				int result = service.insertAsk(a);
				//4. 결과처리
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
				request.setAttribute("loc", "/askList.do?reqPage=1");
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
