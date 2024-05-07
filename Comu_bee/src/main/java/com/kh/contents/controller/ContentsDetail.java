package com.kh.contents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.contents.model.vo.Contents;

/**
 * Servlet implementation class ContentsDetail
 */
@WebServlet("/ContentsDetail")
public class ContentsDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ContentsDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int contentsId = Integer.parseInt(request.getParameter("contentsId"));
		String title = request.getParameter("title");
		String englishTitle = request.getParameter("englishTitle");
		String overView = request.getParameter("overView");
		String posterPath = request.getParameter("posterPath");
		String runtime = request.getParameter("runtime");
		String releaseDate = request.getParameter("releaseDate");
		String ageLimit = request.getParameter("ageLimit");
		double rate = Double.parseDouble(request.getParameter("rate"));
		String actors = request.getParameter("actors");
		String director = request.getParameter("director");
		
		Contents con = new Contents(contentsId, title, englishTitle, overView, posterPath, runtime, releaseDate, ageLimit, rate, actors, director);
	
//		request.getRequestDispatcher("views/contents/contentsDetailView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
