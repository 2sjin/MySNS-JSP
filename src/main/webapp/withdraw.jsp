<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.UserDAO" %>

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
		
		// UserDAO 객체 생성
		UserDAO dao = new UserDAO();
		
		// DELETE
		if (dao.exists(uid) == false) {
			out.print("회원 정보를 찾을 수 없습니다.");
		}
		else if (dao.delete(uid)) {
			out.print("회원 탈퇴가 완료되었습니다.");
			response.sendRedirect("userList.jsp");
		}
		else {
			out.print("회원 탈퇴 중 오류가 발생하였습니다.");
		}
	%>

	
</body>

</html>