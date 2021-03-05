package mvcMem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvcMem.control.Action;
import mvcMem.control.ActionForward;

public class LogoutAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.invalidate(); // session ¹«È¿È­
		return new ActionForward("/mvcMem/logout.jsp", false); // forward
	}
}
