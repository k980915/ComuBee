<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>자유게시판</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        .pagination a {
            color: black; 
        }
    </style>

</head>

<body>

    <canvas class="my-4 w-100" id="myChart" width="10000" height="380"></canvas>



    <div class="table-responsive small">
        <table class="table table-striped table-sm table-hover">
            <thead>
                <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">글쓴이</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회</th>
                    <th scope="col" class="text-center">추천</th>
                </tr>
            </thead>
            <tbody>
            	
                <tr>
                    <td class="text-center">1</td>
                    <td>random</td>
                    <td>data</td>
                    <td>placeholder</td>
                    <td>text</td>
                    <td class="text-center">20</td>
                </tr>
                <tr>
              <td class="text-center">2</td>
              <td>placeholder</td>
              <td>irrelevant</td>
              <td>visual</td>
              <td>layout</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">3</td>
              <td>data</td>
              <td>rich</td>
              <td>dashboard</td>
              <td>tabular</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">4</td>
              <td>information</td>
              <td>placeholder</td>
              <td>illustrative</td>
              <td>data</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">5</td>
              <td>text</td>
              <td>random</td>
              <td>layout</td>
              <td>dashboard</td>
              <td class="text-center">1</td>
            </tr>
            <tr>
              <td class="text-center">6</td>
              <td>dashboard</td>
              <td>irrelevant</td>
              <td>text</td>
              <td>placeholder</td>
              <td class="text-center">5</td>
            </tr>
            <tr>
              <td class="text-center">7</td>
              <td>dashboard</td>
              <td>illustrative</td>
              <td>rich</td>
              <td>data</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">8</td>
              <td>placeholder</td>
              <td>tabular</td>
              <td>information</td>
              <td>irrelevant</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">9</td>
              <td>random</td>
              <td>data</td>
              <td>placeholder</td>
              <td>text</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">10</td>
              <td>placeholder</td>
              <td>irrelevant</td>
              <td>visual</td>
              <td>layout</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">11</td>
              <td>data</td>
              <td>rich</td>
              <td>dashboard</td>
              <td>tabular</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">12</td>
              <td>information</td>
              <td>placeholder</td>
              <td>illustrative</td>
              <td>data</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">13</td>
              <td>text</td>
              <td>placeholder</td>
              <td>layout</td>
              <td>dashboard</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">14</td>
              <td>dashboard</td>
              <td>irrelevant</td>
              <td>text</td>
              <td>visual</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">15</td>
              <td>dashboard</td>
              <td>illustrative</td>
              <td>rich</td>
              <td>data</td>
              <td class="text-center">0</td>
            </tr>
            <tr>
              <td class="text-center">16</td>
              <td>random</td>
              <td>tabular</td>
              <td>information</td>
              <td>text</td>
              <td class="text-center">0</td>
            </tr>
            </tbody>
        </table>
    </div>
    <nav aria-label="Page navigation example" style="text-align: center;">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                    <span class="sr-only">Previous</span>
                </a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                    <span class="sr-only">Next</span>
                </a>
            </li>
        </ul>
    </nav>
    
    <script>
    	$("tbody tr").click(function(){
    		var bno = $(this).children.eq(0).text();
    		location.href="${contextPath}/detail.bo?bno="+bno;
    	});
		$(".page-link").click(function(){
			var btnNo=Number($(this).text());
			location.href="list.${category}?currentPage="+btnNo;
		});
		var currentPage=${pi.currentPage}
		function prev(){
			location.href='list.${category}?currentPage='+(currentPage-1);
		}
		function next(){
			location.href='list.${category}?currentPage='+(currentPage+1);
		}
	</script>
    	
    </script>

</body>
</html>