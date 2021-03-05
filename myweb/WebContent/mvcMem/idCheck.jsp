<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title>ID 중복 체크</title>
<link href="style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="#FFFFCC" align="center"><br>
	<b>${id }</b>
	<c:if test="${check == true }">
		는 이미 존재하는 ID입니다.<br>
	</c:if>
	<c:if test="${check != true }">
		는 사용 가능한 ID입니다.<br>
	</c:if>
	<a href="#" onclick="javascript:self.close()">닫기</a>
</body>
</html>