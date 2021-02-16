package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		//db에서 사용자 정보 조회
		//클라이언트의 정보를 HttpSession 객체에 유지
		/*
		String dbId = "admin";
		String dbPwd = "1234";
		if(dbId.equals(id) && dbPwd.equals(pwd)) {
			//HttpSession 객체 얻기
			HttpSession session = request.getSession();
			//클라이언트 정보를 HttpSession 객체에 저장
			session.setAttribute("user", id);
		}
		*/
		StringBuffer sql = new StringBuffer();
		sql.append("select id, pass from login");
		sql.append(" where id = ? and pass = ?");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
														"jobclass","jobclass");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1,id);
			pstmt.setNString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("user", id);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try{ if(pstmt != null) pstmt.close(); } catch(SQLException e) {}
			try{ if(con != null) con.close(); } catch(SQLException e) {}
		}
		response.sendRedirect("Login");
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
