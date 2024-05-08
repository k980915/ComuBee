<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String category = (String)request.getAttribute("category"); %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    

	<title>자유게시판</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<style>
    	.pagination a {
     	   color: black; 
    	}
    	.create-post-button {
        	display: block;
        	width: 200px;
        	margin: 20px auto 10px; 
    	}
	</style>
</head>

<body>

    <%@ include file="/views/board/boardMenuBar.jsp" %>
	<div class="boardTitle">
		<h2>자유게시판</h2>	
	</div>
	
	<a href="${contextPath}/insert.bo" class="btn btn-outline-secondary create-post-button">게시글 작성</a>
	<%@ include file="/views/board/listSample.jsp" %>

</body>
</html>