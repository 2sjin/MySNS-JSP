<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");	
	
		String uid = request.getParameter("id");
		String ups = request.getParameter("ps");
	%>	
	
	<%-- 선언문 태그로 함수 선언 --%>
	<%!
		String getDate() {
			return (new Date()).toString();
		}
	%>
	
	<%= "user id: " + uid %>
	<br>
	<%= "password: " + ups %>
	<br>
	<%= "로그인 시간: " + getDate() %>
</body>

</html>