<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복 체크</title>
</head>
<jsp:useBean id="dao" class="memberone.StudentDAO"/>
<%
	String id = request.getParameter("id");
	boolean isDup = dao.idCheck(id);
%>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<body bgcolor="#FFFFCC">
	<br>
	<center>
		<b><%=id %></b>
		<%
			if(isDup) {
				out.println("는 이미 존재하는 ID입니다.<br><br>");
			} else {
				out.println("는 사용 가능한 아이디입니다.<br><br>");
			}
		%>
		<!-- 팝업창 닫기 -->
		<a href="#" onClick="javascript:self.close();">닫기</a> 
	</center> 
</body>
</html>