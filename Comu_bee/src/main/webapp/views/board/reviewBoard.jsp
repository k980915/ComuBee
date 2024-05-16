<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/views/board/boardMenuBar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>리뷰게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .pagination a {
            color: black; 
        }
        .boardHeader {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .create-post-button {
            display: inline-block;
            margin-left: auto; 
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="boardHeader">
            <h2>리뷰게시판</h2>
            <a href="${pageContext.request.contextPath}/insert.bo" class="btn btn-outline-secondary create-post-button">게시글 작성</a>
        </div>
        <div class="table-responsive">
            <%@ include file="/views/board/listSample.jsp" %>
        </div>
    </div>
</body>
</html>
