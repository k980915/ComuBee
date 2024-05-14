<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.user.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>헤더</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
body {
	background-size: 100%;
	background-attachment: scroll;
	position: relative;
}

body::before {
	content: '';
	position: absolute;
	width: 100%;
	height: 100%;
	background-color: #E6D5B5;
	z-index: -1;
}

.outer {
	margin: auto;
	margin-left: 200px;
	margin-right: 200px;
}

.head-area {
	display: flex;
	justify-content: space-between;
	align-items: center;
	overflow: hidden;
	text-align: center;
	margin-left: 100px;
	margin-right: 100px;
}


#logo-img {
	width: 250px;
	height: 200px;
}

.title {
	margin-left: 10px;
	font-size: 35px;
	font-weight: 900;
	border: none;
}

.search-area {
	flex: 1;
	text-align: center;
	margin-top: 20px;
}

.search-area form {
	text-align: center;
}

.search-input {
	width: 400px;
	height: 40px;
	display: inline-block;
	margin: 0 auto;
}

.login-area {
	margin-top: 20px;
	float: right;
}

#logo:hover {
	cursor: pointer;
}

/* <!-- 게시판 용 메뉴바 시작 --!> */
.board-menuBar {
	display: inline-block;
	height: 50px;
	width: 150px;
}

.board-menuBar a {
	text-decoration: none;
	color: white;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 100%;
	height: 100%;
	line-height: 50px;
}

.board-menuBar a:hover {
	background-color: rgb(144, 142, 142);
}
/* <!-- 게시판 용 메뉴바 끝 --!> */
.logo-area, .search-area, .login-area {
	display: inline-block;
	vertical-align: middle;
}



</style>
</head>
<body>
	<div class="outer">
		<div class="head-area">
			<div class="logo-area">
				<table id="logo">
					<tr>
						<td><img src="resources/uploadFiles/logo.png" id="logo-img"></td>
						<td><h1 class="title">COMU-BEE <br> </h1></td>
						<td></td>
					</tr>
				</table>
			</div>
			<div class="search-area">
				<form id="searchForm" action="" method="get">
					<input type="text" name="title" class="search-input"
						placeholder="영화 또는 드라마 등 컨텐츠 검색">
					<button type="submit">검색</button>
				</form>
			</div>
			
			<div>
				<%@include file="/views/common/loginheader.jsp"%>
			</div>
		</div>
	</div>
	<br>
	<br>
		<div>
			<%@ include file="/views/common/hitsHeader.jsp"%>
		</div>
	<script>
		$('.logo-area').click(function() {
			location.href = '${contextPath}/main.co';
		});
	
	
	</script>
	<script>
		var form = document.getElementById('searchForm');
		form.action = '${pageContext.request.contextPath}/contents.se';
	</script>
	<br>
	<br>
</body>
</html>