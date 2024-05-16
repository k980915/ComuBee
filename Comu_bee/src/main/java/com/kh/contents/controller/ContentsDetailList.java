package com.kh.contents.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.contents.model.service.ContentsService;
import com.kh.contents.model.vo.Board;
import com.kh.contents.model.vo.Contents;

/**
 * Servlet implementation class ContentsDetailList
 */
@WebServlet("/detail.co")
public class ContentsDetailList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentsDetailList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Contents> list = new ContentsService().DetailContentsList();
		ArrayList<Board> boardList = new ContentsService().ForReview();

		
		request.setAttribute("list", list);
		request.setAttribute("boardList", boardList);
    	request.getRequestDispatcher("views/contents/contentsDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
