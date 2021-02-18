<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 지시어 (Directive) : import</title>
</head>
<body>
	<%
		//page 지시어 import 사용 : "java.util.Calendar"
		Calendar cal = Calendar.getInstance();
	%>
	오늘은 
		<%=cal.get(cal.YEAR) %>년
		<%=cal.get(cal.MONTH) + 1 %>월
		<%=cal.get(cal.DATE) %>일
	입니다.
</body>
</html>