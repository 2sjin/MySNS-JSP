<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.*"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>작성글 리스트</title>
</head>

<body>
	<%	
		// FeedDAO 객체 생성
		FeedDAO dao = new FeedDAO();	
	
		// 리스트 SELECT 결과 저장
		ArrayList<FeedObj> feeds = dao.getList();
				
		// 질의 결과(ResultSet) 처리 : HTML 테이블 표현
		String str = "<table align=center>";

		str += "<tr height=40>";
			str += "<td><b>작성글 리스트</b></td>";	
			str += "<td align=right><a href='feedAdd.html'><button>글쓰기</button></a></td>";
		str += "</tr>";
		
		for (FeedObj feed : feeds) {
			str += "<tr><td colspan=2><hr></td></tr>";
			str += "<tr>";
				str += "<td><small>" + feed.getId() + "</small></td>";
				str += "<td><small>" + feed.getTs() + "</small></td>";
			str += "</tr>";
			str += "<tr>";
				str += "<td>" + feed.getContent() + "</td>";
			str += "</tr>";
		}
		str += "</table>";
		out.print(str);
	%>
	
</body>

</html>