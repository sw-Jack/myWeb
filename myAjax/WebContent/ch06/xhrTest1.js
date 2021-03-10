var xhrObject; // XMLHttpRequest 객체를 저장할 변수를 전역 변수로 선언
 
function createXHR() { // XMLHttpRequest 객체를 생성하는 메서드
	if(window.ActiveXObject) {
		xhrObject = new ActiveXObject("Microsoft.XMLHTTP");
	} else if(window.XMLHttpRequest) {
		xhrObject = new XMLHttpRequest();
	}
}

function startMethod() { // 클라이언트로부터 이벤트가 발생하면 실행되는 메서드
	createXHR(); // XMLHttpRequest 객체 생성
	xhrObject.onreadystatechange = resultProcess; // 응답 결과를 처리 메서드인 resultProcess() 메서드로 설정
	xhrObject.open("GET", "xhrTest1.xml", "true"); // 서버의 요청 설정
	xhrObject.send(null); // 서버로 요청 보냄
}

function resultProcess() { // 서버로부터 응답 결과가 오면 자동으로 실행
	if(xhrObject.readyState == 4) {
		if(xhrObject.status == 200) {
			document.getElementById("displayArea").innerHTML = xhrObject.responseText;
		}
	}
}