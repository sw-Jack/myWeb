<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String code = request.getParameter("code");
	String viewPageURI = null;
	
	if(code.equals("A")) {
		viewPageURI = "viewModule/a.jsp";
	} else if(code.equals("B")) {
		viewPageURI = "viewModule/b.jsp";
	} else if(code.equals("C")) {
		viewPageURI = "viewModule/c.jsp";
	}
%>
<!-- jsp forward 태그 : 해당 페이지로  forward -->
<!-- 이후 forwarding 된 페이지들에선 주소가 변경되지 않고 현재 페이지 view.jsp의 경로에서 계속 물고감 -->
<jsp:forward page="<%=viewPageURI %>"/>
