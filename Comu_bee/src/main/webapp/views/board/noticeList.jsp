<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지게시판</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .pagination a {
            color: black; /* Ensures text color is black */
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
    <%@ include file="/views/board/boardMenuBar.jsp" %>
    <div class="container mt-4">
        <div class="boardHeader">
            <h2>공지게시판</h2>
            <c:if test="${loginUser.userId eq 'admin'}">
                <a href="<%=request.getContextPath()%>/insert.bo" class="btn btn-outline-secondary create-post-button">게시글 작성</a>
            </c:if>
        </div>
        <div class="table-responsive">
            <%@ include file="/views/board/listSample.jsp" %>
        </div>
    </div>
</body>
</html>
