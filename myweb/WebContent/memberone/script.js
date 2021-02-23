// 아이디 중복 체크
function idCheck(id) {
	if(id == "") {
		alert("아이디를 입력하세요.");
		document.regForm.id.focus();
	} else {
		url = "idCheck.jsp?id=" + id;
		window.open(url,"post","width=300, height=150");
	}
}

// 우편번호 체크 
function zipCheck() {
	url = "zipCheck.jsp?check=y";
	window.open(url, "post", "toolbar=no, width=500, height=300, directories=no, status=yes, scrollbars=yes, menubar=no");	
}

// 동이름 입력 체크
function dongCheck() {
	if(document.zipForm.dong.value == "") {
		alert("동이름을 입력하세요.");
		document.zipForm.dong.focus();
		return;
	} 
	document.zipForm.submit();
}