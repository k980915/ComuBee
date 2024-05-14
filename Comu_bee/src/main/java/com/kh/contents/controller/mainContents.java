package com.kh.contents.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.contents.model.service.ContentsService;
import com.kh.contents.model.vo.Board;
import com.kh.contents.model.vo.Contents;

/**
 * Servlet implementation class mainContents
 */
@WebServlet("/main.co")
public class mainContents extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainContents() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		ArrayList<Contents> recommendReview = new ArrayList<>();
//		recommendReview = new ContentsService().ForReview();

		ArrayList<Contents> conList = new ArrayList<>();
		conList = new ContentsService().DetailContentsList();
		
		ArrayList<Contents> bestList = new ArrayList<>();
		bestList = new ContentsService().BestContentsList();
		
		ArrayList<Board> boardList = new ArrayList<>();
		boardList = new ContentsService().ForReview();
		
		request.setAttribute("conList", conList);
		request.setAttribute("bestList", bestList);
		request.setAttribute("boardList", boardList);
		

		request.getRequestDispatcher("views/contents/mainPage.jsp").forward(request, response);

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
