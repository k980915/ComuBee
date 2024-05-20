<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>리스트 양식</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/views/board/board-css/ListSample.css">
<style>
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
	<%@ include file="/views/board/boardMenuBar.jsp"%>


	<canvas class="my-4 w-100" id="myChart" width="10000" height="380"></canvas>


	<div class="container mt-4">
		<div class="boardTitle">
			<h2>찜 목록</h2>
		</div>
		<div class="table-responsive small">
			<table class="table table-striped table-sm table-hover">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">작성일</th>
						<th scope="col">조회수</th>
						<th scope="col" class="text-center">추천</th>
					</tr>

				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list}">
							<c:forEach items="${list}" var="li">
								<tr>
									<td class="text-center">${li.boardNo}</td>
									<td class="boardListTitle">${li.title}</td>
									<td>${li.userId}</td>
									<td>${li.createDate}</td>
									<td>${li.count }</td>
									<td class="text-center">${li.boardLike}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">조회된 데이터가 없습니다.</td>
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
						<button class="page-link" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span> <span class="sr-only"
								onclick="prev();">Previous</span>
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
						<button class="page-link" aria-label="Next">
							<span aria-hidden="true">&raquo;</span> <span class="sr-only"
								onclick="next();">Next</span>
						</button>
					</li>
				</c:if>
			</ul>
		</nav>

		<script>
			$(".boardListTitle").click(function() {
				var bno = $(this).siblings().eq(0).text();
				location.href = '${contextPath}/detail.bo?bno=' + bno;
			});
			$(".page-link")
					.click(
							function() {
								var btnNo = Number($(this).text());
								location.href = 'scrabList.sc?&userId=${loginUser.userId}&myScrabCurrentPage='
										+ btnNo;
							});
			var currentPage = $
			{
				pi.currentPage
			}
			function prev() {
				location.href = 'scrabList.sc?&userId=${loginUser.userId}&myScrabCurrentPage='
						+ (currentPage - 1);
			}
			function next() {
				location.href = 'scrabList.sc?&userId=${loginUser.userId}&myScrabCurrentPage='
						+ (currentPage + 1);
			}
		</script>

		<div align="center">
			<a
				href="${contextPath}/myBoardList.us?myBoardCurrentPage=1&userId=${loginUser.userId}"
				style="color: white;"> 내가 쓴 글 &nbsp;</a><label style="color: white;">&nbsp;
				| &nbsp;</label> <a
				href="${contextPath}/myReplylist.us?myReplyCurrentPage=1&userId=${loginUser.userId}"
				style="color: white;"> 내가 쓴 댓글 &nbsp;</a><label
				style="color: white;">&nbsp; | &nbsp;</label> <a
				href="${contextPath}/messageMain.ms?messageNewCurrentPage=1&userId=${loginUser.userId}"
				style="color: white;"> 쪽 지 &nbsp;</a><label style="color: white;">&nbsp;
				| &nbsp;</label> <a
				href="${contextPath}/scrabList.sc?myScrabCurrentPage=1&userId=${loginUser.userId}"
				style="color: white;"> 찜 목 록 &nbsp;</a><label style="color: white;">&nbsp;
				| &nbsp;</label>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</div>


</body>
</html>