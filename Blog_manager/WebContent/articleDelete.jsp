<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.blog.manager.AdminDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String article_id = request.getParameter("article_id");
AdminDao ad = new AdminDao();
ad.articleDelete(Integer.parseInt(article_id));
response.sendRedirect("articleList.jsp");
%>
</body>
</html>