package mvcMem.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvcMem.control.Action;
import mvcMem.control.ActionForward;
import mvcMem.model.StudentDAO;
import mvcMem.model.StudentVO;

public class ModifyProcAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String loginID = (String)session.getAttribute("loginID"); // session�� ��ü�� ��ȯ�ϱ� ������ String����  �� ��ȯ
		StudentDAO dao = StudentDAO.getInstance();
		StudentVO vo = new StudentVO(
				loginID,
				request.getParameter("pass"),
				request.getParameter("name"),
				request.getParameter("phone1"),
				request.getParameter("phone2"),
				request.getParameter("phone3"),
				request.getParameter("email"),
				request.getParameter("zipcode"),
				request.getParameter("address1"),
				request.getParameter("address2")
				);
		dao.updateMember(vo);
		return new ActionForward("/mvcMem/modifyProc.jsp", false);
	}
}
