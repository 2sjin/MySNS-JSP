package util;
import java.sql.*;
import javax.naming.NamingException;

public class UserDAO {
	// INSERT
	public boolean insert(String uid, String upass, String uname) throws NamingException, SQLException {
		// �����ͺ��̽� Ŀ�ؼ� Ǯ ȣ��
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		
		try {
			// SQL�� ���� PreparedStatement ��ü ����
			String sql = "INSERT INTO user(id, password, name) VALUES(?,?,?)";
			stmt = conn.prepareStatement(sql);
				
			stmt.setString(1, uid);
			stmt.setString(2, upass);
			stmt.setString(3, uname);
			
			// SQL ����
			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;
		} finally {
			// JDBC ��ü ���� ����
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
	}
	
	// DELETE
	public boolean delete(String uid) throws NamingException, SQLException {
		// �����ͺ��̽� Ŀ�ؼ� Ǯ ȣ��
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		
		try {
			// SQL�� ���� PreparedStatement ��ü ����
			String sql = "DELETE FROM user WHERE id=?";
			stmt = conn.prepareStatement(sql);		
			stmt.setString(1, uid);
			
			// SQL ����
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} 
		
		finally {
			// JDBC ��ü ���� ����
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
	}
	
	// EXISTS
	public boolean exists(String uid) throws NamingException, SQLException {
		// �����ͺ��̽� Ŀ�ؼ� Ǯ ȣ��
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		try {
			// SQL�� ���� PreparedStatement ��ü ����
			String sql = "SELECT id FROM user WHERE id=?";
			stmt = conn.prepareStatement(sql);		
			stmt.setString(1, uid);
			
			// SELECT �� Ʃ���� �����ϸ� true, ������ false ����
			result = stmt.executeQuery();			
			return result.next();
		} 
		
		finally {
			// JDBC ��ü ���� ����
			if (result != null) result.close();
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
	}
}
