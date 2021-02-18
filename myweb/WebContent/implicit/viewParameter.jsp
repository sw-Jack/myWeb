<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<body>
	<b>request.getParmeter() 메서드 사용</b><br>
	name 파라미터 = <%=request.getParameter("name") %><br>
	address 파라미터 = <%=request.getParameter("address") %><br>
	<br>
	<b>request.getParmeterValues() 메서드 사용</b><br>
	<%
		String[] values = request.getParameterValues("pet");
		if(values != null) {
			for(int i=0; i<values.length;i++) {
	%> 			
				<%=values[i] %>
	<%
			}
		}
	%>
	<br>
	<b>request.getParameterNames() 메서드 사용</b><br>
	<%
		Enumeration enumData = request.getParameterNames();
		while(enumData.hasMoreElements()) {
			//원래 Object 객체가 들어오기 때문에 String으로 형 변환
			String name = (String)enumData.nextElement();
	%>
			<%=name %>
	<%
		}
	%>
	<br>
	<b>request.getParameterMaps() 메서드 사용</b><br>
	<%
		Map parameterMap = request.getParameterMap();
		String[] nameParam = (String[])parameterMap.get("name");
		String[] addrParam = (String[])parameterMap.get("address");
		String[] petParam = (String[])parameterMap.get("pet");
		if(nameParam != null && addrParam != null && petParam != null) {
	%>	
			name = <%=nameParam[0] %> <br>
			address = <%=addrParam[0] %> <br>
			<%
				for(int i=0; i<petParam.length;i++) {
					out.println(petParam[i]);
			%>		<br>
			<%
				}
			%>
	<%
		}
	%>
</body>
</html>