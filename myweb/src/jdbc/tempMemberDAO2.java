package jdbc;
import java.sql.*;
import java.util.*;
import jdbc.tempMemberVO;

public class tempMemberDAO2 {
	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "jobclass";
	private final String PASS = "jobclass";
	private ConnectionPool pool = null;
	
	public tempMemberDAO2() {
		try {
			pool = ConnectionPool.getInstance(); // 커넥션 풀 객체 얻어오기
		} catch(Exception e) {
			System.out.println("Error : 커넥션 얻어오기 실패");
		}
	}
	
	public Vector<tempMemberVO> getMemberList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector<tempMemberVO> vecList = new Vector<tempMemberVO>();
		
		try {
			conn = pool.getConnection(); // 커넥션 free -> used
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
			if(conn != null) try {pool.releaseConnection(conn);} catch(SQLException e) {}
		}
		return vecList;
	}
}
