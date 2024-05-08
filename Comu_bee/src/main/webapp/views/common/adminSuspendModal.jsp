<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSuspendModal</title>
</head>
<body>
<div align="center">
	
	


<br><br><br>
<!-- Button to Open the Modal -->
<button align="center" type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  회원 정지
</button>

<!-- The Modal -->

<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->	
      <div class="modal-body">
        <input type="radio" name="3day" value="3일">  <label for="3day"> 3일</label>  <br>
		<input type="radio" name="10day" value="10일"> <label for="3day"> 10일  <br>
		<input type="radio" name="30day" value="30일">  <label for="3day">30일  <br>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
</div>
</body>
</html>