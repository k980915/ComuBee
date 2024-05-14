<%@page import="com.kh.contents.model.vo.Contents"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>컨텐츠검색결과</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/search/search-css/ContentsSearch.css">
</head>
<body>

<%@ include file="/views/board/boardMenuBar.jsp" %>
<h2>검색결과</h2>

<div class="movie-details-container">
<c:forEach items="${contentsList}" var="movie">
    <div class="movie-item">
        <a href="${pageContext.request.contextPath}/detail.co?contentsId=${movie.contentsId}">
<img src="${pageContext.request.contextPath}/${movie.posterPath}" alt="${movie.title}" class="movie-poster">
        </a>
        <div class="movie-info">
            <h3>${movie.title} <small>(${movie.releaseDate})</small></h3>
            <p class="overview">${movie.overView}</p>
            <p class="runtime">상영시간: ${movie.runtime}</p>
            <p class="director">감독: ${movie.director}</p>
        </div>
    </div>
</c:forEach>
</div>

<br><br><br><br><br><br><br>

</body>
</html>
