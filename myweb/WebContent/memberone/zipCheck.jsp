<%@page import="memberone.ZipCodeVO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="dao" class="memberone.ZipCodeDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String check = request.getParameter("check"); // script.js의 zipCheck() 함수가 zipCheck.jsp?check=y 로 check 값 전달
	String dong = request.getParameter("dong");
	Vector<ZipCodeVO> zipcodeList = dao.zipcodeRead(dong); // 입력한 동이름(dong)으로 주소 데이터베이스에 있는 해당 값 리스트로 추출
	int totalList = zipcodeList.size();
%>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function sendAddress(zipcode, sido, gugun, dong, ri, bunji) {
		var address = sido + " " + gugun + " " + dong + " " + ri + " " + bunji;
		opener.document.regForm.zipcode.value = zipcode; // 회원가입 창의 zipcode에는 주소 검색창에서 선택한zipcode
		opener.document.regForm.address1.value = address; // 회원가입 창의 address1에는 주소 검색창에서 선택한 address(주소)
		self.close(); // 현재 창 (우편번호 검색 창) 닫기 
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<center>
		<b>우편번호 찾기</b>
		<form name="zipForm" method="post" action="zipCheck.jsp">
			<table>
				<tr>
					<td>동이름 입력 <input type="text" name="dong">
					<input type="button" value="검색" onClick="dongCheck()"/>
					</td>
				</tr>
			</table>
			<input type="hidden" name="check" value="n"> <!-- submit 할 때 check 값이 파라미터 값으로 함께 넘어감 -->
		</form>
		<table>
		<%
		if(check.equals("n")) {
		%>
			<%
				if(zipcodeList.isEmpty()) {
			%>
			<tr>
				<td align="center"><br>검색된 결과가 없습니다.</td>
			</tr>
			<%	} else {
			%>
			<tr>
				<td align="center"><br>※검색 후, 아래 우편번호를 클릭하시면 자동으로 입력됩니다.</td>
			</tr>
			<%
				for(int i=0;i<totalList;i++) {
					ZipCodeVO vo = zipcodeList.elementAt(i);
					String tempZipcode = vo.getZipcode();
					String tempSido = vo.getSido();
					String tempGugun = vo.getGugun();
					String tempDong = vo.getDong();
					String tempRi = vo.getRi();
					String tempBunji = vo.getBunji();
					if(tempRi == null) tempRi = " ";
					if(tempBunji == null) tempBunji = " ";
			%>
			<tr>
				<td>
					<a href="javascript:sendAddress('<%=tempZipcode %>','<%=tempSido %>','<%=tempGugun %>','<%=tempDong %>','<%=tempRi %>','<%=tempBunji %>')")>
					<%=tempZipcode %>&nbsp;<%=tempSido %>&nbsp;<%=tempGugun %>&nbsp;<%=tempDong %>&nbsp;<%=tempRi %>&nbsp;<%=tempBunji %></a><br>
			<%
				} //end for
			} //end else
			%>	
		<%
		} //end if
		%>
				</td>
			</tr>
			<tr>
				<td align="center"><a href="javascript:this.close();">닫기</a>
			</tr>
		</table>
	</center>
</body>
</html>