<%@page import="com.kh.board.model.vo.Board"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과 페이지</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<%@ include file="/views/board/boardMenuBar.jsp" %>
<h2>검색 결과</h2>

<!-- 검색 폼 추가 -->
<div class="container mt-4">
    <form action="${pageContext.request.contextPath}/board.se" method="get">
        <div class="input-group mb-3">
            <input type="text" name="title" class="form-control" placeholder="게시글 검색" aria-label="게시글 검색" aria-describedby="button-addon2">
            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
        </div>
    </form>
</div>

<br><br>

<h4>게시글</h4>
<!-- 게시글 목록 표시 -->
<table border="1">
    <thead>
        <tr>
            <th>게시글 제목</th>
            <th>컨텐츠</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.title}</td>
                <td>${board.boardContent}</td>
                <td>${board.userId}</td>
                <td>${board.createDate}</td>
            </tr>
        </c:forEach>
        <c:if test="${empty boardList}">
            <tr>
                <td colspan="4">검색 결과가 없습니다.</td>
            </tr>
        </c:if>
    </tbody>
</table>

</body>
</html>