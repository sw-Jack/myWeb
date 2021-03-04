<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="actiontag.Customer, java.util.HashMap"%>
<%
	Customer customer = new Customer();
	customer.setName("손흥민");
	customer.setEmail("sonny@naver.com");
	customer.setPhone("010-2222-3333");
	request.setAttribute("customer", customer);
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("name", "G80");
	map.put("maker", "현대자동차");
	request.setAttribute("car", map);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Tag Example</title>
</head>
<body>
	<ul>
		<li>${customer.name }</li>
		<li>${customer.email }</li>
		<li>${customer.phone }</li>
		<li>${car.name }</li>
		<li>${car.maker }</li>
	</ul>
</body>
</html>