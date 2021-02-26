<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="boardone.BoardDAO" %>
<%@ page import="boardone.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>

<%
	// 수정1
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	// 수정 2
	int count = 0;
	int number = 0;
	List<BoardVO> articleList = null;
	BoardDAO dbPro = BoardDAO.getInstance();
	count = dbPro.getArticleCount(); // 전체 글 개수
	if(count > 0) {
		articleList = dbPro.getArticles();
	}
	number = count; // 전체 글 개수 
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c %>">
	<center>
		<b>글 목록(전체 글 : <%=count %>)</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="<%=value_c %>">
					<a href="writeForm.jsp">글쓰기</a>
				</td>
			</tr>
		</table>
		<% if(count == 0) { %>
			<table width="700" border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		<% } else { %>
			<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
				<tr height="30" bgcolor="<%=bodyback_c %>">
					<td align="center" width="50">번호</td>
					<td align="center" width="250">제   목</td>
					<td align="center" width="100">작성자</td>
					<td align="center" width="150">작성일</td>
					<td align="center" width="50">조회</td>
					<td align="center" width="100">IP</td>
				</tr>
				<% for(int i=0; i<articleList.size(); i++) {
					BoardVO article = (BoardVO)articleList.get(i);
				%>
					<tr height="30">
						<td align="center" width="50"><%=number-- %></td>
						<td width="250">
						<!-- 수정5 -->
						&nbsp;<a href="content.jsp?num=<%=article.getNum() %>&pageNum=1">
						<!-- 수정6 -->
						<%=article.getSubject() %></a>
						<% if(article.getReadcount() >= 20) { %>
							<img src="image/hot.gif" border="0" height="16">
						<%} %>
						</td>
						<td align="center" width="100">
							<a href="mailto:<%=article.getEmail() %>">
								<%=article.getWriter() %></a>
						</td>
						<td align="center" width="150">
							<%=sdf.format(article.getRegdate()) %>
						</td>
						<td align="center" width="50"><%=article.getReadcount() %></td>
						<td align="center" width="100"><%=article.getIp() %></td>
					</tr>
				<% } %>
			</table>
			<% } %>
			<!-- 수정 7 -->
	</center>
</body>
</html>




























