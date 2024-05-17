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
import com.kh.board.model.vo.Board;
import com.kh.common.model.vo.PageInfo;
import com.kh.contents.model.vo.Contents;

/**
 * Servlet implementation class BattleListController
 */
@WebServlet("/list.db")
public class DebateListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DebateListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		int listCount; // 총 게시글 개수
		int currentPage; // 현재 페이지
		int pageLimit; // 페이지 하단에 보여질 페이징 바 최대 개수
		int boardLimit; // 한 페이지에 보여줄 게시글 개수
		
		int maxPage; // 가장 마지막 페이징바가 몇 번인지(총 페이지 개수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		HttpSession session = request.getSession();
		session.setAttribute("category", "토론");
		session.setAttribute("cat","db");
		String ca = (String)session.getAttribute("category");
		//listCount - 현재 게시글 개수 - DB에서 조회해 오기
		listCount = new BoardService().listCount(ca);
		
		// currentPage - 현재 페이지 정보
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		//페이지 하단에 보여질 페이징바 최대 개수
		pageLimit=10;
		
		//한 페이지에서 보여줄 게시글 개수
		boardLimit=10;
		
		/*
		 * maxPage : 가장 마지막 페이지가 몇 번인지(총 페이지수)
		 * 
		 * listCount와 boardLimit의 영향을 받는 수
		 * 
		 * 게시글 개수가 107일 때 한 페이지에 10개씩 보여준다고 하면 10페이지는 가득 채워지고
		 * 11페이지에서는 7개의 데이터만 보여지게 된다.
		 * 따라서, 총 개수/한 페이지 개수 처리 후 소수점 부분은 올림처리하기
		 * 
		 * */
		maxPage=(int)Math.ceil((double)listCount/boardLimit);
		
		/*
		 * startPage : 페이징바의 시작 수
		 * pageLimit이 10인 경우
		 * 
		 * currentPage가 1~10일 땐 1
		 * currentPage가 11~20일 땐 2
		 * currentPage가 21~30일 땐 3
		 * 
		 * (currentPage-1)/pageLimit *pageLimit+1
		 * 
		 * 
		 * */
		startPage=(currentPage-1)/pageLimit*pageLimit+1;
//		System.out.println(startPage);
		
		endPage=startPage+pageLimit-1;
		// 만약 현재 페이징 바 처리의 endPage가 maxPage(총 페이지 수)보다 클 때
		// endPage 값을 maxPage 값으로 변경해 주기
		if(endPage>maxPage) {
			endPage=maxPage;
		}

		
		PageInfo pi = new PageInfo(listCount,currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
		Board b=new Board();
		b.setCategory(ca);
		// 게시글 목록
		ArrayList<Board> list = new BoardService().selectListByCategory(pi,ca);
		ArrayList<Board> noList = new BoardService().selectNoticeListByCategory();
		ArrayList<Contents> pcList = new BoardService().bestContList();
		ArrayList<Board> npbList = new BoardService().newPopList(b);
		ArrayList<Board> bpbList=new BoardService().bestPopList(b);
		//위임하기 위한 데이터 담아주기
		session.setAttribute("pi", pi);
		session.setAttribute("list", list);
		session.setAttribute("noList",noList);
		session.setAttribute("pcList", pcList);
		session.setAttribute("npbList", npbList);
		session.setAttribute("bpbList",bpbList);

		request.getRequestDispatcher("views/board/debateBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
