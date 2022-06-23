<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="util.UserDAO" %>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>로그인</title>
</head>

<body>
	<%	
		// POST request 시, 한글 깨짐 방지를 위한 인코딩 타입 설정
		request.setCharacterEncoding("utf-8");	
	
		// HTTP로부터 파라미터 값 요청
		String uid = request.getParameter("id");
		String upass = request.getParameter("ps");
		
		// UserDAO 객체 생성
		UserDAO dao = new UserDAO();
		
		// login 메소드 호출 및 리턴값 저장
		int code = dao.login(uid, upass);
		
		if (code == 1) {
			out.print("<script> alert('존재하지 않는 아이디입니다.'); location.href='login.html'; </script>");
			
			return;
		}
		else if (code == 2) {
			out.print("<script> alert('비밀번호가 틀렸습니다.'); location.href='login.html'; </script>");
			return;
		}
		else {
			response.sendRedirect("main.jsp");	
		}
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
	<%= "password: " + upass %>
	<br>
	<%= "로그인 시간: " + getDate() %>	
</body>

</html>