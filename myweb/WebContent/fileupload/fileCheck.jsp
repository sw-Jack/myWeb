<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String fileName1 = request.getParameter("fileName1");
	String fileName2 = request.getParameter("fileName2");
	String originalName1 = request.getParameter("originalName1");
	String originalName2 = request.getParameter("originalName2");
	System.out.println("동작");
%>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 확인 및 다운로드</title>
</head>
<body>
	올린 사람 : <%=name %><br>
	제목 : <%=subject%><br>
	파일명1 : <a href="/myweb/upload/<%=fileName1 %>"><%=originalName1 %></a><br>
	파일명2 : <a href="/myweb/upload/<%=fileName2 %>"><%=originalName2 %></a><br>
</body>
</html>