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
//		int contentsId = Integer.parseInt(request.getParameter("contentsId"));
//		String title = request.getParameter("title");
//		String englishTitle = request.getParameter("englishTitle");
//		String overView = request.getParameter("overView");
//		String posterPath = request.getParameter("posterPath");
//		String runtime = request.getParameter("runtime");
//		String releaseDate = request.getParameter("releaseDate");
//		String ageLimit = request.getParameter("ageLimit");
//		double rate = Double.parseDouble(request.getParameter("rate"));
//		String actors = request.getParameter("actors");
//		String director = request.getParameter("director");
//		
//		Contents con = new Contents(contentsId, title, englishTitle, overView, posterPath, runtime, releaseDate, ageLimit, rate, actors, director);
//		Contents c = new ContentsService().DetailContents(con);
//		request.setAttribute("c", c);
	
//		ArrayList<Contents> recommendReview = new ArrayList<>();
//		recommendReview = new ContentsService().ForReview();

		ArrayList<Contents> conList = new ArrayList<>();
		conList = new ContentsService().DetailContentsList();
		
		ArrayList<Contents> bestList = new ArrayList<>();
		bestList = new ContentsService().BestContentsList();

		request.setAttribute("conList", conList);
		request.setAttribute("bestList", bestList);

//		System.out.println(conList);
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
