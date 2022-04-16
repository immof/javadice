package com.herejava.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class FileDownServlet
 */
@WebServlet(name = "FileDown", urlPatterns = { "/fileDown.do" })
public class FileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileDownServlet() {
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
		String filename = request.getParameter("filename");
		//3.비즈니스 로직
		
		
		
		//4.결과처리
		//파일과 현재 서블릿을 연결
		String root = getServletContext().getRealPath("/"); //webapp폴더
		String downLoadFile = root+"upload/notice/"+filename;
		//파일을 서블릿으로 읽어오기 위한 스트림생성
		FileInputStream fis = new FileInputStream(downLoadFile);
		BufferedInputStream bis = new BufferedInputStream(fis);
		//읽어온 파일을 사용자에게 전달할 스트림 생성
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		//파일명처리
		String resFilename = new String(filename.getBytes("utf-8"),"ISO-8859-1");
		//파일다운로드를 위한 http header설정
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
		//파일전송
		while(true) {
			int read = bis.read();
			if(read != -1) {
				bos.write(read);
			}else {
				break;
			}
		}
		bos.close();
		bis.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
