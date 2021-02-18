<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NULL 에러 발생</title>
</head>
<%
	response.setStatus(HttpServletResponse.SC_OK);
%>
<body>
	<b>서비스 처리 과정에서 NULL 예외가 발생하였습니다.</b>
</body>
</html>