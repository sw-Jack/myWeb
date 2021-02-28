<%@page import="boardone.BoardVO"%>
<%@page import="boardone.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="view/color.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 보기</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%
    // get 방식으로서 주소로 파라미터 값을 넘길 때 해당 값은 String, 정수 값이면 형 변환 필요
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try {
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO article = dbPro.getArticle(num); // 하나의 글 정보 가져오기
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
%>
<body bgcolor="<%=bodyback_c %>" align="center">
	<b>글 내용 보기</b>
	<br>
	<form>
		<table width="500" border="1" cellspacing="0" cellpadding="5" bgcolor="<%=bodyback_c %>" align="center">
			<tr height="30">
				<td align="center" width="125" bgcolor="<%=value_c %>">글 번호</td>
				<td align="center" width="125"><%=article.getNum() %></td>
				<td align="center" width="125" bgcolor="<%=value_c %>">조회수</td>
				<td align="center" width="125"><%=article.getReadcount() %></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="<%=value_c %>">작성자</td>
				<td align="center" width="125" align="center"><%=article.getWriter() %></td>
				<td align="center" width="125" bgcolor="<%=value_c %>">작성일</td>
				<td align="center" width="125"><%=sdf.format(article.getRegdate()) %></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="<%=value_c %>">글 제목</td>
				<td align="left" width="375" colspan="3"><%=article.getSubject() %></td>
			</tr>
			<tr height="30">
				<td align="center" width="125" bgcolor="<%=value_c %>">글 내용</td>
				<td align="left" width="375" colspan="3"><pre><%=article.getContent() %></pre></td>
			</tr>
			<tr height="30">
				<td colspan="4" bgcolor="<%=value_c %>" align="right">
					<input type="button" value="글수정" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
					<input type="button" value="글삭제" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum %>'">
					<input type="button" value="답글쓰기" onclick="document.location.href='writeForm.jsp?num=<%=num %>&ref=<%=ref %>&step=<%=step %>&depth=<%=depth %>'">
					<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum %>'">
					</td>
			</tr>
		</table>
<%
	} catch(Exception e) {}
%>
	</form>
</body>
</html>

























