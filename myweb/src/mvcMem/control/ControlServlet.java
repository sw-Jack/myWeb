package mvcMem.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControlServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String cmd = request.getParameter("cmd");
		if(cmd != null) {
			ActionFactory factory = ActionFactory.getInstance();
			Action action = factory.getAction(cmd);
			ActionForward actionForward = action.execute(request, response);
			if(actionForward.isRedirect()) {
				response.sendRedirect(actionForward.getUrl());
			} else {
				RequestDispatcher rd = request.getRequestDispatcher(actionForward.getUrl());
				rd.forward(request, response);

			}
		} else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head><title>Error</title></head>");
			out.println("<body>");
			out.println("<h4>�ùٸ� ��û�� �ƴմϴ�.</h4>");
			out.println("<h4>http://localhost:8181/mvc/test.mdo?cmd=��ûŰ����</h4>");
			out.println("</body>");
			out.println("</html>");
		}
	}
}
