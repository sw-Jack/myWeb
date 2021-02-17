<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP File</title>
</head>
<body>
	<h2>JSP Script 예제</h2>
	<hr><br>
	<% //Scriptlet : 연산, 처리  / 변수 선언 시 지역 변수로 적용
		String scriptlet = "스크립틀릿입니다";
		String comment = "주석입니다";
		out.println("내장 객체를 이용한 출력 : " + declation + "<br><br>");
	%>
	
	선언문 출력하기(변수) : <%=declation%><br><br>
	선언문 출력하기(메서드) : <%=declationMethod()%><br><br>
	스크립틀릿 출력하기 : <%=scriptlet%><br><br>
	<!-- JSP에서 사용하는 HTML 주석 부분 -->
	<!-- HTML 주석 : <%=comment%> --><br><br>
	<%-- JSP 주석 : <%=comment%> --%><br><br>
	<%
		//자바 주석
		/*
			여러줄 주석
		*/
	%>
	<%! //declation = 변수 선언
		String declation = "선언문입니다";
	%>
	<%! //declation = 메서드 선언 
		public String declationMethod() {
			return declation;
		}
	%>
	
</body>
</html>