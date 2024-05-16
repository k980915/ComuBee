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
                                <c:if test="${category ne '리뷰'}">
                                    <tr class="table-row">
                                        <th class="small-header">제목</th>
                                        <td class="boardFreeTitle" colspan="4">
                                            <input type="text" name="title" required value="${b.title}">
                                        </td>
                                    </tr>
                                </c:if>
                                <tr class="table-row">
                                    <th class="small-header">작성자</th>
                                    <td class="boardWriter" width="40%">${b.userId}</td>
                                    <th class="small-header">조회수</th>
                                    <td class="boardCount" width="30%">${b.count}</td>
                                    <th class="small-header">추천수</th>
                                    <td class="boardLike" width="30%">${b.boardLike}</td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="table-row">
                                    <td class="boardContent" colspan="6">
                                        <textarea name="content" rows="10" style="resize:none;" required>${b.boardContent}</textarea>
                                    </td>
                                </tr>
                                <tr class="table-row">
                                    <th class="small-header">첨부파일</th>
                                    <td colspan="5">
                                        <c:if test="${at!=null}">
                                        	${at.originName}
                                            <input type="hidden" name="originFileNo" value="${at.atNo}">
                                            <input type="hidden" name="originFileName" value="${at.changeName}">
                                        </c:if>
                                        <input type="file" name="reUploadFile">
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="submitBtnArea" align="center">
                            <button type="submit" class="button">수정하기</button>
                            <button type="reset" class="button" onclick="location.href=''">취소하기</button>
                        </div>
                    </form>
                </div>
            </div>
            <br><br>
        </div>
        <br><br><br>
    </div>
    
</body>
</html>
