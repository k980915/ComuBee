<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메뉴</title>
<style>
    .nav-area {
        text-align: center;
        margin: 20px 0;
    }
    .board-menuBar {
        display: inline-block;
        margin: 0 10px;
    }
    .board-menuBar a {
        text-decoration: none;
        color: black;
        font-size: 16px;
    }
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<!-- el로 contextPath 사용하기 위한 작업 -->
	<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
	
	<div class="nav-area">
        <div class="board-menuBar">
            <a href="${contextPath}">컨텐츠</a>
        </div>
        <div class="board-menuBar">
            <a href="${contextPath}/list.no?currentPage=1">공지게시판</a>
        </div>
        <div class="board-menuBar">
            <a href="${contextPath}/list.rc?currentPage=1">추천게시판</a>
        </div>
        <div class="board-menuBar">
            <a href="${contextPath}/list.rv?currentPage=1">리뷰게시판</a>
        </div>
        <div class="board-menuBar">
            <a href="${contextPath}/list.db?currentPage=1">토론게시판</a>
        </div>
        <div class="board-menuBar">
            <a href="${contextPath}/list.fr?currentPage=1">자유게시판</a>
        </div>
    </div>

</body>
</html>
