<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.*"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>가입자 리스트</title>
</head>

<body>
	<%
		// UserDAO 객체 생성
		UserDAO dao = new UserDAO();
		
		// 리스트 SELECT 결과 저장
		ArrayList<UserObj> users = dao.getList();
	
		// 질의 결과(ResultSet) 처리 : HTML 테이블 표현
		String str = "<table align=center border=1>";
		str += "<tr><th colspan=3>가입자 리스트</th></tr>";
		str += "<tr>";
		str += "<th>아이디</th>";
		str += "<th>비밀번호</th>";
		str += "<th>이름</th>";
		str += "</tr>";
		
		for (UserObj user : users) {
			str += "<tr>";
			str += "<td>" + user.getId() + "</td>";
			str += "<td>" + user.getPassword() + "</td>";
			str += "<td>" + user.getName() + "</td>";
			str += "</tr>";
		}
		str += "<table>";
		str += "<p align=center><a href='login.html'><button>로그인하기</button></a></p>";

		out.print(str);	
	%>
	
</body>

</html>