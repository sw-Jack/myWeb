// 게시판 자바스크립트 함수
// 글쓰기 입력란 체크 함수
function writeSave() {
	if(document.writeForm.writer.value == "") {
		alert("작성자를 입력하세요.");
		document.writeForm.writer.focus();
		return false;
	}
	if(document.writeForm.email.value == "") {
		alert("이메일을 입력하세요.");
		document.writeForm.email.focus();
		return false;
	}
	if(document.writeForm.subject.value == "") {
		alert("제목을 입력하세요.");
		document.writeForm.subject.focus();
		return false;
	}
	if(document.writeForm.content.value == "") {
		alert("내용을 입력하세요.");
		document.writeForm.content.focus();
		return false;
	}
	if(document.writeForm.pass.value == "") {
		alert("비밀번호를 입력하세요.");
		document.writeForm.pass.focus();
		return false;
	}
}

// 게시글 삭제 비밀번호 입력 체크 함수
function deleteSave() {
	if(document.delForm.pass.value == "") {
		alert("비밀번호를 입력하세요.");
		document.delForm.pass.focus();
		return false;
	}
}