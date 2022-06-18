<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.ConnectionPool" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>작성글 리스트</title>
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

		// SQL을 위한 Statement 객체 생성		
		Statement stmt = conn.createStatement();
		
		// SQL 문장 실행
		String sql = "SELECT * FROM feed;";
		ResultSet result = stmt.executeQuery(sql);
				
		// 질의 결과(ResultSet) 처리 : HTML 테이블 표현
		String str = "<table align=center>";

		str += "<tr height=40>";
			str += "<td><b>작성글 리스트</b></td>";	
			str += "<td align=right><a href='feedAdd.html'><button>글쓰기</button></a></td>";
		str += "</tr>";
		
		while( result.next() ) {
			String col1 = result.getString(2);
			String col2 = result.getString(3);
			String col3 = result.getString(4);

			str += "<tr><td colspan=2><hr></td></tr>";
			str += "<tr>";
				str += "<td><small>" + col1 + "</small></td>";
				str += "<td><small>" + col3 + "</small></td>";
			str += "</tr>";
			str += "<tr>";
				str += "<td>" + col2 + "</td>";
			str += "</tr>";
		}
		str += "</table>";
		out.print(str);
		
		// JDBC 객체 연결 해제
		result.close();
		stmt.close();
		conn.close();	
	%>
	
</body>

</html>