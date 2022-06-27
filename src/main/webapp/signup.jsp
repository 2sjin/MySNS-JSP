<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.UserDAO"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>

<body>
	<%
		// POST request 시, 한글 깨짐 방지를 위한 인코딩 타입 설정
		request.setCharacterEncoding("utf-8");
	
		// HTTP로부터 파라미터 값 요청
		String uid = request.getParameter("id");
		String upass = request.getParameter("ps");
		String uname = request.getParameter("name");
		
		// UserDAO 객체 생성
		UserDAO dao = new UserDAO();

		// INSERT
		if (dao.exists(uid) == true) {
			out.print("<script> alert('이미 가입한 회원입니다.'); location.href='signup.html'; </script>");
		}
		else if (dao.insert(uid, upass, uname)) {
			out.print("<script> alert('회원가입이 완료되었습니다.'); location.href='login.html'; </script>");
		}
		else {
			out.print("<script> alert('회원가입 중 오류가 발생하였습니다.'); location.href='signup.html'; </script>");
		}
	%>
</body>

</html>