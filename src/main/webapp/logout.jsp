<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Insert title here</title>
	</head>

	<body>
		<%
			session.invalidate();	// ���� �ʱ�ȭ(��� ������ ����)
			
			String str = "<p align=center><br>�α׾ƿ��� �Ϸ��Ͽ����ϴ�.<br><br>";
			str += "<a href='login.html'><button>�α����ϱ�</button></a></p>";
			out.print(str);
		%>	
	</body>
</html>