<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="view/color.jsp" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 삭제</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="<%=bodyback_c %>" align="center">
	<b>게시글 삭제</b>
	<br>
	<form method="post" name="delForm" action="deleteProc.jsp?pageNum=<%=pageNum %>" onsubmit="return deleteSave()">
		<table border="1" align="center" cellspacing="0" cellpadding="5" width="360">
			<tr height="30">
				<td align="center" bgcolor="<%=value_c %>">
					<b>비밀번호를 입력해주세요.</b>
				</td>
			</tr>
			<tr height="30">
				<td align="center">비밀번호
					<input type="password" name="pass" size="8" maxlength="12">
					<input type="hidden" name="num" value="<%=num %>">
				</td>
			</tr>
			<tr height="30">
				<td align="center" bgcolor="<%=value_c %>">
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>