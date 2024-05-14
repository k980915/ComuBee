<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 만들기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/views/board/board-css/CreatePost.css">
</head>
<body>
    <%@ include file="/views/board/boardMenuBar.jsp" %>
  
    <div class="container mt-4">
        <h2 class="post-title">게시글 작성하기</h2>
        <form action="${contextPath}/insert.bo" method="post" enctype="multipart/form-data">
            <input type="hidden" name="bdGroup" value="${category}">
            <input type="hidden" name="userId" value="${loginUser.userId}">
            <input type="hidden" name="bdIndent" value="<%= request.getAttribute("bdIndent") %>">
            <c:if test="${category ne '리뷰'}">
                <div class="mb-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="제목을 작성해주세요" required>
                </div>
            </c:if>
            <c:if test="${category eq '리뷰'}">
                <div class="mb-3 contInput">
                    <label for="contTitle" class="form-label">관련된 컨텐츠</label>
                    <input type="text" class="form-control" id="contTitle" name="contTitle" placeholder="관련된 컨텐츠 제목을 적어주세요" required>
                    <button onclick="searchTitle();" class="btn btn-outline-secondary search-btn">검색</button>
                    <span class="contList"></span>
                </div>
            </c:if>
            
            <div class="form-group mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" id="bdContent" rows="10" name="content" placeholder="내용을 작성해주세요" required></textarea>
            </div>
            <c:if test="${category ne '리뷰'}">
                <div class="form-group mb-3">
                    <label for="uploadFile" class="form-label">첨부파일</label>
                    <input type="file" class="form-control" id="uploadFile" name="uploadFile">
                </div>
            </c:if>
            <div class="form-buttons">
                <button type="submit" class="btn btn-outline-secondary form-submit-button">등록하기</button>
                <button type="button" class="btn btn-outline-danger form-submit-button" onclick="history.back();">취소</button>
            </div>
        </form>
    </div>
<div>

</div>
<script>
    function searchTitle(){
        var contTitle=$("#contTitle").val();
        var tr="<select name='contentsId'>";
        
        $.ajax({
            url : "searchContTitle.bo",
            data : {
                contTitle : contTitle
            },
            success : function(cList){
                if(cList.length==0){
                    alert("조회결과가 없습니다.");
                    $("#contTitle").val("");
                }else{
                    for(var i in cList){
                        tr+="<option value='"
                            +cList[i].contentsId+"'>"
                            +cList[i].title
                            +"</option>"
                    }
                    tr+="</select>";
                
                $(".contList").html(tr);
                }
            },
            error : function(){
                console.log("오류난듯");
                
            }
        })
    return false;
    }
</script>
    <br><br><br><br>
</body>
</html>
