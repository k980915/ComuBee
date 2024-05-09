<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/board/boardMenuBar.jsp" %>
	<div class="boardTitle">
		<h2>공지게시판</h2>	
	</div>
	<c:if test="${loginUser.userId eq 'admin'}">
		<a href="<%=request.getContextPath()%>/create.bo" class="btn btn-outline-secondary create-post-button">게시글 작성</a>	
	</c:if>
	
	<%@ include file="/views/board/listSample.jsp" %>

</body>
</html>