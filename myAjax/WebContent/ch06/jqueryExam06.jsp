<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>JQuery Ajax 메서드 - $.get() : 서버에 HTTP get 방식으로 요청</title>
<script type="text/javascript" src="/myAjax/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#b1").click(function() {
			// xhrTest2.txt를 get 방식으로 요청
			$.get("xhrTest2.txt", function(data, status) {
				var resultStr = "데이터 : " + data + "\n처리 상태 : " + status;
				$("#result").text(resultStr);
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