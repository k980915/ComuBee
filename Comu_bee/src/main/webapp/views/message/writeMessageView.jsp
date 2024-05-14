<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/views/board/board-css/ListSample.css">
<title>Insert title here</title>
<style>
.button-container {
	text-align: center; /* Center-align the container */
}

.button-container .button {
	margin-left: 20px;
	/* Adjust the margin to push the buttons to the right */
}

.slide {
	float: right;
}

.pagination a {
	color: black;
}
</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>

	<button class="btn btn-outline-secondary create-post-button"
		id="sendView" onclick="sendList();">내가 보낸 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button"
		id="receiveView" onclick="receiveList();">내가 받은 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button"
		id="writeMessage" onclick="writeMessage();">쪽지 쓰기</button>

	<div>
		<form action="<%=contextPath%>/sendMessage.ms" method="post">
			<div class="message-input-area">
				<label for="name">name</label> <input type="hidden" name="senderId"
					value="${loginUser.userId}"> <input type="text" id="name"
					placeholder="받는사람 닉네임" name="receiverId">
			</div>
			<div class="message-input">
				<label for="message">Message</label>
				<textarea id="message" rows="6" name="message"></textarea>
			</div>
			<ul class="action">
				<li><input type="submit" value="sendMessage" /></li>
				<li><input type="reset" value="clear"></li>
			</ul>
		</form>
	</div>
	<script>
	function sendList(){
		location.href='sendList.ms?userId=${loginUser.userId}&sendListCurrentPage=1';
	}
	function receiveList(){
		location.href='receiveList.ms?userId=${loginUser.userId}&receiveListCurrentPage=1';
	}
	function writeMessage(){
		location.href='goSendMessageForm.ms?userId=${loginUser.userId}';
	}
	</script>
</body>
</html>