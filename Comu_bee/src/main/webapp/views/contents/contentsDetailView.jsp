<%@page import="com.kh.contents.model.vo.Board"%>
<%@page import="com.kh.contents.model.vo.Contents"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.JDBCTemplate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String posterPath = request.getParameter("posterPath");

    ArrayList<Contents> conList = (ArrayList<Contents>)request.getAttribute("conList");
    ArrayList<Contents> bestList = (ArrayList<Contents>)request.getAttribute("bestList");
    ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("boardList");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
             
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>미디어 상세 페이지</title>
    <style>
        p {
            font-size: 50px;
            font-weight:bold;
        }
        span {
            font-size: 40px;
        }
        
        #snd th {
            text-align: center;
            height: 100px;
            font-weight:bold;
        }

        table {
            font-weight: bold;
        }       
        
        #trailer:hover {
            cursor: pointer;
        }
        #titleImg:hover {
            cursor: default;
            transform: none;
            transition: none;
        }
        #snd #trd {
		    border: none;
		}
		#snd tr:nth-child(2){
			background-color:#FAF0E0;
		}
		#snd #trd td {
		    border: 0.5px solid brown;
		}
        #snd th{
        	font-size : 25px;
        	border : 2px solid white;
        	background-color: #8F684F;
        }
        #reply, #reply td{
        	border : 3px solid white;
        }
        .outer h1{
        	font-size: 50px;      	
        	font-weight: bold;
        }     
		.detail-outer {
			margin-left: 400px;
			margin-right: 400px;
		}
		.detail-outer a{
			color:black;
		}
		.detail-outer h1{
			font-weight:900;
		}
		#move{
			background-color:#FAF0E0;
		}

    </style>
</head>
<body>
    <%@include file="/views/common/header.jsp" %>
    <div class="detail-outer">
        <form action="${contextPath}/detail.co">
            <table style="width: 100%;" id="inform">
                <c:forEach var="c" items="${list}">
                    <c:if test="${c.contentsId eq param.contentsId}">
                        <tr>
                            <td rowspan="3" style="width: 50%; height: 600px;">
                                <img id="titleImg" src="${c.posterPath}" style="height: 800px; width: 100%;">
                            </td>
                            <td rowspan="3" style="width: 10%;"></td>
                            <td colspan="3" style="width: 30%; height: 10px;" align="center">
                                <p>${c.title}</p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="height: 10px;" align="center">
                                <span>${c.englishTitle}</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" rowspan="2">
                                <table style="height: 600px;" id="snd">
                                    <tr>
                                        <th>작품정보</th>
                                        <th><a href="${contextPath}/list.rv?currentPage=1">커뮤니티</a></th>
                                        <th id="trailer">트레일러</th>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <table id="trd" style="width: 100%; height: 100%;">
                                                <tr>
                                                    <td style="height: 50px;">평점</td>
                                                    <td>${c.rate}</td>
                                                    <td>개봉일</td>
                                                    <td>${c.releaseDate}</td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 50px;">연령제한</td>
                                                    <td>${c.ageLimit}</td>
                                                    <td>러닝타임</td>
                                                    <td>${c.runtime}</td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 50px;">출연진</td>
                                                    <td>${c.actors}</td>
                                                    <td>감독</td>
                                                    <td>${c.director}</td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 50px;" colspan="4">소개</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" align="center">${c.overView}</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </c:if>
                </c:forEach>
            </table> <br><br><br>
            
            <div class="review">
                <div>
                    <a href="${contextPath}/list.rv?currentPage=1"><h1>최근 한줄 리뷰</h1></a> 
                </div> <br>
                <table id="reply">
                    <c:forEach var="c" items="${boardList}" varStatus="loop">
                        <c:if test="${c.contentsId eq param.contentsId}">
                            <c:if test="${loop.index <= 4}">
                                <tr>
                                    <td width="800px;" height="50px" style="color:white; background-color:#8F684F;">작성자 : ${c.userId }</td>
                                    <td style="color:white; background-color:#8F684F;">작성일 : ${c.createDate }</td>
                                </tr>
                                <tr>
                                    <td height="50px" id="move" colspan="2" width="1000px;">${c.boardContent }</td>
                                </tr>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </table>
            </div> <br><br><br><br>
            <div class="link">
                <c:forEach var="c" items="${list}">
                    <c:if test="${c.contentsId eq param.contentsId}">
                        <h1>트레일러 영상</h1> <br>
                        ${c.link }
                    </c:if>
                </c:forEach>    
            </div><br><br><br>
            
            <h1>보러가기</h1> <br>
            <table>
                <tr>
                    <td width="200px" height="200px">
                        <a href="https://www.netflix.com/kr/"><img src="resources/uploadFiles/net.jpg" width="100%" height="100%"></a>
                    </td>
                    <td width="90px"></td>
                    <td width="200px" height="200px">
                        <a href="https://www.wavve.com/"><img src="resources/uploadFiles/wa.jpg" width="100%" height="100%"></a>
                    </td>
                    <td width="90px"></td>
                    <td width="200px" height="200px">
                        <a href="http://www.tving.com"><img src="resources/uploadFiles/tv.jpg" width="100%" height="100%"></a>
                    </td>
                    <td width="90px"></td>
                    <td width="200px" height="200px">
                       <a href="https://www.disneyplus.com/"> <img src="resources/uploadFiles/disn.jpg" width="100%" height="100%"></a>
                    </td>
                </tr>  
            </table> <br><br><br><br>
        </form>
        
    </div>
    <script>
        $("#trailer").click(function(){
            var linkOffsetTop = $(".link").offset().top;
    
            $('html, body').animate({
                scrollTop: linkOffsetTop
            }, 0);
        });
        
    </script>

</body>
</html>
