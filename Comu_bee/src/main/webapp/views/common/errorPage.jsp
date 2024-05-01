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


	<h1 align="center" style="color:red"><%=errorMsg %></h1>
	
	<h3><a href="<%=request.getContextPath()%>"></a>메인으로</h3>
</body>
</html>