<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta http-equiv="Refresh" content="1;url=member.mdo?cmd=login">
<title>delete process</title>
</head>
<body>
	<c:set var="result" value="${result }"/>
	<center>
	<c:if test="${result ==0 }">
		<script type="text/javascript">
			alert('비밀번호가 일치하지 않습니다.');
			history.go(-1);
		</script>
	</c:if>
	<font size="5" face="바탕체">
		회원정보가 삭제되었습니다.<br>
		안녕히 가세요.<br> 1초 후에 login page로 이동합니다.	
	</font>
	</center>
</body>
</html>