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
 * Servlet implementation class MessageDetailController
 */
@WebServlet("/detail.ms")
public class MessageDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		String str="";
		Message ms = new MessageService().selectMessageByMNo(mNo);
		if(ms==null) {
			str+="해당 메시지를 가져올 수 없습니다.";
			request.setAttribute("str", str);
			request.getRequestDispatcher("views/message/messageMainView.jsp").forward(request, response);
		}else {
			request.setAttribute("ms", ms);
			request.getRequestDispatcher("views/message/messageDetailView.jsp").forward(request, response);
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
