package com.kh.search.controller;

import com.kh.search.model.service.BoardSearchService;
import com.kh.board.model.vo.Board;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/board.se")
public class BoardSearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("title");
        
        BoardSearchService searchService = new BoardSearchService();
        
            ArrayList<Board> boardList = searchService.search(keyword);
            request.setAttribute("boardList", boardList);
            request.getRequestDispatcher("/views/search/boardSearchResults.jsp").forward(request, response);
        
        
    }
}