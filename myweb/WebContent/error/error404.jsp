<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 에러 발생</title>
</head>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<body>
	<b>요청한 페이지는 존재하지 않습니다.</b>
</body>
</html>