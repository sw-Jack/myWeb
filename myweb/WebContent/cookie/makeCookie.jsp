<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("이승재","UTF-8"));
	response.addCookie(cookie);
%>
</head>
<body>
	<%=cookie.getName() %>쿠키의 값 = <"<%=cookie.getValue() %>
</body>
</html>