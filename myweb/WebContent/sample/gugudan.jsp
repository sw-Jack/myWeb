<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>
</head>
<body>
	<h3 align="center">&lt구구단 표&gt</h3>
	<table align="center" border="1" width="800px" height="400px">
		<%for(int i=0;i<10;i++) { %>
			<tr align="center">
				<% for(int j=2;j<10;j++) { %>
					<% if(i==0) { %>
						<td>&lt<%=j %>단&gt</td>
					<%} else {%>
						<td><%=j %> * <%=i %> = <%=j*i %></td>
					<%} %>	
				<%} %>
			</tr>
		<%} %>
	</table>
</body>
</html>