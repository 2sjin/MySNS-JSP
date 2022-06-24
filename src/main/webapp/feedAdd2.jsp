<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="util.FileUtil" %>
<%@ page import="util.FeedDAO" %>

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
	
	    String uid = null, ucon = null, ufname = null;
	    byte[] ufile = null;
	
	    ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	    List items = sfu.parseRequest(request);
	
	    Iterator iter = items.iterator();
	    while(iter.hasNext()) {
	        FileItem item = (FileItem) iter.next();
	        String name = item.getFieldName();
	        if(item.isFormField()) {
	            String value = item.getString();
	            if (name.equals("id")) uid = value;
	            else if (name.equals("content")) ucon = value;
	        }
	        else {
	            if (name.equals("image")) {
	                ufname = item.getName();
	                ufile = item.get();
	                String root = application.getRealPath(java.io.File.separator);
	                FileUtil.saveImage(root, ufname, ufile);
	            }
	        }
	    }
	
	    FeedDAO dao = new FeedDAO();
	    if (dao.insert(uid, ucon, ufname)) {
	        response.sendRedirect("main.jsp");
	    }
	    else {
			out.print("<script> alert('작성 글의 업로드 중 오류가 발생하였습니다.'); location.href='feedAdd2.jsp'; </script>");
	    }
	%>
</body>

</html>