<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/board/board-css/ListSample.css">
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

	<button class="btn btn-outline-secondary create-post-button" id="sendView" onclick="sendList();">내가 보낸 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button" id="receiveView" onclick="receiveList();">내가 받은 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button" id="writeMessage" onclick="writeMessage();">쪽지 쓰기</button>
	<!-- <button id="scrabView" onclick="scrabList();">보관함</button> -->	
	<div id="messages-area" class="table-responsive small">
		<table border="1" align="center" class="table table-striped table-sm table-hover">

			<thead>
				<tr>
					<td>쪽지 번호</td>
					<td>작성자</td>
					<td>받는이</td>
					<td>내용</td>
					<td>작성일</td>
					<td>확인여부</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="m" items="${list}">
							<tr>
								<td class="text-center">${m.mNo}</td>
								<td class="boardListTitle">${m.sendName }</td>
								<td>${m.receiveName}</td>
									<c:choose>
										<c:when test="${fn:length(m.messageContent) > 10}">
											<c:set var="shortenedContent"
												value="${fn:substring(m.messageContent, 0, 10)}..." />
											<td>${shortenedContent }</td>
										</c:when>
										<c:otherwise>
											<td>${m.messageContent }</td>
										</c:otherwise>
									</c:choose>
								<td>${m.sendDate }</td>
								<td>${m.readCheck }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">새로운 쪽지가 없습니다</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	<nav aria-label="Page navigation example" style="text-align: center;">
        <ul class="pagination justify-content-center">
        	<c:if test="${pi.currentPage gt 1}">
	            <li class="page-item">
	                <button aria-label="Previous" onclick="prev();">
	                    <span aria-hidden="true">&laquo;</span>
	                    <span class="sr-only" >Previous</span>
	                </button>
	            </li>
        	</c:if>
            <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
           		<li class="page-item">
           			<button class="page-link">${i}</button>
           		</li>
            </c:forEach>
	           <c:if test="${pi.currentPage lt pi.maxPage}">
           		<li class="page-item">
	                <button aria-label="Next"  onclick="next();">
	                    <span aria-hidden="true">&raquo;</span>
	                    <span class="sr-only">Next</span>
	                </button>
	            </li>
            </c:if>
        </ul>
    </nav>
	<div>
		
	</div>
	<br>
	<br>
	
	
	<script>
	$(".boardListTitle").click(function(){
		var mNo = $(this).siblings().eq(0).text();
		location.href='${contextPath}/detail.ms?mNo='+mNo;
	});
	 $(".page-link").click(function(){
		var btnNo=Number($(this).text());
		location.href='receiveList.ms?userId=${loginUser.userId}&receiveListCurrentPage='+btnNo;
	});
	var receiveListCurrentPage=${pi.currentPage}
	function prev(){
		location.href='receiveList.ms?userId=${loginUser.userId}&receiveListCurrentPage='+(receiveListCurrentPage-1);
	}
	function next(){
		location.href='receiveList.ms?userId=${loginUser.userId}&receiveListCurrentPage='+(receiveListCurrentPage+1);
	}
	
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
