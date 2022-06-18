<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시글 목록</title>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String uid = request.getParameter("id");
		String ucon = request.getParameter("content");
		
		// JDBC 드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		// 데이터베이스 연결
		String URL = "jdbc:mysql://localhost:3306/mysns";
		Connection conn = DriverManager.getConnection(URL, "root", "1111");

		// SQL을 위한 Statement 객체 생성		
		Statement stmt = conn.createStatement();
		
		// SQL 문장 실행
		String sql = "INSERT INTO feed(id, content) VALUES('";
		sql += uid + "','" + ucon + "');";
		
		// INSERT 처리
		int count = stmt.executeUpdate(sql);
		if (count == 1) {
			out.print("작성 글의 업로드가 완료되었습니다.");
			response.sendRedirect("main.jsp");
		}
		else {
			out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
		}

		// JDBC 객체 연결 해제
		stmt.close();
		conn.close();	
	%>

	
</body>

</html>