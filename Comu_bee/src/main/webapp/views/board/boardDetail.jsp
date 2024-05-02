<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/header.jsp" %>
	<div class="boardMain">
		<h3>게시판</h3>
		<!-- 관리자라면 게시판 관리/공지작성 버튼이 보이게 처리하기 -->
	</div>
	
	<div class="boardBody">
		<div class="boardTitle">
			<table border="1px solid black">
				<thead>
					<tr>
						<td class="boardCategory">[카테고리]</td>
						<td class="boardFreeTitle" colspan="4">제목</td>
					</tr>
					<tr>
						<td>작성자 : </td>
						<td class="boardWriter" width="300">작성자 아이디</td>
						<td class="boardCount" width="150">조회수 : </td>
						<td class="boardLike" width="100">추천수 : </td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="boardContent" height="400" colspan="4">
							작성내용
						</td>
					</tr>
					<tr>
						<td class="boardSearchTag" colspan="4">
							태그 : 관련검색어 본인이 입력할 수 있게?
						</td>
						<c:if test="게시판 카테고리가 추천이면">
							관련 컨텐츠 제목 선택할 수 있는 영역 만들기
						</c:if>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="boardList">
		<table border="1px solid black">
			<thead class="boardListToolBar"> 
				<tr>
					<td>
					<form action="">
						<!-- 카테고리 항목 선택 시 해당 카테고리 조회 결과 리스트 조회(비동기통신 이용할 듯) -->
						<select name="categoryList">
							<c:forEach var="c" items="${category}">
								<option value="${c.categoryNo}">"${c.categoryName}"</option>
							</c:forEach>
						</select>
					</form>
						
					</td>
					<td colspan="6">
						검색기능, 카테고리 별 분류기능 뭐 이런 거 넣을 공간
					</td>
				</tr>
				<tr>
					<td colspan="6">
						한줄이면 심심하니까 두줄로 예시
					</td>
				</tr>
			</thead>
			<tbody class="boardList">
				<!-- 반복문 활용해서 양식에 따라 자동 작성 -->
				<tr>
					<td>카테고리</td>
					<td>글제목</td>
					<td>작성자</td>
					<td>조회수</td>
					<td>추천</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>글제목</td>
					<td>작성자</td>
					<td>조회수</td>
					<td>추천</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>글제목</td>
					<td>작성자</td>
					<td>조회수</td>
					<td>추천</td>
					<td>작성일</td>
				</tr>
			</tbody>
			
		</table>
			

	</div>
	<!-- footer 있으면 그대로 다시 따오기 -->

</body>
</html>