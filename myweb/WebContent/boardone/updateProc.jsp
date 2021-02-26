<%@page import="boardone.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="article" scope="page" class="boardone.BoardVO">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	String pageNum = request.getParameter("pageNum");
	BoardDAO dbPro = BoardDAO.getInstance();
	int check = dbPro.updateArticle(article);
	if(check == 1) { // 수정에 성공한 경우
%>
	<script type="text/javascript">
		alert("게시글이 수정되었습니다.");
	</script>
		<meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<%	} else { %>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.");
		history.go(-1); // 이전 페이지로 이동
	</script>
<% } %>