<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberone.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete process</title>
<%
	StudentDAO dao = StudentDAO.getInstance();
	String id = (String)session.getAttribute("loginId");
	String pass = request.getParameter("pass");
	int check = dao.deleteMember(id, pass);
	if(check == 1) { // 회원탈퇴 성공시
		session.invalidate(); // 세션 무효화
%>
<meta http-equiv="Refresh" content="3;url=login.jsp"> <!-- 3초 후 자동으로 로그인 페이지로 이동 -->
</head>
<body>
	<center>
		<font size="5" face="바탕체">
			회원탈퇴가 완료되었습니다.<br>
			3초 후에 로그인 페이지로 이동합니다.
		</font>
	</center>
<%
	} else { // 비밀번호가 틀린 경우 %>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1); // 이전 페이지로 이동
	</script>
<%	}  %>
</body>
</html>