<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/sample/first.jsp" var="url"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core example - import</title>
</head>
<body>
	${url }
</body>
</html>