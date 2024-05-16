<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 위임할 때 담아둔 데이터 추출
	String errorMsg = (String)request.getAttribute("errorMsg"); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>

	<h1 align="center" style="color:red"><%=errorMsg %></h1>
	
	<h3 align="center"><a href="${contextPath }/main.co">메인으로</a></h3>
	
</body>


</html>