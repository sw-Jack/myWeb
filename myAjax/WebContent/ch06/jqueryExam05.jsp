<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>JQuery Ajax 메서드 - load() 응답 처리</title>
<script type="text/javascript" src="/myAjax/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#b1").click(function() {
			$("#result").load("xhrTest2.txt", function(response, stu, xhr) {
				if(stu == "success") // 서버 요청 성공시 (success는 지정 값)
					alert("로드 성공!");
				if(stu == "error") // 서버 요청 실패시 (error는 지정 값)
					alert("에러 : " + xhr.status + " : " + xhr.stu);
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