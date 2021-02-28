<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="view/color.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>My Board</title>
<link href="style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="script.js">
</script>
</head>
<%
	int num = 0, ref = 1, step = 0, depth = 0;
	try {
		if(request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			step = Integer.parseInt(request.getParameter("step"));
			depth = Integer.parseInt(request.getParameter("depth"));
		}
%>
<body bgcolor="<%=bodyback_c %>" align="center">
	<b>글쓰기</b>
	<form method="post" name="writeForm" action="writeProc.jsp" onsubmit="return writeSave()"> <!-- onsubmit은 submit 이전에 먼저 수행 -->
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="ref" value="<%=ref %>">
		<input type="hidden" name="step" value="<%=step %>">
		<input type="hidden" name="depth" value="<%=depth %>">
		<table width="450" border="1" cellpadding="0" cellspacing="0" align="center" bgcolor="<%=bodyback_c %>">
			<tr>
				<td align="right" colspan="2" bgcolor="<%=value_c %>">
					<a href="list.jsp">글목록</a>
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="<%=value_c %>" align="center">이름</td>
				<td width="330" align="left">
					<input type="text" size="12" maxlength="12" name="writer"/>
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="<%=value_c %>" align="center">이메일</td>
				<td width="330" align="left">
					<input type="text" size="30" maxlength="30" name="email"/>
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="<%=value_c %>" align="center">제목</td>
				<td width="330" align="left">
					<% if(request.getParameter("num") == null) { // 새 글인 경우 %> 
						<input type="text" size="55" maxlength="50" name="subject"/>
					<% } else { // 답변 글인 경우 %> 
						<input type="text" size="55" maxlength="50" name="subject" value="[답변]"/>
					<% } %>
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="<%=value_c %>" align="center">내용</td>
				<td width="330" align="left">
					<textarea name="content" rows="15" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td width="100" bgcolor="<%=value_c %>" align="center">비밀번호</td>
				<td width="330" align="left">
					<input type="password" size="10" maxlength="10" name="pass"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" bgcolor="<%=value_c %>" align="center">
					<input type="submit" value="글쓰기"/>
					<input type="reset" value="다시작성"/>
					<input type="button" value="목록" onClick="window.location='list.jsp'">
				</td>
		</table>
	</form>
<%
	} catch(Exception e) {}
%>
</body>
</html>