<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="view/color.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<center>
	<b>글 삭제</b>
	<form method="post" name="delForm" action="/myweb/board/deleteProc.do" onsubmit="return deleteSave()">
		<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
			<tr height="30">
				<td align="center" bgcolor="${value_c }">
					<b>비밀번호를 입력해주세요.</b>
				</td>
			</tr>	
			<tr height="30">
				<td align="center">
					비밀번호
					<input type="password" name="pass" size="8" maxlength="12">
					<input type="hidden" name="num" value="${num }">
					<input type="hidden" name="pageNum" value="${pageNum }">
				</td>
			</tr>	
			<tr height="30">
				<td align="center" bgcolor="${value_c }">
					<input type="submit" value="글삭제">
					<input type="button" value="글목록" onclick="document.location.href='/myweb/board/list.do?pageNum=${pageNum}'">
				</td>
			</tr>	
			</table>
	</form>
</center>
</body>
</html>