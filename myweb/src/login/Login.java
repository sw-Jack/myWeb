package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			HttpSession session = request.getSession(false);
			if(session != null) {
				String sessionId = session.getId();
				System.out.println("���� ���̵� : " + sessionId);
				String user = (String)session.getAttribute("user");
				out.println("<html>");
				out.println("<body>");
				out.println("<table border=1 width=300>");
				out.println("<tr>");
				out.println("<td width=300 align=center>" + user + "�� �α��� �Ǿ����ϴ�.</td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<td align=center>");
				out.println("<a href='#'>ȸ������</a>");
				out.println("<a href='Logout'>�α׾ƿ�</a>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			} else {
				out.println("<html>");
				out.println("<body>");	
				out.println("<form method='post' action='LoginCheck'>");
				out.println("<table border=1 width=300>");
				out.println("<tr>");
				out.println("<th width=100>���̵�</th>");
				out.println("<td width=200>&nbsp;<input type='text' name='id'></td>");
				out.println("</tr>");
				out.println("<tr>");
				out.println("<th width=100>��й�ȣ</th>");
				out.println("<td width=200>&nbsp;<input type='password' name='pwd'></td>");
				out.println("</tr>");
				out.println("<td align=center colspan=2>");
				out.println("<input type='button' value='ȸ������'>");
				out.println("<input type='submit' value='�α���'>");
				out.println("</td>");
				out.println("</tr>");
				out.println("</form>");
				out.println("</table>");
				out.println("</body>");
				out.println("</html>");
			}
		} finally {
			out.close();
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
}
