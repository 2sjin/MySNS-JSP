<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.FeedDAO"%>
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
		ResultSet result = dao.getList();
				
		// 질의 결과(ResultSet) 처리 : HTML 테이블 표현
		String str = "<table align=center>";

		str += "<tr height=40>";
			str += "<td><b>작성글 리스트</b></td>";	
			str += "<td align=right><a href='feedAdd.html'><button>글쓰기</button></a></td>";
		str += "</tr>";
		
		while( result.next() ) {
			String col1 = result.getString(2);
			String col2 = result.getString(3);
			String col3 = result.getString(4);

			str += "<tr><td colspan=2><hr></td></tr>";
			str += "<tr>";
				str += "<td><small>" + col1 + "</small></td>";
				str += "<td><small>" + col3 + "</small></td>";
			str += "</tr>";
			str += "<tr>";
				str += "<td>" + col2 + "</td>";
			str += "</tr>";
		}
		str += "</table>";
		out.print(str);
	%>
	
</body>

</html>