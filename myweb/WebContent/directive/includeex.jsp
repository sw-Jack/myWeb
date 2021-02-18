<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>include 지시어를 활용한 예제</h2>
	<%
		String name = "LJW";
	%>
	<%@ include file="top.jsp" %>
	포함하는 페이지 지시어(include) 예제의 내용입니다.
	<%@ include file="bottom.jsp" %>
</body>
</html>