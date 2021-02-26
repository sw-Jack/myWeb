<%@page import="boardone.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String pass = request.getParameter("pass");
	BoardDAO dbPro = BoardDAO.getInstance();
	int check = dbPro.deleteArticle(num, pass);
	if(check == 1) { // 삭제 성공한 경우
%>
	<script type="text/javascript">
		alert("게시글이 삭제되었습니다.")
	</script>
		<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<%	} else { %>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1);
	</script>
<%	} %>