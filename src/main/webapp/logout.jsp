<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>

	<body>
		<%
			session.invalidate();	// 세션 초기화(모든 데이터 삭제)
			
			String str = "<p align=center><br>로그아웃을 완료하였습니다.<br><br>";
			str += "<a href='login.html'><button>로그인하기</button></a></p>";
			out.print(str);
		%>	
	</body>
</html>