package com.kh.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Attachment;
import com.kh.board.model.vo.Board;
import com.kh.common.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BoardUpdateController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bno = Integer.parseInt(request.getParameter("bno"));

        Board b = new BoardService().selectBoard(bno);
        Attachment at = new BoardService().selectAttachment(bno);

        request.setAttribute("b", b);
        request.setAttribute("at", at);
        
        request.getRequestDispatcher("views/board/boardUpdate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
        request.setCharacterEncoding("UTF-8");
        if (ServletFileUpload.isMultipartContent(request)) {
            int maxSize = 10 * 1024 * 1024;
            String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles");

            MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			int boardNo=Integer.parseInt(multiRequest.getParameter("boardNo"));
			String title=multiRequest.getParameter("title");
			String content=multiRequest.getParameter("content");
			Board b = new Board();
			b.setBoardNo(boardNo);
			b.setTitle(title);
			b.setBoardContent(content);
			Attachment at=null;
			
			if(multiRequest.getOriginalFileName("reUploadFile")!=null) {
				at=new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("reUploadFile"));
				at.setChangeName(multiRequest.getFilesystemName("reUploadFile"));
				at.setAtFilePath("resources/uploadFiles");
			
				if(multiRequest.getParameter("originFileNo")!=null) {
					at.setAtNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));				
				}
			}
			int result=new BoardService().updateBoard(b, at);
			HttpSession session = request.getSession();
			if(result>0) {
				if(at!=null) {
					if(at!=null && at.getAtNo()!=0) {
						new File(savePath+multiRequest.getParameter("originFileName")).delete();					
						}
					session.setAttribute("alertMsg", "게시글 수정완료");
					}
				}else {
					session.setAttribute("alertMsg", "게시글 수정실패");
					}
			response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+boardNo);
		    }
    }
}
