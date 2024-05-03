<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <title>추천게시판</title>

    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .pagination a {
            color: black; /* Ensures text color is black */
        }
    </style>

</head>

<body>

    	<%@ include file="/views/board/boardMenuBar.jsp" %>
	<div class="boardTitle">
		<h2>추천게시판</h2>	
	</div>
	
	<%@ include file="/views/board/listSample.jsp" %>

</body>
</html>