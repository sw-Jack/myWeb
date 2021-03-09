<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
%>

안녕하세요! <%=name %> 회원님!
