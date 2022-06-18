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
	
	// login(로그인 비밀번호 확인)
	public int login(String uid, String upass) throws NamingException, SQLException {
		// 데이터베이스 커넥션 풀 호출
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		try {
			// SQL을 위한 PreparedStatement 객체 생성
			String sql = "SELECT id, password FROM user WHERE id=?";
			conn = ConnectionPool.get();
			stmt = conn.prepareStatement(sql);		
			stmt.setString(1, uid);
			
			// SELECT 후 아이디, 비밀번호 일치 여부에 따른 리턴
			result = stmt.executeQuery();
			if (!result.next())	// 아이디가 없을 때
				return 1;
			else if (!upass.equals(result.getString("password")))	// 비밀번호가 틀릴 때
				return 2;
			return 0;	// 아이디, 비밀번호 모두 일치할 때
		}
		
		finally {
			// JDBC 객체 연결 해제
			if (result != null) result.close();
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
	}
}
