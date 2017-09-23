<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.blog.manager.AdminDao" %>
<%@ page import = "com.blog.manager.Article" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/article.css">
<link rel="stylesheet" href="css/main1.css">
<script type="text/javascript" src="js1/common.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String article_id = request.getParameter("article_id");
	AdminDao ad = new AdminDao();
	Article a = ad.showArticle(Integer.parseInt(article_id));
	String article_content = a.getContent();
%>
<body>
<br>
<br>
	
	<div style = "top: 0px; left:0px">
	<a href = "articleList.jsp" class="ext_btn ext_btn_submit">返回</a>
	</div>
	<div style="margin: auto; width: 80%;background: white; ">

	<%= article_content%>
	
	</div>
</body>
</html>