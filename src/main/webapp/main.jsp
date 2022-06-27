<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.*"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>작성글 리스트</title>
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/mainStyle.css">
	<link rel="stylesheet" href="css/desc.css">
</head>

<body>
	<div class="page-hdr">MySNS</div>

	<div class="page-menu">
		<a href='logout.jsp'><button class="button">로그아웃</button></a>&nbsp;
		<a href='withdraw.html'><button class="button">회원탈퇴</button></a>
	</div>
	<div class="page-body">
		<div class="section pad-32 mtop-30">
			<a href='feedAdd.html'><input type="submit" value="글쓰기"></a>
		</div>
		
		<div class="section pad-32 mbot-100">	
			<%	
				String str = "";
			
				// FeedDAO 객체 생성
				FeedDAO dao = new FeedDAO();	
			
				// 리스트 SELECT 결과 저장
				ArrayList<FeedObj> feeds = dao.getList();
						
				// 질의 결과(ResultSet) 처리 : HTML 테이블 표현
				for (FeedObj feed : feeds) {
					str += "<div class='page-feed'>";
					str += "<div class='feedinfo'>";
					str += "<span class='email'>" + feed.getId() + "</span>";
					str += "<span class='date'>" + feed.getTs() + "</span></div>";
					
					String img = feed.getImages();
					if (img != null && !img.equals("")) {
						str += "<div class='feedimg'><img src='Images/" + img + "' class='imgsize'></div>";
					}
					str += "<div class='mtop-20 pad-16'>" + feed.getContent() + "</div>";
					str += "</div>";
				}
				out.print(str);
			%>
	
		</div>
	</div>
	<div class="page-footer">Copyright: mysns.com, 202x</div>
</body>

</html>