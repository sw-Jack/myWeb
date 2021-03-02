<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	Cookie cookie = new Cookie("hour", "1time");
	cookie.setMaxAge(60); // 유효 시간 60초
	response.addCookie(cookie);
%>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 유효 시간 설정</title>
</head>
<body>
	유효 시간이 1시간인 hour 쿠키 생성
</body>
</html>