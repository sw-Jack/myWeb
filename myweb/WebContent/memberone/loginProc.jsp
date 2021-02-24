<%@page import="memberone.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	StudentDAO dao = StudentDAO.getInstance();
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	int check = dao.loginCheck(id, pass);
%>
<%
	if(check == 1) { // 로그인 성공
		session.setAttribute("loginId", id);
		response.sendRedirect("login.jsp"); // 로그인 성공 시 로그인 페이지로 이동
	} else if(check == 0) { // 아이디는 있는데 비밀번호 오류인 경우
%>
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	history.go(-1); // 이전 페이지로 이동
</script>
<% } else { // 아이디 자체가 없는 경우 %>
<script type="text/javascript">
	alert("해당 아이디가 존재하지 않습니다.");
	history.go(-1);
</script>
<% } %>
</html>