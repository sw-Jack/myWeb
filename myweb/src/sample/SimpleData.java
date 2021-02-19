package sample;

//java Bean = 클래스
public class SimpleData {
	//멤버 변수 : form 태그의 name, bean 액션 태그의 property와 동일
	private String message; 
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String getMessage() {
		return message;
	}
}
