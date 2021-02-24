package memberone;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;


// 싱글톤 패턴 적용
public class StudentDAO {
	// [멤버 필드] : 외부에서 접근하지 못하도록 private
	private static StudentDAO instance = null; // 클래스 객체 생성
	
	// [생성자] : 외부에서 접근하지 못하도록 private
	private StudentDAO() {}
	
	// [메서드]
	// 해당 클래스 객체 생성 메서드
	// 외부에서 객체 생성 메서드를 통해서만 해당 클래스에 접근할 수 있도록 public static
	// 아래와 같이 싱글톤 패턴을 사용하면 useBean을 생성할 수 없음
	public static StudentDAO getInstance() {
		if(instance == null) {
			synchronized (StudentDAO.class) {
				instance = new StudentDAO();
			}
		}
		return instance;
	}
	
	// DB Connect 메서드
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
	
	// 비밀번호 얻어오는 메서드
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
	
	// 로그인 체크 메서드 : 로그인 성공 : 1, 비밀번호 오류 : 0, 아이디 없음 : -1 (check 변수)
	public int loginCheck(String id, String pass) {
		String dbPass = getPass(id); // DB에 저장되어 있는 비밀번호
		int check = -1;
		if(dbPass == null) {
			check = -1; // 아이디가 존재하지 않는 경우
		} else {
			if(pass.equals(dbPass)) check = 1; // 로그인 성공
			else check = 0; // 비밀번호 오류
		}
		return check; // 로그인 성공 여부 check 변수 return
	}
	
	// 회원 정보 얻어오는 메서드 : 정보 수정시 세션에 셋팅된 아이디를 통해 해당 회원의 정보를 얻어옴
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
		return vo; // 아이디를 통해 가져온 해당 vo 객체 return
	}
	
	// 회원정보 수정 메서드
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
	
	// 회원탈퇴 = 회원 삭제 메서드
	public int deleteMember(String id, String pass) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = getPass(id); // DB에 저장된 비밀번호
		int result = -1; // 결과치
		try {
			if (dbPass.equals(pass)) { // true - 본인 확인
				conn = getConnection();
				pstmt = conn.prepareStatement("delete from student where id = ?");
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				result = 1; // 회원탈퇴 성공
			} else { // 본인 확인 실패 - 비밀번호 오류
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





































