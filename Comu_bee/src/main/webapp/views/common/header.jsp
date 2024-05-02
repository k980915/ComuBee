<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.user.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헤더</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>         
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
	    .head-area {
	        overflow: hidden;
	        text-align: center;
	    }
	    .logo-area,
	    .search-area,
	    .login-area {
	        display: inline-block; 
	        vertical-align: middle; 
	    }
	    .logo-img {
	        width: 50px; 
	        height: 50px; 
	    }
	    .title{
	        border: none;
	        font-size: 35px;
	        font-weight: 900;
	    }
	    .search-area {
	        text-align: left;
	        margin-top: 10px;
	    }
	    .search-input {
	        width: 400px;
	        height: 40px;
	    }
	    .login-area{
	        margin-top: 20px;
	        float: right;
	    }
    </style>
</head>

<body>


    
    <div class="outer">
        <div class="head-area">
            <a href="">
                <div class="logo-area">
                    <img src="../HTML/resources/1690813477931.jpg" class="logo-img">
                    <h1 class="title">COMU-BEE</h1>
                </div>
            </a>
            <div class="search-area">
                <input type="text" class="search-input" placeholder="영화 또는 드라마 등 컨텐츠 검색">
                <button>검색</button>
            </div>
            <div>
            <%@include file="/views/common/loginheader.jsp" %>
            </div>
            

           
        </div>
    </div> <br><br>



</body>
</html>