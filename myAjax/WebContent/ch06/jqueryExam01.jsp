<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>JQuery 테스트 페이지</title>
<style type="text/css">
	div#displayArea {
		width: 200px;
		height: 200px;
		border: 5px double #6699FF;
	}
</style>
<script type="text/javascript" src="/myAjax/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() { // 문서가 준비되면 다음에 나오는 함수를 실행
		$("button").click(function() { // button 태그를 클릭하면 다음에 나오는 함수를 실행
			// id가 displayArea인 태그에 괄호안의 html문을 넣어줌 
			$("#displayArea").html("<img src='ansi_main2s.png' border='0'/>");
		});
	});
</script>
</head>
<body>
	<div id="displayArea">이 곳의 내용이 변경될 것</div>
	<button>표시</button>
</body>
</html>