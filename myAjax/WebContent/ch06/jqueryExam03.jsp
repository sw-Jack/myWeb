<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>JQuery 이벤트 처리</title>
<script type="text/javascript" src="/myAjax/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("p").mouseenter(function() {
			// <p> 엘리먼트에 마우스포인터를 위치시키면 자동 실행
			$(this).text("마우스포인터 위치함");
		});
		$("p").mouseleave(function() {
			// <p> 엘리먼트에서 마우스포인터가 나가면 자동 실행
			$(this).text("마우스포인터 벗어남");
		});
		$("button").dblclick(function() {
			// <button> 엘리먼트를 더블 클릭하면 자동 실행
			$(this).css("background-color", "#cccccc");
		});
		$("button").click(function() {
			// <button> 엘리먼트를 더블 클릭하면 자동 실행
			$(this).css("background-color", "#ffffff");
		});
	});

</script>
</head>
<body>
	<p>마우스 포인터를 여기로</p>
	<button>더블 클릭</button>
</body>
</html>