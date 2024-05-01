<%@page import="com.kh.common.JDBCTemplate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	    .menu{
            height: 50px;
            width: 300px;
            display: flex;
        }
        .menu a{
            text-decoration: none;
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
        .menu input{
            width: 50px;
        }
	
</style>

</head>
<body>
	
	<%@ include file = "/views/common/header.jsp" %>

	   <div class="nav-area" align="center">
        <form action="">
            <div class="menu">
                <a href="">한줄 리뷰</a>
                <input type="checkbox">추천순
                <input type="checkbox">최신순
            </div>
        </form>
        <table border="1px solid black">
            <tr style="height: 250px;">
                <td style="width: 200px;"><a href="">이미지</a></td>
                <td style="width: 200px;"><a href="">이미지</a></td>
                <td style="width: 200px;"><a href="">이미지</a></td>
            </tr>
            <tr>
                <td><a href="">리뷰</a></td>
                <td><a href="">리뷰</a></td>
                <td><a href="">리뷰</a></td>
            </tr>
            <tr style="height: 250px;">
                <td style="width: 200px;"><a href="">이미지</a></td>
                <td style="width: 200px;"><a href="">이미지</a></td>
                <td style="width: 200px;"><a href="">이미지</a></td>
            </tr>
            <tr>
                <td><a href="">리뷰</a></td>
                <td><a href="">리뷰</a></td>
                <td><a href="">리뷰</a></td>
            </tr>
        </table> <br><br>

        <form action="">
            <div class="menu">
                <h1 align="center">오늘의 추천작품</h1>
            </div>
        </form><br><br>
        <table border="1px solid black">
            <tr>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 400px; width: 400px;"></a>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 300px;">
                    <a href="">줄거리</a>
                </td>
            </tr>
            <tr>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 400px; width: 400px;"></a>
                </td>
                <td style="width: 100px;"></td>
                <td style="width: 300px;">
                    <a href="">줄거리</a>
                </td>
            </tr>
        </table> <br><br>

         
        <form action="">
            <div class="menu">
                <h1 align="center">개봉 예정 영화</h1>
            </div>
        </form><br><br>
        <table>
            <tr>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 200px; width: 200px;"></a>
                </td>
                <td></td>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 200px; width: 200px;"></a>
                </td>
                <td></td>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 200px; width: 200px;"></a>
                </td>
                <td></td>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 200px; width: 200px;"></a>
                </td>
                <td></td>
            </tr>
            <tr align="center">
                <td>영</td>
                <td></td>
                <td>화</td>
                <td></td>
                <td>제</td>
                <td></td>
                <td>목</td>
                <td></td>
            </tr>
        </table> <br><br>

        <form action="">
            <div class="menu">
                <h1 align="center">신작 드라마</h1>
            </div>
        </form><br><br>
        <table>
            <tr>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 200px; width: 200px;"></a>
                </td>
                <td></td>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 200px; width: 200px;"></a>
                </td>
                <td></td>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 200px; width: 200px;"></a>
                </td>
                <td></td>
                <td>
                    <a href=""><img src="../HTML/resources/1690813477931.jpg"  style="height: 200px; width: 200px;"></a>
                </td>
                <td></td>
            </tr>
            <tr align="center">
                <td>신작</td>
                <td></td>
                <td>드</td>
                <td></td>
                <td>라</td>
                <td></td>
                <td>마</td>
                <td></td>
            </tr>
        </table>






    </div>

</body>
</html>