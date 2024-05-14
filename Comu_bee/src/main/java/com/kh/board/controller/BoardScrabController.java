package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.BoardService;

/**
 * Servlet implementation class BoardScrabController
 */
@WebServlet("/insertScrab.bo")
public class BoardScrabController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardScrabController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId=request.getParameter("userId");
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardService bs = new BoardService();
		int result = bs.scrabCheck(bno,userId);
		System.out.println("result"+result);
		int result2=0;
		String msg="";
		if(result>0) {
			result2=bs.deleteScrab(bno,userId);
		}else {
			result2=bs.insertScrab(bno,userId);
		}
		response.getWriter().print(result);
	}

}
