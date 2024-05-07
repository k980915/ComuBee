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
    <style>
        .pagination a {
            color: black;
        }
        .form-group {
            display: flex;
            flex-direction: column;
            height: 100%;
        }
        .form-group textarea {
            flex-grow: 1; /* Make textarea take up the available vertical space */
        }
        .form-submit-button {
            align-self: flex-end;
            margin-top: 10px;
        }
    </style>
</head>
<body>
  
  
    <div class="container mt-4">
        <h2>게시글 작성하기</h2>
        <form action="writerAction" method="post">
            <input type="hidden" name="bdGroup" value="<%= request.getAttribute("bdGroup") %>">
            <input type="hidden" name="bdOrder" value="<%= request.getAttribute("bdOrder") %>">
            <input type="hidden" name="bdIndent" value="<%= request.getAttribute("bdIndent") %>">

            <div class="mb-3">
                <label for="bdTitle" class="form-label">제목</label>
                <input type="text" class="form-control" id="bdTitle" name="bdTitle" placeholder="제목을 작성해주세요" required>
            </div>
            
            <div class="form-group mb-3">
                <label for="bdContent" class="form-label">내용</label>
                <textarea class="form-control" id="bdContent" rows="10" name="bdContent" placeholder="내용을 작성해주세요" required></textarea>
                <button type="submit" class="btn btn-outline-secondary form-submit-button">제출하기</button>
            </div>
        </form>
    </div>
<div>

</div>
    <br><br><br><br>
</body>
</html>