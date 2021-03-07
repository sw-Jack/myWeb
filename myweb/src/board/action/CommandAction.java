package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//다형성을 활용해 명령어를 처리하는 슈퍼 인터페이스
//요청 파라미터로 명령어를 전달하는 방식의 슈퍼 인터페이스
//해당 인터페이스에서 각 기능의 Action 클래스로 뻗어 나감
public interface CommandAction {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable;
}
