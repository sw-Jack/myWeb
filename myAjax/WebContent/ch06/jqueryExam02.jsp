<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>JQuery selector와 메서드를 사용한 엘리먼트의 내용 변경</title>
<script type="text/javascript" src="/myAjax/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#b1").click(function() {
			$("#b2").text($("p").text()); // id가 b2인 엘리먼트의 텍스트를 p 엘리먼트의 text값으로 변경
		});
		$("#b2").click(function() {
			$("#display").html("<img src='myFace.png' border='0'/>");
		});
	});
</script>
</head>
<body>
	<p>이미지 표시</p>
	<button id="b1">버튼 레이블 변경</button>
	<div id="display"></div>
	<button id="b2">버튼</button>
</body>
</html>