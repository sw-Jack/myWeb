<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="actiontag.Customer, java.util.ArrayList"%>
<!DOCTYPE html>
<%
	ArrayList<String> singer = new ArrayList<String>();
	singer.add("소녀시대");
	singer.add("원더걸스");
	request.setAttribute("singer", singer);
	
	Customer[] customer = new Customer[2];
	customer[0] = new Customer();
	customer[0].setName("손흥민");
	customer[0].setEmail("s@naver.com");
	customer[0].setPhone("010-2222-2222");
	
	customer[1] = new Customer();
	customer[1].setName("이강인");
	customer[1].setEmail("lee@naver.com");
	customer[1].setPhone("010-3333-1111");
	request.setAttribute("customer", customer);
%>
<html>
<head>
<meta charset="UTF-8">
<title>EL Tag Example</title>
</head>
<body>
	<ul>
		<li>${singer[0] }, ${singer[1] }</li>
	</ul>
	<ul>
		<li>이름 : ${customer[0].name }</li>
		<li>메일 : ${customer[0].email }</li>
		<li>전화 : ${customer[0].phone }</li>
	</ul>
	<ul>
		<li>이름 : ${customer[1].name }</li>
		<li>메일 : ${customer[1].email }</li>
		<li>전화 : ${customer[1].phone }</li>

	</ul>

</body>
</html>











