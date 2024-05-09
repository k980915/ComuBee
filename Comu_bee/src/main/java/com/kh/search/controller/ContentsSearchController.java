package com.kh.search.controller;

import com.kh.search.model.service.ContentsSearchService;
import com.kh.contents.model.vo.Contents;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/contents.se")
public class ContentsSearchController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("title");
        
        ContentsSearchService ContentsSearchService = new ContentsSearchService();
        
            ArrayList<Contents> contentsList = ContentsSearchService.search(keyword);
            request.setAttribute("contentsList", contentsList);
            request.getRequestDispatcher("/views/search/contentsSearchResults.jsp").forward(request, response);
        
        
    }
    
}
