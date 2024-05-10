package com.kh.user.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.TimerDays;
import com.kh.user.model.service.AdminService;

/**
 * Servlet implementation class UserSuspendController
 */
@WebServlet("/suspendDays.ad")
public class UserSuspendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSuspendController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String susDays = request.getParameter("susDays");
		String userIdval = request.getParameter("userIdval");
//		System.out.println(susDays);
//		System.out.println(userIdval);
		
		int result = new AdminService().suspendDays(susDays,userIdval);
		//System.out.println(result);
		if(result>0) {
			if(susDays.equals("3day")) {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().print(result);
				TimerDays.Timer3days(userIdval);
			}else if(susDays.equals("10day")) {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().print(result);
				TimerDays.Timer10days(userIdval);
			}else if(susDays.equals("30day")) {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().print(result);
				TimerDays.Timer30days(userIdval);
			}
			
			
		}else { //실패시 그대로 전송
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(result);
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
