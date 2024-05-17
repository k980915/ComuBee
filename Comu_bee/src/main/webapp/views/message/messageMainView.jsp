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
<div class="boardTitle">
		<h2>새로 온 쪽지 </h2>	
	</div>
	<button class="btn btn-outline-secondary create-post-button" id="sendView" onclick="sendList();">내가 보낸 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button" id="receiveView" onclick="receiveList();">내가 받은 쪽지</button>
	<button class="btn btn-outline-secondary create-post-button" id="writeMessage" onclick="writeMessage();">쪽지 쓰기</button>
	<!-- <button id="scrabView" onclick="scrabList();">보관함</button> -->	
	<div id="messages-area" class="table-responsive small">
		<table border="1" align="center" class="table table-striped table-sm table-hover">

			<thead>
				<tr>
					<th>쪽지 번호</th>
					<th>작성자</th>
					<th>받는이</th>
					<th>내용</th>
					<th>작성일</th>
					<th>확인여부</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty list }">
						<c:forEach var="m" items="${list}">
							<tr>
								<td class="text-center">${m.mNo}</td>
								<td >${m.sendName }</td>
								<td>${m.receiveName}</td>
								<c:choose>
										<c:when test="${fn:length(m.messageContent) > 10}">
											<c:set var="shortenedContent"
												value="${fn:substring(m.messageContent, 0, 10)}..." />
											<td class="boardListTitle">${shortenedContent }</td>
										</c:when>
										<c:otherwise>
											<td class="boardListTitle">${m.messageContent }</td>
										</c:otherwise>
									</c:choose>
								<td>${m.sendDate }</td>
								<td>${m.readCheck }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">새로운 쪽지가 없습니다</td>
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
		<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
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
		location.href='messageMain.ms?userId=${loginUser.userId}&messageNewCurrentPage='+btnNo;
	});
	var currentPage=${pi.currentPage}
	function prev(){
		location.href='messageMain.ms?userId=${loginUser.userId}&messageNewCurrentPage='+(currentPage-1);
	}
	function next(){
		location.href='messageMain.ms?userId=${loginUser.userId}&messageNewCurrentPage='+(currentPage+1);
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
	
	
	
	
	
	/*
	
		function sendList() {

			$.ajax({
				url : "selectList.ms",
				type : "post",
				data : {
					decide : "sendView",
					userId : "${loginUser.userId}"
				},
				success : function(list) {
					console.log("성공");
					//전부 추가하기
					var tr = "";
					var div = "";
					console.log(list);
					//전부 추가하기

					for ( var i in list) {
						tr += "<tr>" + "<td>" + list[i].mNo + "</td>" + "<td>"
								+ list[i].sendName + "</td>" + "<td>"
								+ list[i].receiveName + "</td>" + "<td>"
								+ list[i].messageContent + "</td>" + "<td>"
								+ list[i].sendDate + "</td>" + "<td>"
								+ list[i].readCheck + "</td>" + "</tr>";
					}
					$("#messages-area tbody").html(tr);
				},
				error : function() {
					console.log("통신오류");
				}

			});
		}

		function receiveList() {

			$
					.ajax({
						url : "selectList.ms",
						type : "post",
						data : {
							decide : "receiveView",
							userId : "${loginUser.userId}"
						},
						success : function(list) {
							console.log("성공");
							 $("#messages-area tbody>tr").remove(); 
							var tr = "";
							if (list == null) {
								tr += "<tr>" + "<td>" + "조회된 메시지가 없습니다"
										+ "</td>"
							} else {
								console.log(list);
								//전부 추가하기
								for ( var i in list) {
									var messageContent = list[i].messageContent.length > 10 ? list[i].messageContent
											.substring(0, 10)
											+ "..."
											: list[i].messageContent;
									tr += "<tr>" + "<td>" + list[i].mNo
											+ "</td>" + "<td>"
											+ list[i].sendName + "</td>"
											+ "<td>" + list[i].receiveName
											+ "</td>" + "<td>" + messageContent
											+ "</td>" + "<td>"
											+ list[i].sendDate + "</td>"
											+ "<td>" + list[i].readCheck
											+ "</td>" + "</tr>";
								}

								$("#messages-area tbody").html(tr);
							}

						},
						error : function() {
							console.log("통신오류");
						}

					});
		}

		$("table").on(
				"click",
				"tbody>tr",
				function(event) {
					if ($(event.target).is('td')
							&& $(event.target).index() >= 0
							&& $(event.target).index() <= 4) {
						var messageId = $(this).find("td:first").text();
						var check = $(this);
						$.ajax({
							url : "updateReadCheck.ms",
							type : "post",
							data : {
								messageId : messageId,
								userId : "${loginUser.userId}"
							},
							success : function(result) {
								// 업데이트가 성공하면 필요에 따라 여기서 추가 작업을 수행할 수 있습니다
								if (result > 0) {
									check.remove();
								}
							},
							error : function() {

							}
						});
					}
				});

 */ 
		
	</script>
	<div align="center">
		<a
			href="${contextPath}/myBoardList.us?myBoardCurrentPage=1&userId=${loginUser.userId}"
			style="color: white;"> 내가 쓴 글 &nbsp;</a><label style="color: white;">&nbsp;
			| &nbsp;</label> <a
			href="${contextPath}/myReplylist.us?myReplyCurrentPage=1&userId=${loginUser.userId}"
			style="color: white;"> 내가 쓴 댓글 &nbsp;</a><label style="color: white;">&nbsp;
			| &nbsp;</label> <a
			href="${contextPath}/messageMain.ms?messageNewCurrentPage=1&userId=${loginUser.userId}"
			style="color: white;"> 쪽 지 &nbsp;</a><label style="color: white;">&nbsp;
			| &nbsp;</label> <a
			href="${contextPath}/scrabList.sc?myScrabCurrentPage=1&userId=${loginUser.userId}"
			style="color: white;"> 찜 목 록 &nbsp;</a><label style="color: white;">&nbsp;
			| &nbsp;</label>
	</div>
	
	</div> <br><br>
	<br><br>
	
</body>
</html>
