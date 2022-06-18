<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>로그인 성공</title>
</head>

<body>

	<%
		response.sendRedirect("main.jsp");
	
		// POST request 시, 한글 깨짐 방지를 위한 인코딩 타입 설정
		request.setCharacterEncoding("utf-8");	
	
		// HTTP로부터 파라미터 값 요청
		String uid = request.getParameter("id");
		String ups = request.getParameter("ps");
	%>
		
	<%-- 선언문 태그로 함수 선언 --%>
	<%!
		String getDate() {
			return (new Date()).toString();
		}
	%>
	
	<%-- 출력 --%>
	<br>
	<%= "user id: " + uid %>
	<br>
	<%= "password: " + ups %>
	<br>
	<%= "로그인 시간: " + getDate() %>	
</body>

</html>