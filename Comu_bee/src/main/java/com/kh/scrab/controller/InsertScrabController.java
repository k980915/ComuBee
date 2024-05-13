package com.kh.scrab.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.scrab.model.service.ScrabService;

/**
 * Servlet implementation class InsertScrabController
 */
@WebServlet("/insertScrab.sc")
public class InsertScrabController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertScrabController() {
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
		
		int bNo = Integer.parseInt(request.getParameter("bno"));
		String userId = request.getParameter("userId");
		String str="";
		int result = new ScrabService().insertScrab(bNo,userId);
		if(result>0) {
			str+="찜 성공";
		}else {
			str+="찜 실패";
		}
		response.getWriter().print(str);
		
	}

}
