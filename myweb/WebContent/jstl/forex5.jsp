<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core example - for</title>
</head>
<body>
	<c:forTokens var="car" items="Audi, Benz, Hyundai, Kia, Ferrari" delims=",">
		자동차 이름 : <c:out value="${car }"/><br>
	</c:forTokens>
</body>
</html>