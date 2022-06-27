<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>로그아웃</title>
	</head>

	<body>
		<%
			session.invalidate();	// 세션 초기화(모든 데이터 삭제)
			
			out.print("<script> alert('로그아웃 되었습니다..'); location.href='login.html'; </script>");
			
			String str = "<a href='login.html'><button>로그인하기</button></a></p>";
			out.print(str);
		%>	
	</body>
</html>