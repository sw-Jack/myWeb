package mvcMem.control;

public class ActionForward {
	private String url;
	private boolean redirect;
	
	public ActionForward() {}
	
	public ActionForward(String url) {
		this.url = url;
	}
	
	public ActionForward(String url, boolean redirect) {
		this.url = url; // 이동할 페이지 주소
		this.redirect = redirect; // 페이지 이동 방법 (true : redirect, false : forward)
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
}
