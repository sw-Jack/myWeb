<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>JQuery Ajax 메서드 - $.post() : 서버에 HTTP post 방식으로 요청</title>
<script type="text/javascript" src="/myAjax/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#b1").click(function() {
			$.post("process.jsp",
					{ // 요청 페이지에 실어 보낼 데이터
						name : "kingkong",
						stus : "homebody"
					},
					function(data, status) { // 응답 내용 처리
						if(status == "success")
							$("#result").html(data);
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