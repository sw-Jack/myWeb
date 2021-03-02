<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session = "true" %> <!-- 명시하지 않아도 default로 설정되어 있음 -->
<!DOCTYPE html>
<%
	Date time = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	// session 타임아웃 설정
	session.setMaxInactiveInterval(10 * 60); // 초 단위 : (1분)
%>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보</title>
</head>
<body>
	세션 ID : <%=session.getId() %><br>
	<%
		time.setTime(session.getCreationTime());
	%>
	세션 생성 시간 : <%=formatter.format(time) %><br>
	<%
		time.setTime(session.getLastAccessedTime());
	%>
	<%
		time.setTime(session.getLastAccessedTime());
	%>
	마지막 접근 시간 : <%=formatter.format(time) %>
	
</body>
</html>