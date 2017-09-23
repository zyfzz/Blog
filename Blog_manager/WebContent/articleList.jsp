<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.blog.manager.AdminDao" %>
<%@ page import = "com.blog.manager.Article" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/common1.css">
<link rel="stylesheet" href="css/main1.css">
<script type="text/javascript" src="js1/jquery.min.js"></script>
<script type="text/javascript" src="js1/colResizable-1.3.min.js"></script>
<script type="text/javascript" src="js1/common.js"></script>
<link rel="stylesheet" href="css/article.css">
<script type="text/javascript">
      $(function(){  
        $(".list_table").colResizable({
          liveDrag:true,
          gripInnerHtml:"<div class='grip'></div>", 
          draggingClass:"dragging", 
          minWidth:30
        }); 
        
      }); 
      
   </script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	if(session.getAttribute("adminInfo") == null){
		response.sendRedirect("adminLogin.jsp");
	}
	AdminDao ad = new AdminDao();
	request.setCharacterEncoding("UTF-8");
	String statu = request.getParameter("statu");
	String article_id = request.getParameter("article_id");
	String article_name = request.getParameter("article_name");
	ArrayList<Article> articleList = ad.articleList(statu,article_id,article_name); 
	
	
%>
<body>

<div >
	<br>
		<font align = "center" face = "楷体" color = "green"><h1>博文审核</h1></font>
	<br>
	<br>
		<form action="" method = "post">
	<table >
	<tr>
		<td><font color = "blue">审核状态:&nbsp;&nbsp;&nbsp;&nbsp;</font></td><td><input type = "text" name = "statu" class = "input-text 1h25" value = "<%= statu == null ? "" : statu %>" ></td>
		<td><font color = "blue">&nbsp;&nbsp;&nbsp;博文编号:&nbsp;&nbsp;&nbsp;&nbsp;</font></td><td><input type = "text" name = "article_id" class = "input-text 1h25" value = "<%= article_id == null ? "" : article_id %>" ></td>
		<td><font color = "blue">&nbsp;&nbsp;&nbsp;博文题目:&nbsp;&nbsp;&nbsp;&nbsp;</font></td><td><input type = "text" name = "article_name" class = "input-text 1h25" value = "<%= article_name == null ? "" : article_name%>" ></td>
		
		
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit"   class="ext_btn ext_btn_error" value="查询"> </td>
	</tr>
	</table>
	</form>
	<div id="table" class="mt10">
        <div class="box span10 oh">
              <table width="80%" border="0" cellpadding="0" cellspacing="0" class="list_table">
                <tr>
                   <th>博文编号</th>
                   <th>博文名字</th>
                   <th>发表日期</th>
                   <th>审核状态</th>
                   <th>操作</th>
               	 </tr>
               	<%for(Article a : articleList){	%>
    
                <tr class="tr">  
                   <td align = "center"><%= a.getArticle_id() %></td>
                   <td align = "center"><%= a.getArticle_name() %></td>
                   <td align = "center"><%= a.getDate()%></td>
                   <td align = "center"><%= a.getStatu() %></td>
                   <td align = "center">
                   		<a href = "checkSuccess.jsp?article_id=<%= a.getArticle_id() %>" class="ext_btn ext_btn_submit">审核通过</a>
                   		&nbsp; &nbsp; 
                   		<a href = "articleContent.jsp?article_id=<%= a.getArticle_id() %>" class="ext_btn ext_btn_submit">查看内容</a>
                   		&nbsp; &nbsp; 
                   		<a href = "articleDelete.jsp?article_id=<%= a.getArticle_id() %>" class="ext_btn ext_btn_submit">删除</a>
                   		&nbsp; &nbsp; 
                   		
                   </td>
                
                 </tr>
                 <%} %>
                 </table>
                 <br>
				<br>
              <div class="page mt10">
                <div class="pagination">
                  <ul>
                      <li class="first-child"><a href="#">首页</a></li>
                      <li class="disabled"><span>上一页</span></li>
                      <li class="active"><span>1</span></li>
                      <li><a href="#">2</a></li>
                      <li><a href="#">下一页</a></li>
                      <li class="last-child"><a href="#">末页</a></li>
                  </ul>
                </div>

              </div>
        </div>
     </div>

</body>
</html>