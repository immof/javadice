package com.herejava.room.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.herejava.room.service.RoomService;

/**
 * Servlet implementation class PriceChangeServlet
 */
@WebServlet(name = "PriceChange", urlPatterns = { "/priceChange.do" })
public class PriceChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PriceChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int roomPrice = Integer.parseInt(request.getParameter("roomPrice"));
		int roomCapacity = Integer.parseInt(request.getParameter("roomCapacity"));
		String roomNo = request.getParameter("roomNo");
		RoomService service = new RoomService();
		int result = service.priceChange(roomPrice,roomNo,roomCapacity);
		RequestDispatcher view = request.getRequestDispatcher("/roomInfo.do");
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
