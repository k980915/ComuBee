package com.kh.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.model.service.AdminService;
import com.kh.user.model.vo.AdminHits;

/**
 * Servlet implementation class HitsViewMoth
 */
@WebServlet("/monthHitsView.ad")
public class HitsViewMothController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HitsViewMothController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String yearData = request.getParameter("yearData");
		String monthData = request.getParameter("monthData");
		
//		System.out.println(monthData);
//		System.out.println(yearData);
		
		AdminHits adh = new AdminHits(yearData,monthData);
		
		int result = new AdminService().MonthHitsView(adh);
		
		response.getWriter().print(result);
		
//		System.out.println(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
