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
#name, #message {
	   background-color: #FAF0E0;
	   border: 1px solid black;
	   padding: 5px;
	   margin: 0;
	   box-sizing: border-box;
	   
}
#message{
   	width:100%;
   	height:100%;
   	box-sizing: border-box;
}
.boardHeader {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

</style>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
<div class="container mt-4">
	<button class="btn btn-outline-secondary create-post-button"
		id="sendView" onclick="sendList();">내가 보낸 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button"
		id="receiveView" onclick="receiveList();">내가 받은 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button"
		id="writeMessage" onclick="writeMessage();">쪽지 쓰기</button>

	<div align="center">
	    <form action="<%=contextPath%>/sendMessage.ms" method="post" onsubmit="return showAlert();">
	        <table border="1">
	            <tr>
	                <td style="background-color: #8F684F; border: 1px solid black;" >이름</td>
	                <td><input type="hidden" name="senderId" value="${loginUser.userId}">
	                    <input type="text" id="name" placeholder="받는사람 닉네임" name="receiverId" required></td>
	            </tr>
	            <tr>
	                <td style="background-color: #8F684F; border: 1px solid black;">메시지</td>
	                <td><textarea id="message" rows="8" name="message" required></textarea></td>
	            </tr>
	        </table>
	        <input type="submit" value="메시지 보내기" >
	        <input type="reset" value="지우기">
	    </form>
	</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<c:if test="${not empty sendAlert}">
    <script>
        alert("${sendAlert}");
    </script>
</c:if>
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
	var msg = "${sendAlert}";
	
	function showAlert() {
	    // 메시지가 설정되어 있으면 true 반환하여 폼 제출
	    return "${not empty sendAlert}";
	}
	

	</script>
	</div>
</body>
</html>