package memberone;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class StudentDAO {
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myOracle");
			conn = ds.getConnection();
		} catch(Exception e) {
			System.err.println("Connection 생성 실패");
		}
		return conn;
	}
	
	// 아이디 중복 체크 메서드
	public boolean idCheck(String id) {
		boolean isDup = true; // 아이디 중복
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from student where id=?");
			pstmt.setNString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) isDup = false; // 아이디 중복 X, 해당 아이디 사용 가능한 상태 
		} catch(SQLException e) {
			
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return isDup;
	}
	
	// 회원 가입 메서드
	public boolean memberInsert(StudentVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false; // 회원가입 실패
		try {
			conn = getConnection();
			String strQuery = "insert into student values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone1());
			pstmt.setString(5, vo.getPhone2());
			pstmt.setString(6, vo.getPhone3());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getZipcode());
			pstmt.setString(9, vo.getAddress1());
			pstmt.setString(10, vo.getAddress2());
			int count = pstmt.executeUpdate();
			if(count > 0) flag = true; // 회원가입 성공
		} catch(Exception e) {
			e.printStackTrace();
			System.err.println("Exception" + e);
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return flag;
	}
}
