package util;
import java.sql.*;
import javax.naming.NamingException;

public class UserDAO {
	// INSERT
	public boolean insert(String uid, String upass, String uname) throws NamingException, SQLException {
		// 데이터베이스 커넥션 풀 호출
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		
		try {
			// SQL을 위한 PreparedStatement 객체 생성
			String sql = "INSERT INTO user(id, password, name) VALUES(?,?,?)";
			stmt = conn.prepareStatement(sql);
				
			stmt.setString(1, uid);
			stmt.setString(2, upass);
			stmt.setString(3, uname);
			
			// SQL 실행
			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;
		} finally {
			// JDBC 객체 연결 해제
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
	}
	
	// DELETE
	public boolean delete(String uid) throws NamingException, SQLException {
		// 데이터베이스 커넥션 풀 호출
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		
		try {
			// SQL을 위한 PreparedStatement 객체 생성
			String sql = "DELETE FROM user WHERE id=?";
			stmt = conn.prepareStatement(sql);		
			stmt.setString(1, uid);
			
			// SQL 실행
			int count = stmt.executeUpdate();
			return (count > 0) ? true : false;
		} 
		
		finally {
			// JDBC 객체 연결 해제
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
	}
	
	// EXISTS
	public boolean exists(String uid) throws NamingException, SQLException {
		// 데이터베이스 커넥션 풀 호출
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		try {
			// SQL을 위한 PreparedStatement 객체 생성
			String sql = "SELECT id FROM user WHERE id=?";
			stmt = conn.prepareStatement(sql);		
			stmt.setString(1, uid);
			
			// SELECT 후 튜플이 존재하면 true, 없으면 false 리턴
			result = stmt.executeQuery();			
			return result.next();
		} 
		
		finally {
			// JDBC 객체 연결 해제
			if (result != null) result.close();
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
	}
}
