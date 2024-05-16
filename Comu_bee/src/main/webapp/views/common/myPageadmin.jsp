<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<br>
	<br>
	<div id="hitslog" align="center">
    <h2 style="font-size: 24px; font-weight: bold; ">방문자수 확인</h2><br>
    <h4 style="color : black;">금일 방문수 : 
        <button class="btn btn-light" onclick="toDayHits();">확인하기</button>
    </h4> <br>
    <h4 style="color : black;">월별 방문자수 :
        <select id="yearSelectId" class="btn btn-light">
            <option value="2023년">2023년</option>
            <option value="2024년">2024년</option> </select> 
        <select id="monthHitsId" class="btn btn-light">
            <option value="1월" id="1Month">1월</option>
            <option value="2월" id="2Month">2월</option>
            <option value="3월" id="3Month">3월</option>
            <option value="4월" id="4Month">4월</option>
            <option value="5월" id="5Month">5월</option>
            <option value="6월" id="6Month">6월</option>
            <option value="7월" id="7Month">7월</option>
            <option value="8월" id="8Month">8월</option>
            <option value="9월" id="9Month">9월</option>
            <option value="10월" id="10Month">10월</option>
            <option value="11월" id="11Month">11월</option>
            <option value="12월" id="12Month">12월</option></select> 
        <button  id="monthB" class="btn btn-light">확인하기</button>
    </h4>
</div>


			<!-- 금일 조회수 값을 저장하려면 해당날짜 id나 기타등등으로 값을 저장(update)후 출력
	                     타이머기능????으로 해야하나? 그럼 시간지정부분을 제거 table을 만들고 불러오게끔 금일부분만 hits추가구문입력
	                     카운트 올리기
	                -->
			<!-- 컨텐츠별 조회수는 콘텐츠 상위 top5 나열 sql구문의 값(제목, 조회수)을 가져오면됨 -->

			<!-- 월별은 각 option에 해당하는 value에 의한 연도와 월의 금일조회수(30일or31일)치 총합의 조회수값  -->


	<script> // 금일 방문자수 조회구문
    function toDayHits(result){ 
	      	$.ajax({
			url : "hitsView.ad",
			success : function(result){
				console.log("방문자수 조회 성공");
				console.log(result);
				if(result>0){
					alert("금일 방문자수는"+result+"회 입니다.");
				}else{
					alert("금일 방문자수는 0회 입니다.");
				}
			},
			error : function(){
				console.log("통신 실패");
			}
		});
	}
	</script>

	<script> // 연도 및 월별 방문자수 조회구문
	
	 $(function () {
		$("#monthB").click(function () {
			var yearData = $("#yearSelectId").val();
			var monthData = $("#monthHitsId").val();
			
			/* console.log(yearData,monthData); */
			hitsViewYM(yearData,monthData);
			
         });
			function hitsViewYM(yearData,monthData) {
			  /* console.log(yearData,monthData + "hitsViewYM넘어옴");  */
			 	 $.ajax({
			 		url : "monthHitsView.ad",
			 		data : {
			 			yearData : yearData,
						monthData : monthData
			 		},
			 		success : function(result) {
			 			/* console.log(yearData,monthData + " 값가지고 성공으로 넘어옴"); */	
			 			if(result>0){
							alert("선택하신 월 방문자수는"+result+"회 입니다.");
						}else{
							alert("해당 월 방문자수는 0회 입니다.");
						} 
					},
			 		
			 		error : function () {
						console.log("통신 실패");
					}
			 	}) 
			 
			}
		})
	</script>






</body>
</html>