function log(msg) {
	var console = document.getElementById("debugConsole");
	if(console != null) {
		console.innerHTML += msg + "<br>";
	}
}