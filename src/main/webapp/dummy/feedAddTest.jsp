<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>

	<body>
		<%
			String str = "";
			String line = "";
			
			str += request.getContentType() + "<br>";
			str += request.getContentLength() + "<br>";
			str += "<hr>";
			str += request.getParameter("id") + "<br>";
			str += request.getParameter("content") + "<br>";
			str += request.getParameter("image") + "<br>";
			str += "<hr>";
			
			InputStreamReader isr = new InputStreamReader(request.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);
			
			while( (line = br.readLine()) != null ) {
				str += line;
			}
			
			out.print(str);
		%>		
	</body>
</html>