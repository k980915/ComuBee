package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.board.model.vo.Reply;
import com.kh.contents.model.vo.Contents;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("UTF-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardService bs = new BoardService();
		HttpSession session = request.getSession();
		int result=new BoardService().increaseCount(bno);
		if(result>0) {
			ArrayList<Category> cList = bs.selectCategoryList();
			Board b = new BoardService().selectBoard(bno);
			// 첨부파일 정보도 조회하기
			Attachment at = bs.selectAttachment(bno);
			ArrayList<Contents> bestContList=bs.bestContList();
			ArrayList<Board> newPopList=bs.newPopList(b);
			ArrayList<Board> bestPopList=bs.bestPopList(b);
			ArrayList<Reply> rList = bs.replyList(bno);
			ArrayList<Board> list = (ArrayList<Board>)session.getAttribute("list");
			request.setAttribute("b",b);
			request.setAttribute("at",at);
			request.setAttribute("cList", cList);
			request.setAttribute("rList", rList);
			request.setAttribute("newPopList", newPopList);
			request.setAttribute("bestPopList", bestPopList);
			request.setAttribute("bestContList", bestContList);
			request.setAttribute("list",list);
			request.getRequestDispatcher("views/board/boardDetail.jsp").forward(request, response);
			
		}else {
			request.getSession().setAttribute("alertMsg", "조회실패");
			response.sendRedirect(request.getHeader("referer"));// 이전 주소 반환
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
