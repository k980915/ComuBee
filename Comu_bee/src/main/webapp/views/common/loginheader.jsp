<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.user.model.vo.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
 <% User loginUser = (User)session.getAttribute("loginUser"); 
	String alertMsg = (String)session.getAttribute("alertMsg");
	String contextPath = request.getContextPath();
	

	
	
	%>   


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
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

 


	
    <div class="login-area">
          <%if(loginUser==null){ %>
        <form id="login-form" action="<%=contextPath%>/login.us" method="post">
            <table>
                <tr>
                    <th>아이디</th>
                    <td><input type="text" name="userId" required placeholder="아이디"></td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td><input type="password" name="userPwd" required placeholder="비밀번호"></td>
                </tr>
                <tr>
                	<td colspan="2">
                	<label for="saveId"> 아이디 저장: </label> <input id="saveId" type="checkbox"  name= "saveId"></td>
                </tr>
                <tr>
                    <th colspan="2" align="center">
                        <button type="submit">로그인</button>
                        <button type="button" onclick="enrollForm();">회원가입</button>
                    </th>
                </tr>
            </table>
        </form>
        
        <script>
        
        $(function(){
        	
        	var saveId ="${cookie.userId.value}"
        	
        	if(saveId!=""){
        		$("#saveId").attr("checked",true);
        		$("#loginId").val(saveId);
        	}
        	
        	console.log("확인");
        	console.log(saveId);
        	
        });
        
        function enrollForm(){
        	location.href ="<%=contextPath%>/views/user/userEnrollForm.jsp";
        }
        
        </script>
        <% }else{ %>]
        <div id ="user-info">
        	<b><%=loginUser.getUserId()%>님 환영합니다.</b>
        	<a href="<%=contextPath%>/myPage.me">마이페이지</a>
        	<a href="<%=contextPath %>/logout.us">로그아웃</a>
        </div>
     </div>


<%} %>

<script>
	var msg = "<%=alertMsg%>";
	
	if(msg!="null"){
		alert(msg);
		<%session.removeAttribute("alertMsg");%>
		
	}

</script>
</body>
</html>

