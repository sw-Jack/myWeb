package jdbc;
import java.sql.*;
import java.util.*;

// Beans : DAO
public class tempMemberDAO {
	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jobclass";
	private final String PASS = "jobclass";
	
	public tempMemberDAO() {
		try {
			Class.forName(JDBC_DRIVER);
		} catch(Exception e) {
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	}
	
	public Vector<tempMemberVO> getMemberList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<tempMemberVO> vecList = new Vector<tempMemberVO>();
		
		try {
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			String strQuery = "select * from tempmember";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			while(rs.next() ) {
				tempMemberVO vo = new tempMemberVO();
				vo.setId(rs.getString("id"));
				vo.setPasswd(rs.getString("passwd"));
				vo.setName(rs.getString("name"));
				vo.setMem_num1(rs.getString("mem_num1"));
				vo.setMem_num2(rs.getString("mem_num2"));
				vo.setE_mail(rs.getString("e_mail"));
				vo.setPhone(rs.getString("phone"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress(rs.getString("address"));
				vo.setJob(rs.getString("job"));
				vecList.add(vo);
			} 
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception : " + e);
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(stmt != null) try {stmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return vecList;
	}
}
