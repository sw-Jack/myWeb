package bbs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class VisitInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //한글 처리
		
		//client가 http 요청으로 전송한 값 읽기
		String writer = request.getParameter("writer");
		String memo = request.getParameter("memo");
		System.out.println("작성자 : " + writer);
		System.out.println("내용 : " + memo);
		
		//SQL
		StringBuffer sql = new StringBuffer();
		sql.append("insert into visit(no, writer, memo, regdate) ");
		sql.append("values(visit_seq.nextval, ?, ?, sysdate)");
		//DB와의 연결
		Connection con = null;
		PreparedStatement pstmt = null; //동적
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", 
												"jobclass","jobclass");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, writer);
			pstmt.setString(2, memo);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try{ if(pstmt != null) pstmt.close(); } catch(SQLException e) {}
			try{ if(con != null) con.close(); } catch(SQLException e) {}
		}
		response.sendRedirect("VisitList");
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
