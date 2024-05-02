<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	
	<!-- el로 contextPath 사용하기 위한 작업 -->
	<c:set var="contextPath" value="${pageContext.request.contextPath}"></c:set>
	
	<div class="nav-area" align="center">
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
            <a href="${contextPath}/list.bt?currentPage=1">토론게시판</a>
        </div>

    </div>

</body>
</html>