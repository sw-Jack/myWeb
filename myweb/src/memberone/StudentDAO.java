package memberone;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;


// �̱��� ���� ����
public class StudentDAO {
	// [��� �ʵ�] : �ܺο��� �������� ���ϵ��� private
	private static StudentDAO instance = null; // Ŭ���� ��ü ����
	
	// [������] : �ܺο��� �������� ���ϵ��� private
	private StudentDAO() {}
	
	// [�޼���]
	// �ش� Ŭ���� ��ü ���� �޼���
	// �ܺο��� ��ü ���� �޼��带 ���ؼ��� �ش� Ŭ������ ������ �� �ֵ��� public static
	// �Ʒ��� ���� �̱��� ������ ����ϸ� useBean�� ������ �� ����
	public static StudentDAO getInstance() {
		if(instance == null) {
			synchronized (StudentDAO.class) {
				instance = new StudentDAO();
			}
		}
		return instance;
	}
	
	// DB Connect �޼���
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/myOracle");
			conn = ds.getConnection();
		} catch(Exception e) {
			System.err.println("Connection ���� ����");
		}
		return conn;
	}
	
	// ���̵� �ߺ� üũ �޼���
	public boolean idCheck(String id) {
		boolean isDup = true; // ���̵� �ߺ�
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from student where id=?");
			pstmt.setNString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) isDup = false; // ���̵� �ߺ� X, �ش� ���̵� ��� ������ ���� 
		} catch(SQLException e) {
			
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return isDup;
	}
	
	// ȸ�� ���� �޼���
	public boolean memberInsert(StudentVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false; // ȸ������ ����
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
			if(count > 0) flag = true; // ȸ������ ����
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
	
	// ��й�ȣ ������ �޼���
	public String getPass(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pass = null;
		try {
			conn = getConnection();
			String strQuery = "select pass from student where id = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString("pass");
			}
		} catch(Exception e) {
			System.out.println("Exception" + e); 
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return pass;
	}
	
	// �α��� üũ �޼��� : �α��� ���� : 1, ��й�ȣ ���� : 0, ���̵� ���� : -1 (check ����)
	public int loginCheck(String id, String pass) {
		String dbPass = getPass(id); // DB�� ����Ǿ� �ִ� ��й�ȣ
		int check = -1;
		if(dbPass == null) {
			check = -1; // ���̵� �������� �ʴ� ���
		} else {
			if(pass.equals(dbPass)) check = 1; // �α��� ����
			else check = 0; // ��й�ȣ ����
		}
		return check; // �α��� ���� ���� check ���� return
	}
	
	// ȸ�� ���� ������ �޼��� : ���� ������ ���ǿ� ���õ� ���̵� ���� �ش� ȸ���� ������ ����
	public StudentVO getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentVO vo = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from student where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new StudentVO();
				vo.setId(rs.getString("id"));
				vo.setPass(rs.getString("pass"));
 				vo.setName(rs.getString("name"));
				vo.setPhone1(rs.getString("phone1"));
				vo.setPhone2(rs.getString("phone2"));
				vo.setPhone3(rs.getString("phone2"));
				vo.setEmail(rs.getString("email"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress1(rs.getString("address1"));
				vo.setAddress2(rs.getString("address2"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return vo; // ���̵� ���� ������ �ش� vo ��ü return
	}
	
	// ȸ������ ���� �޼���
	public void updateMember(StudentVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update student set pass = ?, phone1 = ?, phone2 = ?, phone3 = ?, email = ?, zipcode = ?, address1 = ?, address2 = ? where id = ?");
			pstmt.setString(1, vo.getPass());
			pstmt.setString(2, vo.getPhone1());
			pstmt.setString(3, vo.getPhone2());
			pstmt.setString(4, vo.getPhone3());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getZipcode());
			pstmt.setString(7, vo.getAddress1());
			pstmt.setString(8, vo.getAddress2());
			pstmt.setString(9, vo.getId());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
	}
	
	// ȸ��Ż�� = ȸ�� ���� �޼���
	public int deleteMember(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = getPass(id); // DB�� ����� ��й�ȣ
		int result = -1; // ���ġ
		try {
			if (dbPass.equals(pass)) { // true - ���� Ȯ��
				conn = getConnection();
				pstmt = conn.prepareStatement("delete from student where id = ?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				result = 1; // ȸ��Ż�� ����
			} else { // ���� Ȯ�� ���� - ��й�ȣ ����
				result = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return result;
	}
}





































