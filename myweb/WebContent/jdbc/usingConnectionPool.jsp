<%@page import="java.sql.*, jdbc.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//Class.forName("oracle.jdbc.driver.OracleDriver");
	ConnectionPool pool = ConnectionPool.getInstance(); // 커넥션 풀 객체 생성
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String id = "",
			passwd = "",
			name = "",
			mem_num1 = "",
			mem_num2 = "",
			e_mail = "",
			phone = "",
			zipcode = "",
			address = "",
			job = "";
	int counter = 0;
	try {
		//conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
							//"jobclass","jobclass");
		conn = pool.getConnection(); // 커넥션 풀에서 커넥션 가져오기 (해당 커넥션을 free 풀에서 used 풀로 가져와 사용)
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from tempmember");
%>
<html>
<head>
<meta charset="UTF-8">
<title>JSP에서 데이터베이스 연동</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<h2>JSP 스크립틀릿에서의 데이터베이스 연동 예제</h2><br><br>
	<h3>회원정보</h3>
	<table bordercolor="#0000ff" border="1">
		<tr>
			<td><strong>ID</strong></td>
			<td><strong>PASSWD</strong></td>
			<td><strong>NAME</strong></td>
			<td><strong>MEM_NUM1</strong></td>
			<td><strong>MEM_NUM2</strong></td>
			<td><strong>E_MAIL</strong></td>
			<td><strong>PHONE</strong></td>
			<td><strong>ZIPCODE</strong></td>
			<td><strong>ADDRESS</strong></td>
			<td><strong>JOB</strong></td>
		</tr>
		<%
			if(rs != null) {
				while(rs.next()) {
					id = rs.getString("id");
					passwd = rs.getString("passwd");
					name = rs.getString("name");
					mem_num1 = rs.getString("mem_num1");
					mem_num2 = rs.getString("mem_num2");
					e_mail = rs.getString("e_mail");
					phone = rs.getString("phone");
					zipcode = rs.getString("zipcode");
					address = rs.getString("address");
					job = rs.getString("job");
		%>
		<tr>
		<td><%=id %></td>
		<td><%=passwd %></td>
		<td><%=name %></td>
		<td><%=mem_num1 %></td>
		<td><%=mem_num2 %></td>
		<td><%=e_mail %></td>
		<td><%=phone %></td>
		<td><%=zipcode %></td>
		<td><%=address %></td>
		<td><%=job %></td>
		</tr>
		<%
					counter++;
				} //end while
			}// end if
		%>
	</table> <br><br>
	total records : <%=counter %>
	<%
	} catch(SQLException e) {
		e.printStackTrace();
		System.out.println("SQL Exception");
	} catch(Exception e) {
		e.printStackTrace();
		System.out.println("Exception");
	} finally {
		if(rs != null) {
			try{rs.close();}
			catch(SQLException ee) {}
		}
		if(stmt != null) {
			try{stmt.close();}
			catch(SQLException ee) {}
		}
		if(conn != null) {
			try{pool.releaseConnection(conn);} // 사용했던 커넥션 반납 (used -> free)
			catch(Exception ee) {}
		}
	}
	%>
</body>
</html>



























