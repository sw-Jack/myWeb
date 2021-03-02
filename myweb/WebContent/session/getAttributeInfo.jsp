<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String memberId = (String)session.getAttribute("memberId");
	String name = (String)session.getAttribute("name");
%>
<title>세션 정보 불러오기</title>
</head>
<body>
	Member Id : <%=memberId %> <br>
	Name : <%=name %>
</body>
</html>