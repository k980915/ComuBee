package com.kh.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.user.model.service.AdminService;

/**
 * Servlet implementation class MessageCouponCreate
 */
@WebServlet("/cpCreate.ad")
public class MessageCouponCreate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageCouponCreate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userIdval");
		String couponStr = request.getParameter("couponStr");
//		System.out.println(userId);
//		System.out.println(couponStr);
		
		
		// 포인트 차감 구문 작성
		int result = new AdminService().MessageCouponCreate(userId);
		
		
		if(result>0) {
			request.setAttribute("couponStr", couponStr);
			request.setAttribute("userIdval", userId);
			request.getRequestDispatcher("views/message/messageMainView.jsp").forward(request, response);
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
