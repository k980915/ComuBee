<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Suspend 활동정지</title>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
</head>
<body>
	<%@ include file="/views/common/myPageadmin.jsp"%>

	<h3>년도 선택 :</h3>
	<select id="yearSelectId2">
		<option value="2023년">2023년</option>
		<option value="2024년">2024년</option>
	</select>
	<input type="button" id="monthA" value="확인하기">

	<canvas id="adminChart" width="50%" height="50%"></canvas>

	<script>
		// 차트를 그럴 영역을 dom요소로 가져온다.
		var chartArea = document.getElementById('adminChart').getContext('2d');
		// 차트를 생성한다. 
		var yearData = $("#yearSelectId2").val();
/* 		var monthData = $("#monthHitsId").val(); */
		var adminChart = new Chart(chartArea,
				{
					// ①차트의 종류(String)
					type : 'bar',
					// ②차트의 데이터(Object)
					data : {
						// ③x축에 들어갈 이름들(Array)
						labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
								'Orange' ],
						// ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
						datasets : [ {
							// ⑤dataset의 이름(String)
							
	$(function () {
		$("#monthA").click(function () {
			var yearData = $("#yearSelectId2").val();
			
			/* console.log(yearData); */
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
							
							
							
							
							
							
							
							
							label : yearData,
							// ⑥dataset값(Array)
							data : [ 12, 19, 3, 5, 2, 3 ],
							// ⑦dataset의 배경색(rgba값을 String으로 표현)
							backgroundColor : 'rgba(255, 99, 132, 0.2)',
							// ⑧dataset의 선 색(rgba값을 String으로 표현)
							borderColor : 'rgba(255, 99, 132, 1)',
							// ⑨dataset의 선 두께(Number)
							borderWidth : 1
						} ]
					},
					// ⑩차트의 설정(Object)
					options : {
						// ⑪축에 관한 설정(Object)
						scales : {
							// ⑫y축에 대한 설정(Object)
							y : {
								// ⑬시작을 0부터 하게끔 설정(최소값이 0보다 크더라도)(boolean)
								beginAtZero : true
							}
						}
					}
				});
	</script>

</body>
</html>