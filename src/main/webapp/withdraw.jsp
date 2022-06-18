<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.ConnectionPool" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원탈퇴 완료</title>
</head>

<body>
	<%
		// POST request 시, 한글 깨짐 방지를 위한 인코딩 타입 설정
		request.setCharacterEncoding("utf-8");	
	
		// HTTP로부터 파라미터 값 요청
		String uid = request.getParameter("id");
		
		// 데이터베이스 커넥션 풀 호출
		Connection conn = ConnectionPool.get();

		// SQL을 위한 PreparedStatement 객체 생성		
		String sql = "DELETE FROM user WHERE id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);		
		stmt.setString(1, uid);
		
		// DELETE 처리
		int count = stmt.executeUpdate();
		if (count == 1) {
			out.print("회원 탈퇴가 완료되었습니다.");
			response.sendRedirect("userList.jsp");
		}
		else {
			out.print("회원 탈퇴 중 오류가 발생하였습니다.");
		}

		// JDBC 객체 연결 해제
		stmt.close();
		conn.close();	
	%>

	
</body>

</html>