<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>회원가입 확인</title>
<link href="style.css" rel="stylesheet" type="text/css"/>
</head>
<body bgcolor="#FFFFCC">
	<c:set var="flag" value="${flag }"/>
	<br>
	<center>
	<c:choose>
		<c:when test="${flag }">
			<b>회원가입을 축하드립니다.</b><br>
			<a href='member.mdo?cmd=login'>로그인</a>
		</c:when>
		<c:otherwise>
			<b>다시 입력해주십시오.</b><br>
			<a href='member.mdo?cmd=regForm'>다시입력</a>
		</c:otherwise>
	</c:choose>
	</center>	
</body>
</html>