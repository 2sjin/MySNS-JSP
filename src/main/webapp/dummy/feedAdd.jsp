<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.FeedDAO"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>게시글 작성</title>
</head>

<body>
	<%
		// POST request 시, 한글 깨짐 방지를 위한 인코딩 타입 설정
		request.setCharacterEncoding("utf-8");
	
		// HTTP로부터 파라미터 값 요청
		String uid = request.getParameter("id");
		String ucon = request.getParameter("content");
		
		// FeedDAO 객체 생성
		FeedDAO dao = new FeedDAO();	
		
		// INSERT 처리
		if (dao.insert(uid, ucon, "") == true) {
			out.print("작성 글의 업로드가 완료되었습니다.");
			response.sendRedirect("main.jsp");
		}
		else {
			out.print("작성 글의 업로드 중 오류가 발생하였습니다.");
		}
	%>

	
</body>

</html>