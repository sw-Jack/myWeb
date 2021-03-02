<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	session.invalidate(); // 세션 무효화
%>
<title>세션 종료</title>
</head>
<body>
	<%
		if(session == null) 
	%>
			세션을 종료하였습니다.
</body>
</html>