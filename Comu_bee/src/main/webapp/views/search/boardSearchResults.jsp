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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/search/search-css/BoardSearch.css">
</head>
<body>

<%@ include file="/views/board/boardMenuBar.jsp" %>
<h2>검색 결과</h2>

<div class="table-responsive small">
    <table class="table table-striped table-sm table-hover boardSearchResult">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
                <th>추천</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${boardList}" var="board">
                <tr>
                    <td>${board.boardNo}</td>
                    <td class="boardTitle">${board.title }</td>
                    <td>${board.userId}</td>
                    <td>${board.createDate}</td>
                    <td>${board.count}</td>
                    <td>${board.boardLike}</td>
                </tr>
            </c:forEach>
            <c:if test="${empty boardList}">
                <tr>
                    <td colspan="6">검색 결과가 없습니다.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
</div>

<!-- 검색 폼 추가 -->
<div class="container mt-4">
    <form action="${pageContext.request.contextPath}/board.se" method="get">
        <div class="input-group mb-3">
            <input type="text" name="title" class="form-control search-input" placeholder="게시글 검색" aria-label="게시글 검색" aria-describedby="button-addon2">
            <button class="btn search-btn" type="submit" id="button-addon2">검색</button>
        </div>
    </form>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll(".boardSearchResult tbody tr").forEach(function(row) {
            row.addEventListener("click", function() {
                var bno = this.children[0].innerText;
                var contextPath = '<%= request.getContextPath() %>';
                location.href = contextPath + '/detail.bo?bno=' + bno;
            });
        });
    });
</script>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
<br><br><br>
</body>
</html>
