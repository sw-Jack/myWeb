<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	int score = 86;
	request.setAttribute("score", score);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL example - choose</title>
</head>
<body>
	<c:choose>
		<c:when test="${score > 90 }">
			당신의 성적은 A입니다.
		</c:when>
		<c:when test="${score > 80 }">
			당신의 성적은 B입니다.
		</c:when>
		<c:when test="${score > 70 }">
			당신의 성적은 C입니다.
		</c:when>
		<c:when test="${score > 60 }">
			당신의 성적은 D입니다.
		</c:when>
		<c:otherwise>
			 당신의 성적은 F입니다.
		</c:otherwise>
	</c:choose>
</body>
</html>