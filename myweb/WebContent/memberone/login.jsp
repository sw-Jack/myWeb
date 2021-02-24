<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="style.css" type="text/css" rel="stylesheet"/>
<%
	//로그인 상태 확인 (세션 유무 확인 변수), 세션에 저장된 로그인 아이디 받아오기
	String loginId = (String)session.getAttribute("loginId"); 
%>
</head>
<body>
<% if(loginId != null) { // 세션이 존재하는 경우 : 로그인된 상태라면 %>
	<table border="1" width="300">
		<tr>
			<td colspan="3" align="center">
			[<%=loginId %>] 님 환영합니다.</td>
		</tr>
		<tr>
			<td align="center" width="100"><a href="modifyForm.jsp">정보수정</a></td>
			<td align="center" width="100"><a href="deleteForm.jsp">회원탈퇴</a></td>
			<td align="center" width="100"><a href="logout.jsp">로그아웃</a></td>
		</tr>
	</table>
<% } else { // 세션이 존재하지 않는 경우 : 로그인 되지 않은 상태라면 %>	
	<form method="post" action="loginProc.jsp">
		<table width="300" border="1">
			<tr>
				<td colspan="2" align="center">회원 로그인</td>
			</tr>
			<tr>
				<td align="center" width="100">아이디</td>
				<td width="200">
					&nbsp;&nbsp;<input type="text" name="id" size="20"/>
				</td>
			</tr>
			<tr>
				<td align="center" width="100">비밀번호</td>
				<td width="200">
					&nbsp;&nbsp;<input type="password" name="pass" size="20"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인"/>&nbsp;&nbsp;
					<input type="button" value="회원가입" onClick="javascript:window.location='regForm.jsp'"/>
				</td>
			</tr>
		</table>
	</form>
<% } %>
</body>
</html>