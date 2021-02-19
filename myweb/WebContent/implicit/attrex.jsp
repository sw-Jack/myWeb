<%@page import="com.sun.xml.internal.ws.client.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>속성(Attribute)과 생존 범위(Scope)</title>
</head>
<%	
	//pageContext Scope에 속성 저장
	//pageContext.setAttribute("pageAttribute", "LJW", PageContext.PAGE_SCOPE);
	pageContext.setAttribute("pageAttribute", "LJW");
	
	//request Scope에 속성 저장
	//pageContext.setAttribute("requestAttribute", "010-2222-3333", PageContext.REQUEST_SCOPE);
	request.setAttribute("requestAttribute", "010-2222-3333");
	
	//session Scope에 속성 저장
	//pageContext.setAttribute("sessionAttribute", "example@nave.com", PageContext.SESSION_SCOPE);
	session.setAttribute("sessionAttribute", "example@nave.com");
	
	//application Scope에 속성 저장
	//pageContext.setAttribute("applicationAttribute", "KG IT Bank", PageContext.APPLICATION_SCOPE);
	application.setAttribute("applicationAttribute", "KG IT Bank");
%>
<body>
	<ul>
		<li>이름 : <%=pageContext.getAttribute("pageAttribute") %></li>
		<li>전화번호 : <%=request.getAttribute("requestAttribute") %></li>
		<li>이메일 : <%=session.getAttribute("sessionAttribute") %></li>
		<li>회사 : <%=application.getAttribute("applicationAttribute") %></li>
	</ul>
</body>
</html>