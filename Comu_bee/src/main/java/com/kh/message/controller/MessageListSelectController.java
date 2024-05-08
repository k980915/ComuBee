package com.kh.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.message.model.service.MessageService;
import com.kh.message.model.vo.Message;

/**
 * Servlet implementation class MessageListSelectController
 */
@WebServlet("/selectList.ms")
public class MessageListSelectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageListSelectController() {
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
		
		String decide = request.getParameter("decide");
		String userId =request.getParameter("userId");
		ArrayList<Message> list =new ArrayList<>();
		
		
		
		if(decide.equals("sendView")) {
			list = new MessageService().selectSendMessage(userId);
			System.out.println(list);
		}else if(decide.equals("receiveView")) {
			list = new MessageService().selectReceiveMessage(userId);
		}else if(decide.equals("scrabView")) {
			list = new MessageService().selectScrabMessage(userId);
		}
		response.setContentType("json/application; charset=UTF-8");
		//gson이용하여 응답데이터 전달하기 
		new Gson().toJson(list,response.getWriter());
	}

}
