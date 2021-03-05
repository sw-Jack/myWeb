package mvcMem.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import memberone.StudentVO;
import memberone.ZipCodeVO;
import mvcMem.control.Action;
import mvcMem.control.ActionForward;
import mvcMem.model.ZipCodeDAO;

public class ZipCheckAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		ZipCodeDAO dao = ZipCodeDAO.getInstance();
		String check = request.getParameter("check");
		String dong = request.getParameter("dong");
		Vector<ZipCodeVO> zipcodeList = dao.zipcodeRead(dong);
		int totalList = zipcodeList.size();
		request.setAttribute("check", check);
		request.setAttribute("dong", dong);
		request.setAttribute("zipcodeList", zipcodeList);
		request.setAttribute("totalList", totalList);
		return new ActionForward("/mvcMem/zipCheck.jsp", false); // forward
	}
}
