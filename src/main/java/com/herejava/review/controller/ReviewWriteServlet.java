package com.herejava.review.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.review.service.ReviewService;
import com.herejava.review.vo.Review;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class ReviewWriteServlet
 */
@WebServlet(name = "ReviewWrite", urlPatterns = { "/reviewWrite.do" })
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewWriteServlet() {
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
		//파일업로드 준비
		//2.1. 파일업로드 경로 설정
		String root = getServletContext().getRealPath("/");
		String saveDirectory = root+"/review_img";
		//2-2. 업로드 파일 최대크기 지정
		int maxSize = 10*1024*1024;
		//2-3. request >> MultipartRequest로 변환(파일업로드 되는 시점)
		MultipartRequest mRequest = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy());
		long bookNo = Long.parseLong(mRequest.getParameter("bookNo"));
		int memberNo = Integer.parseInt(mRequest.getParameter("memberNo"));
		int reviewScore = Integer.parseInt(mRequest.getParameter("star-score"));
		String reviewContent = mRequest.getParameter("reviewContent");
		//filename, filepath는 새 첨부파일이 있으면 파일명으로, 새첨부파일이 없으면 null
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
		String filepath2 = arr[2];
		String filepath3 = arr[1];
		//수정 전 파일이 존재했으면 값 있음! , 수정 전 파일이 없으면 null
	
		Review rev = new Review();
		rev.setBookNo(bookNo);
		rev.setMemberNo(memberNo);
		rev.setReviewScore(reviewScore);
		rev.setReviewContent(reviewContent);
		rev.setFilepath1(filepath1);
		rev.setFilepath2(filepath2);
		rev.setFilepath3(filepath3);
		
		//3.비즈니스로직
		ReviewService service = new ReviewService();
		int result = service.revieWrite(rev);
		//4.결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
		if(result>0) {
			request.setAttribute("title", "성공");
			request.setAttribute("msg", "리뷰가 등록되었습니다.");
			request.setAttribute("icon", "success");
		}else {
			request.setAttribute("title", "실패");
			request.setAttribute("msg", "리뷰 등록 중 문제가 발생하였습니다.");
			request.setAttribute("icon", "error");
		}
		request.setAttribute("loc", "/");
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
