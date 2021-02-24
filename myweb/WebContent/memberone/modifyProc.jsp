<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberone.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="vo" class="memberone.StudentVO">
	<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<%
	StudentDAO dao = StudentDAO.getInstance();
	String loginId = (String)session.getAttribute("loginId");
	vo.setId(loginId);
	dao.updateMember(vo);
%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Refresh" content="3;url=login.jsp"> <!-- 3초뒤에 로그인 페이지로 자동 이동 -->
<title>Update Process</title>
</head>
<body>
	<center>
		<font size="5" face="바탕체">
			입력하신 내용대로  <b>회원정보가 수정되었습니다.</b><br><br>
			3초 후에 로그인 페이지로 이동합니다.
		</font>
	</center>
</body>
</html>