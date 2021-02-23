package memberone;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ZipCodeDAO {
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
	
	public Vector<ZipCodeVO> zipcodeRead(String dong) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipCodeVO> vecList = new Vector<ZipCodeVO>();
		try {
			conn = getConnection();
			String strQuery = 
					"select * from zipcode where dong like '" + dong + "%'";
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZipCodeVO vo = new ZipCodeVO();
				vo.setZipcode(rs.getString("zipcode"));
				vo.setSido(rs.getString("sido"));
				vo.setGugun(rs.getString("gugun"));
				vo.setDong(rs.getString("dong"));
				vo.setRi(rs.getString("ri"));
				vo.setBunji(rs.getString("bunji"));
				vecList.add(vo);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return vecList;
	} 
}
