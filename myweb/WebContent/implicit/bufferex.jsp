<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
	//전체 버퍼 크기 : 기본 8KB(8192B)
	int bufferSize = out.getBufferSize();
	//현재 버퍼의 남은 크기
	int remainSize = out.getRemaining();
	//현재 사용 가능한 버퍼 크기
	int usedSize = bufferSize - remainSize;
%>
<body>
	버퍼 전체 크기 : <%=bufferSize %><br><br>
	사용한 버퍼 크기 : <%=usedSize %><br><br>
	남은 버퍼 : <%out.println(remainSize); %>byte<br><br>
</body>
</html>