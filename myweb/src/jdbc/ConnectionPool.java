package jdbc;
import java.sql.*;
import java.util.*;

// Connection Pool (free / used) 이용해 데이테 베이스 연동
public final class ConnectionPool {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private ArrayList<Connection> free;	// 생성된, 사용하지 않은 커넥션, 즉 초기 커넥션을 저장
	private ArrayList<Connection> used; // 실제로 사용 중인 커넥션 저장
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jobclass";
	private String password = "jobclass";
	
	private int initialCons = 10; // 최초로 생성된 커넥션 수
	private int maxCons = 20; // 최대 커넥션 수
	private int numCons = 0; // 총 커넥션 수
	private static ConnectionPool cp;
	
	// 싱글톤 패턴 적용
	public static ConnectionPool getInstance() throws SQLException {
		if(cp == null) {
			synchronized (ConnectionPool.class) {
				cp = new ConnectionPool();
			}
		}
		return cp;
	}
	
	// 커넥션 풀 생성자
	private ConnectionPool() throws SQLException {
		// 초기 커넥션 개수를 각각의 ArrayList에 저장할 수 있도록 커넥션 수만큼 ArrayList 생성
		free = new ArrayList<Connection>(initialCons);
		used = new ArrayList<Connection>(initialCons);
		// initialCons 수만큼 Connection 생성(free)
		while(numCons < initialCons) {
			addConnection();
		}
	}
	
	// free 커넥션 객체를 저장
	private void addConnection() throws SQLException {
		free.add(getNewConnection());
	}
	
	// 새로운 커넥션 생성
	private Connection getNewConnection() throws SQLException {
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println("About to connect to " + con);
		++numCons; // 커넥션이 생성될 때마다 숫자 증가
		return con;
	}
	
	// free에 있는 커넥션을 used로 옮기는 작업
	public synchronized Connection getConnection() throws SQLException {
		// free에 Connection이 없으면 maxCons만큼 커넥션을 더 생성
		if(free.isEmpty()) {
			while(numCons < maxCons) {
				addConnection();
			}
		}
		Connection _con;
		_con = free.get(free.size()-1);
		free.remove(_con);
		used.add(_con);
		return _con;
	}
	
	// used에 있는 커넥션을 free로 반납
	public synchronized void releaseConnection(Connection _con) throws SQLException {
		boolean flag = false;
		if(used.contains(_con)) {
			used.remove(_con);
			numCons--;
			flag = true;
		} else {
			throw new SQLException("ConnectinoPool에 있지 않네요!!");
		}
		try {
			if(flag) { // used에서 free로 반납이 이루어졌으면
				free.add(_con);
				numCons++;
			} else {
				_con.close();
			}
		} catch(SQLException e) {
			try {
				_con.close();
			} catch(SQLException ee) {
				ee.printStackTrace();
			}
		}
	}
	
	public int getMaxCons() {
		return maxCons;
	}
	
	public int getNumCons() {
		return numCons;
	}
}













