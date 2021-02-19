<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	
	//String message = request.getParameter("message");
%>
<!-- SimpleData msg = new SimpleData(); 와 같이 객체 생성하는 것과 동일 -->
<jsp:useBean id="msg" class="sample.SimpleData"/>
<!-- msg.setMessage(?); form 페이지의 form 태그에 입력한 message 값을 받아와  set -->
<jsp:setProperty name="msg" property="message"/>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>간단한 빈즈 프로그램 결과</h1>
	<hr color="red"></hr><br><br>
	<font size="5">
		<!-- setProperty 한 결과 get해서 가져오기 -->
		<%-- <%=message%> 와 동일 --%>
		메세지 : <jsp:getProperty name="msg" property="message"/>
	</font>
</body>
</html>