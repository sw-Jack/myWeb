package jdbc;
import java.sql.*;
import java.util.*;

// Connection Pool (free / used) �̿��� ������ ���̽� ����
public final class ConnectionPool {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private ArrayList<Connection> free;	// ������, ������� ���� Ŀ�ؼ�, �� �ʱ� Ŀ�ؼ��� ����
	private ArrayList<Connection> used; // ������ ��� ���� Ŀ�ؼ� ����
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jobclass";
	private String password = "jobclass";
	
	private int initialCons = 10; // ���ʷ� ������ Ŀ�ؼ� ��
	private int maxCons = 20; // �ִ� Ŀ�ؼ� ��
	private int numCons = 0; // �� Ŀ�ؼ� ��
	private static ConnectionPool cp;
	
	// �̱��� ���� ����
	public static ConnectionPool getInstance() throws SQLException {
		if(cp == null) {
			synchronized (ConnectionPool.class) {
				cp = new ConnectionPool();
			}
		}
		return cp;
	}
	
	// Ŀ�ؼ� Ǯ ������
	private ConnectionPool() throws SQLException {
		// �ʱ� Ŀ�ؼ� ������ ������ ArrayList�� ������ �� �ֵ��� Ŀ�ؼ� ����ŭ ArrayList ����
		free = new ArrayList<Connection>(initialCons);
		used = new ArrayList<Connection>(initialCons);
		// initialCons ����ŭ Connection ����(free)
		while(numCons < initialCons) {
			addConnection();
		}
	}
	
	// free Ŀ�ؼ� ��ü�� ����
	private void addConnection() throws SQLException {
		free.add(getNewConnection());
	}
	
	// ���ο� Ŀ�ؼ� ����
	private Connection getNewConnection() throws SQLException {
		Connection con = null;
		try {
			con = DriverManager.getConnection(url, user, password);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println("About to connect to " + con);
		++numCons; // Ŀ�ؼ��� ������ ������ ���� ����
		return con;
	}
	
	// free�� �ִ� Ŀ�ؼ��� used�� �ű�� �۾�
	public synchronized Connection getConnection() throws SQLException {
		// free�� Connection�� ������ maxCons��ŭ Ŀ�ؼ��� �� ����
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
	
	// used�� �ִ� Ŀ�ؼ��� free�� �ݳ�
	public synchronized void releaseConnection(Connection _con) throws SQLException {
		boolean flag = false;
		if(used.contains(_con)) {
			used.remove(_con);
			numCons--;
			flag = true;
		} else {
			throw new SQLException("ConnectinoPool�� ���� �ʳ׿�!!");
		}
		try {
			if(flag) { // used���� free�� �ݳ��� �̷��������
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













