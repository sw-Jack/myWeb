<!-- contentType을 아래와 같이 지정하여 실행 시 Excel에서 화면을 띄우도록 함 : 엑셀 문서로 지정 -->
<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2월 급여 명세서</title>
</head>
<% 
	// MS excel로 다운로드/실행, filename에 저장될 파일명을 적어준다.
	response.setHeader("Content-Type", "application/vnd.ms-xls");	
	response.setHeader("Content-Disposition", "attachment; filename=test.xls"); 
	response.setHeader("Content-Description", "JSP Generated Data");
	response.setHeader("Pragma", "public");
	response.setHeader("Cache-Control", "max-age=0");
%>
<body>
	<table>
		<tr>
			<th colspan="3">2월 급여 명세서</th>
		</tr>
		<tr>
			<th>이름</th><th>직책</th><th>급여(단위 :만원)</th>
		</tr>
		<tr>
			<td>유재석</td><td>부장</td><td>600</td>
		</tr>
		<tr>
			<td>강호동</td><td>부장</td><td>500</td>
		</tr>
		<tr>
			<td>박나래</td><td>과장</td><td>450</td>
		</tr>
		<tr>
			<td>조세호</td><td>대리</td><td>350</td>
		</tr>
	</table>	
</body>
</html>