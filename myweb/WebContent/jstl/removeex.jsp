<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL set/remove/out Example</title>
</head>
<body>
	browser 변수 값 설정
	<c:set var="browser" value="${header['User-agent'] }"/><br>
	<c:out value="${browser }"/><p> <!-- out은 해당 문장 변수 그대로 출력 -->
	browser 변수 값 제거 후
	<c:remove var="browser"/>
	<c:out value="${browser }"/>
</body>
</html>