<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>JQuery Ajax 메서드 - $.ajax()</title>
<script type="text/javascript" src="/myAjax/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#b1").click(function() {
			var query = {name : "sonny", stus : "homebody"}; // 요청 데이터
			// process.jsp 페이지에 요청 데이터를 보낸 후 결과를 반환받음
			$.ajax({
				type : "POST", // 전송 방식
				url : "process.jsp", // 요청 페이지 // MVC2 모델에서 *.do 경로가 될 부분
				data : query, // 전송 데이터
				success : function(data) { // 요청 페이지를 실행한 결과  // 여기서의 data는 서버로 '보내는' 데이터(query)
					$("#result").html(data); // 여기서의 data는 서버로부터 응답 받은 data(resultStr)
				}
			});
		});
	});
</script>
<style type="text/css">
	#result {
		width: 200px;
		height: 200px;
		border: 5px double #6699FF;
	}
</style>
</head>
<body>
	<button id="b1">결과</button>
	<div id="result"></div>
</body>
</html>