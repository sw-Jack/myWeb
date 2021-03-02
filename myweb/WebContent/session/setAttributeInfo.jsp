<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	session.setAttribute("memberId", "admin");
	session.setAttribute("name", "Lee");
%>
<html>
<head>
<meta charset="UTF-8">
<title>세션에 정보 저장</title>
</head>
<body>
	세선에 정보를 저장했습니다.
</body>
</html>