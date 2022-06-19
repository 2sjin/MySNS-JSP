package util;
import java.util.*;
import java.sql.*;
import java.util.ArrayList;
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
	public ArrayList<FeedObj> getList() throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();		// 데이터베이스 커넥션 풀 호출
		PreparedStatement stmt = null;
		ResultSet result = null;
		
		try {			
			String sql = "SELECT * FROM feed ORDER BY ts DESC;";
			stmt = conn.prepareStatement(sql);	// SQL을 위한 prepareStatement 객체 생성		
			result = stmt.executeQuery();			// SQL 문장 실행
			
			ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
			while(result.next()) {
				String col1 = result.getString("id");
				String col2 = result.getString("content");
				String col3 = result.getString("ts");
				feeds.add(new FeedObj(col1, col2, col3));
			}
			return feeds;
			
		} finally {
	        if (result != null) stmt.close(); 
	        if (stmt != null) stmt.close(); 
	        if (conn != null) conn.close();			
		}
	}
	
}