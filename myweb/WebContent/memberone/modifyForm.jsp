<%@page import="memberone.StudentDAO"%>
<%@page import="memberone.StudentVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="script.js"></script>
<%
	StudentDAO dao = StudentDAO.getInstance();
	String loginId = (String)session.getAttribute("loginId");
	StudentVO vo = dao.getMember(loginId);
%>
<body>
	<!-- 자바스크립트 함수에서 회원가입 form과 동일하게 적용되기 위해 form name을 regForm으로 동일하게 함 -->
	<form name="regForm" method="post" action="modifyProc.jsp">
		<table border="1">
			<tr>
				<td colspan="2" align="center">회원정보 수정</td>
			</tr>
			<tr>
				<td align="center">아이디</td>
				<td><%=vo.getId() %>
			</tr>
			<tr>
				<td align="center">패스워드</td>
				<td><input type="password" name="pass" value="<%=vo.getPass() %>"/></td>
			</tr>
			<tr>
				<td align="center">패스워드 확인</td>
				<td><input type="password" name="repass" value="<%=vo.getPass() %>"/></td>
			</tr>
			<tr>
				<td align="center">이름</td>
				<td><%=vo.getName() %>
			</tr>
			<tr>
				<td align="center">전화번호</td>
				<td>
					<input type="text" name="phone1" size="4" value="<%=vo.getPhone1() %>"/>
					<input type="text" name="phone2" size="5" value="<%=vo.getPhone2() %>"/>
					<input type="text" name="phone3" size="5" value="<%=vo.getPhone3() %>"/>
				</td>
			</tr>
			<tr>
				<td align="center">이메일</td>
				<td>
					<input type="text" name="email" value="<%=vo.getEmail() %>"/>
				</td>
			</tr>
			<tr>
				<td align="center">우편번호</td>
				<td>
					<input type="text" name="zipcode" value="<%=vo.getZipcode() %>"/>
					<input type="button" value="찾기" onClick="zipCheck()"/>
				</td>
			</tr>
			<tr>
				<td align="center">주소</td>
				<td>
					<input type="text" name="address1" size="50" value="<%=vo.getAddress1() %>"/>
				</td>
			</tr>
			<tr>
				<td align="center">상세주소</td>
				<td>
					<input type="text" name="address2" size="30" value="<%=vo.getAddress2() %>"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="정보수정" onClick="updateCheck()"/>&nbsp;&nbsp;
					<input type="button" value="취소" onClick="javascript:window.location='login.jsp'"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


























