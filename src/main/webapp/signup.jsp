<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.ConnectionPool" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원가입 성공</title>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String uid = request.getParameter("id");
		String upass = request.getParameter("ps");
		String uname = request.getParameter("name");
		
		// 데이터베이스 커넥션 풀 호출
		Connection conn = ConnectionPool.get();

		// SQL을 위한 PreparedStatement 객체 생성		
		String sql = "INSERT INTO user(id, password, name) VALUES(?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);		
		stmt.setString(1, uid);
		stmt.setString(2, upass);
		stmt.setString(3, uname);
		
		// INSERT 처리
		int count = stmt.executeUpdate();
		if (count == 1) {
			out.print("회원가입이 완료되었습니다.");
			response.sendRedirect("userList.jsp");
		}
		else {
			out.print("회원가입 중 오류가 발생하였습니다.");
		}

		// JDBC 객체 연결 해제
		stmt.close();
		conn.close();	
	%>

	
</body>

</html>