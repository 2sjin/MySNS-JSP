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
	<title>게시글 작성</title>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
	
	    String uid = null;
	    String ucon = null;
	    String ufname = null;
	    byte[] ufile = null;
	
	    ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	    List items = sfu.parseRequest(request);
	
	    Iterator iter = items.iterator();
	    while(iter.hasNext()) {
	        FileItem item = (FileItem) iter.next();
	        String name = item.getFieldName();
	        if(item.isFormField()) {
	            String value = item.getString();
	            if (name.equals("id")) uid = new String(value.getBytes("8859_1"), "utf-8");
	            else if (name.equals("content")) ucon = new String(value.getBytes("8859_1"), "utf-8");
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