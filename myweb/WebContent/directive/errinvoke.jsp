<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- web.xml 파일의 error-page로 아래 부분에 대한 오류(500 에러) 처리--> 
<%--<%@ page errorPage="/direct/directive_err.jsp" %>--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 출력</title>
</head>
<body>

	name 파리미터 값 :
	
	<!-- 오류 발생 부분-->
	<%=request.getParameter("name").toUpperCase() %>
</body>
</html>