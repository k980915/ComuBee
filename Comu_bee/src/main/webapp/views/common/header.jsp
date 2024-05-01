<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메뉴바</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>             
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">	
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
	  #login-form,#user-info{
            float: right;
        }
        #user-info a{
            text-decoration: none;
            color: black;
            font-size: 12px;
        }
        .nav-area{
            background-color: rgb(51, 50, 50);
        }
        .menu{
            display: inline-block;
            height: 50px;
            width: 150px;
        }
        .menu a{
            text-decoration: none;
            color: white;
            font-size: 20px;
            font-weight: bold;
            display: block;
            width: 100%;
            height: 100%;
            line-height: 50px;
        }
        .menu a:hover{
            background-color: darkgray;
        }
        
         .outer{
            background-color: lightgray;
            color: black;
            width: 1000px;
            margin: auto;
            margin-top: 50px; 
        }
        #enroll-form table{
        	margin: auto;
        }
        #enroll-form input{
        	margin: 5px;
        }
        #myPage-form table{
        	margin: auto;
        }
        #myPage-form input{
        	margin: 5px;
        }
    </style>
</head>
<body>
	
	<!-- EL표기법으로 contextPath 사용하기 위한 작업 -->
	<c:set var="contextPath" value="${pageContext.request.contextPath }"/>


    <h1 float="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;COMU-BEE</h1>
    
    <div class="login-area">

        <form id="login-form" action="" method="post">
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="userId" required></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <button type="submit">로그인</button>
                        <button type="button">회원가입</button>
                    </th>
                </tr>
            </table>
        </form>
     </div>
 

    <!--float 해제-->
    <br clear="both">



</body>
</html>