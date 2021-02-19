<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="customer" class="actiontag.Customer" scope="page"/>
<jsp:setProperty name="customer" property="*"/>
<html>
<head>
<meta charset="UTF-8">
<title>가입 정보</title>
</head>
<body>
	<ul>
		<li>이름 : <jsp:getProperty name="customer" property="name"/></li>
		<li>이메일 : <jsp:getProperty name="customer" property="email"/></li>	
		<li>전화 : <jsp:getProperty name="customer" property="phone"/></li>
	</ul>
</body>
</html>