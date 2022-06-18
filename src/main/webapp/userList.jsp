<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.ConnectionPool" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>가입자 리스트</title>
</head>

<body>
	<%
		// POST request 시, 한글 깨짐 방지를 위한 인코딩 타입 설정
		request.setCharacterEncoding("utf-8");	
	
		// HTTP로부터 파라미터 값 요청
		String uid = request.getParameter("id");
		String ups = request.getParameter("ps");
		
		// 데이터베이스 커넥션 풀 호출
		Connection conn = ConnectionPool.get();

		// SQL을 위한 PreparedStatement 객체 생성
		String sql = "SELECT * FROM user;";
		PreparedStatement stmt = conn.prepareStatement(sql);		
		ResultSet result = stmt.executeQuery();
				
		// 질의 결과(ResultSet) 처리 : HTML 테이블 표현
		String str = "<table align=center border=1>";
		str += "<tr><th colspan=3>가입자 리스트</th></tr>";
		str += "<tr>";
		str += "<th>아이디</th>";
		str += "<th>비밀번호</th>";
		str += "<th>이름</th>";
		str += "</tr>";
		
		while( result.next() ) {
			String col1 = result.getString(1);
			String col2 = result.getString(2);
			String col3 = result.getString(3);
			
			str += "<tr>";
			str += "<td>" + col1 + "</td>";
			str += "<td>" + col2 + "</td>";
			str += "<td>" + col3 + "</td>";
			str += "</tr>";
		}
		str += "<table>";

		out.print(str);
		
		// JDBC 객체 연결 해제
		result.close();
		stmt.close();
		conn.close();	
	%>
	
</body>

</html>