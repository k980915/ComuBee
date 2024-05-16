package com.kh.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.message.model.service.MessageService;
import com.kh.message.model.vo.Message;

/**
 * Servlet implementation class MessageServiceController
 */
@WebServlet("/sendMessage.ms")
public class MessageSendController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MessageSendController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//form 태그에서 보내준 값 받아오기 
		String senderId=request.getParameter("senderId");
		String receiverId=request.getParameter("receiverId");
		String message = request.getParameter("message");
		System.out.println(senderId);
		System.out.println(receiverId);
		System.out.println(message);
		Message m = new Message(senderId, receiverId,message);
		int result=new MessageService().sendMessage(m);
		if(result>0) {
			request.setAttribute("sendAlert", "메시지 전송 성공");
		}else {
			request.setAttribute("sendAlert", "메시지 전송 실패");
		}
		request.getRequestDispatcher("views/message/writeMessageView.jsp").forward(request, response);
	}
}
