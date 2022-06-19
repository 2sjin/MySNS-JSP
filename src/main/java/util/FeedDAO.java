package util;
import java.sql.*;
import javax.naming.NamingException;

public class FeedDAO {
	// INSERT
	public boolean insert(String uid, String ucon) throws NamingException, SQLException {
		// 데이터베이스 커넥션 풀 호출
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		
		try {
			// SQL을 위한 PreparedStatement 객체 생성
			String sql = "INSERT INTO feed(id, content) VALUES(?,?)";
			stmt = conn.prepareStatement(sql);
				
			stmt.setString(1, uid);
			stmt.setString(2, ucon);
			
			// SQL 실행
			int count = stmt.executeUpdate();
			return (count == 1) ? true : false;
		} finally {
			// JDBC 객체 연결 해제
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
		}
	}
	
	// SELECT 실행하여 작성글 리스트 리턴하기
	public ResultSet getList() throws NamingException, SQLException {
		// 데이터베이스 커넥션 풀 호출
		Connection conn = ConnectionPool.get();

		// SQL을 위한 Statement 객체 생성		
		Statement stmt = conn.createStatement();
		
		// SQL 문장 실행
		String sql = "SELECT * FROM feed;";
		return stmt.executeQuery(sql);
	}
	
}