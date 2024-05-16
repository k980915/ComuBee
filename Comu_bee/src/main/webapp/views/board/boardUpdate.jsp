<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/board/board-css/BoardUpdate.css">
</head>
<body>
	<%@ include file="/views/board/boardMenuBar.jsp" %>
	
	<div class="boardOuter">
		<div class="boardBody">
			<div class="boardMenuBar">
				<h3>게시글 수정</h3>
			</div>
			<div class="boardMain">
				<div class="boardContent">
					<form action="${contextPath}/update.bo" method="post" enctype="multipart/form-data">
						<input type="hidden" name="boardNo" value="${b.boardNo}">
						<input type="hidden" name="boardCategory" value="${category}">
						<table class="table center-table">
							<thead>
								<c:if test="${category ne 'RECOMMEND'}">
									<tr class="table-row">
										<th>제목</th>
										<td class="boardFreeTitle">
											<input type="text" name="title" required value="${b.title}">
										</td>
									</tr>
								</c:if>
								<tr class="table-row">
									<th>작성자</th>
									<td class="boardWriter">${b.userId}</td>
									<th>조회수</th>
									<td class="boardCount">${b.count}</td>
									<th>추천수</th>
									<td class="boardLike">${b.boardLike}</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="boardContent" height="400" colspan="4">
										<textarea name="content" rows="10" style="resize:none;" required>${b.boardContent}</textarea>
									</td>
								</tr>
								<tr class="table-row">
									<th>첨부파일</th>
									<td colspan="3">
										<c:if test="${at!=null}">
											<c:forEach var="ats" items="${at}">
												${ats.originName}
												<input type="hidden" name="originFileNo" value="${ats.atNo}">
												<input type="hidden" name="originFileName" value="${ats.changeName}">
											</c:forEach>
										</c:if>
										<input type="file" name="reUploadFile">
									</td>
								</tr>
								<tr class="table-row">
									<td class="boardSearchTag" colspan="4">
										태그: 관련검색어 본인이 입력할 수 있게?
									</td>
									<c:if test="${category eq 'RECOMMEND'}">
										관련 컨텐츠 제목 선택할 수 있는 영역 만들기
									</c:if>
								</tr>
							</tbody>
						</table>
						<div class="submitBtnArea" align="center">
							<button type="submit" class="button">수정하기</button>
							<button type="reset" class="button" onclick="location.href=''">취소하기</button>
						</div>
					</form>
				</div>
				
				<br><br>
			</div>
		</div>
	</div>
</body>
</html>
