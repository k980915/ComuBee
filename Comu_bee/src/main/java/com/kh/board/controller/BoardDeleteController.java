package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;

/**
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/delete.bo")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		int result=new BoardService().deleteBoard(bno);
		HttpSession session = request.getSession();

		String category = (String)session.getAttribute("category");
		String ca="";
		switch(category) {
		case "토론": ca="db";
			break;
		case "자유": ca="fr";
			break;
		case "공지": ca="no";
			break;
		case "추천": ca="rc";
			break;
		case "리뷰": ca="rv";
			break;
		}
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			
			response.sendRedirect(request.getContextPath()+"/list."+ca+"?currentPage=1");
		}else {
			session.setAttribute("alertMsg", "게시글 삭제 실패");
			response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+bno);
			
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
