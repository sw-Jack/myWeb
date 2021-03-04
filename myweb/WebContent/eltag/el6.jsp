<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="elfunc" uri="/WEB-INF/tlds/el-functions.tld" %>
<%
	Date today = new Date();
	request.setAttribute("today", today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TLD 파일을 활용하여 EL 함수 호출</title>
</head>
<body>
	오늘은 <b>${elfunc:dateFormat(today) }</b> 입니다. 
</body>
</html>