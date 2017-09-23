<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <%String path=request.getContextPath();%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <title>博客列表</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css" type="text/css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="<%=path %>/css/style.css">
        <!-- Custom Fonts -->
        <link rel="stylesheet" href="<%=path %>/css/font-awesome.min.css" type="text/css">
    </head>

    <body>

        <header>
            <!--顶部-->
            <nav id="top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <strong>SBlog!</strong>
                        </div>
                        <c:if test="${not empty userInfo }">
                            <div id="unlogin" class="col-md-6">
                                <ul class="list-inline top-link link">
                                    <li>
                                        用户名:
                                        <a href="home.jsp">${userInfo.username}</a>
                                    </li>
                                    <li>
                                        <a id="loginOut" class="glyphicon glyphicon-log-out logout" href="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=signout">退出</a>
                                    </li>
                                </ul>
                            </div>
                        </c:if>

                        <c:if test="${empty userInfo }">
                            <div id="unlogin" class="col-md-6">
                                <ul class="list-inline top-link link">
                                    <li>
                                        <a href="<%=path %>/pages/account.jsp">注册</a>
                                    </li>
                                    <li>
                                        <a href="<%=path %>/pages/account.jsp">登录</a>
                                    </li>
                                </ul>
                            </div>
                        </c:if>
                        <!-- <div id="unlogin" class="col-md-6">
                            <ul class="list-inline top-link link">
                                <li>
                                    <a href="account.jsp">注册</a>
                                </li>
                                <li>
                                    <a href="account.jsp">登录</a>
                                </li>
                            </ul>
                        </div> -->
                        <!-- <div id="login" class="col-md-6">
                            <ul class="list-inline top-link link">
                                <li>
                                    <a id="userName" href="home.jsp">用户名</a>
                                </li>
                                <li>
                                    <a id="loginOut" class="glyphicon glyphicon-log-out logout" href="#">退出</a>
                                </li>
                            </ul>
                        </div> -->
                    </div>
                </div>
            </nav>

            <!--导航栏-->
            <nav id="menu" class="navbar container">
                <div class="navbar-header">
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                    <a class="navbar-brand" href="<%=path%>/ShowAllArticle">
                        <div class="logo"><span>首页</span></div>
                    </a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">分类 <i class="fa fa-arrow-circle-o-down"></i></a>
                            <div class="dropdown-menu">
                                <div class="dropdown-inner">
                                    <ul class="list-unstyled">
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">数据结构</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">编程语言</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">操作系统</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">移动开发</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">物联网</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">架构</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">云计算</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">游戏开发</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">运维</a>
                                        </li>
                                        <li>
                                            <a class="tag category" onclick="getTypeInfo(this);">数据库</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li>
                            <c:if test="${not empty userInfo }">
                                <a href="<%=path%>/pages/UserInfoServlet?flag=signin">我的空间</a>
                            </c:if>
                            <c:if test="${empty userInfo }">
                                <a onclick="warning();">我的空间</a>
                            </c:if>
                        </li>
                    </ul>
                    <div class="col-md-4" style="float: right;">
                        <div class="input-group input-group-sm" style="margin-top:9px;">
                            <input type="text" id="searchInput" class="form-control">
                            <span class="input-group-btn">
                                <a id="ahref" class="btn btn-danger search" onclick="getSearchInfo()" <%-- href="<%=path %>/pages/bloglist.jsp" --%> target="_blank"><span class="glyphicon glyphicon-search"></span></a>
                            </span>
                        </div>
                    </div>
                </div>
            </nav>
        </header>

        <div id="page-content" class="index-page container">
            <div class="row">

                <c:forEach items="${ArticleList }" varStatus="loop" var="article">
                    <div class="box">
                        <div class="row">
                            <div class="col-md-2">
                                <br />
                                <div style="margin:auto;width:60%;">
                                    <img src="${urlList[loop.count-1] }" class="img-circle" />
                                    <h5><a href="#"> ${article.user.username } </a></h5>
                                </div>
                            </div>
                            <div class="col-md-10">
                                <a href="<%=path %>/pages/blogServlet?flag=blogDetail&blogId=${article.article_id}&user_id=${article.user_id}">
                                    <h2 class="blogName">${article.article_name }</h2></a>
                                <br />
                                <p>${article.digest}</p>
                                <div class="info" style="float: right;">
                                    <span>分类:${article.type } </span>
                                    <span><i class="fa fa-calendar">发表时间:${article.date }</i> </span>
                                    <span><i class="fa fa-comment"></i> 0 Comments</span>
                                    <span><i class="fa fa-heart"></i>${article.like_num }</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="line">
                </c:forEach>

            </div>
        </div>

        <!-- Footer -->
        <footer>
            <div class="copy-right">
                <p>Copyright &copy; 2017.Company name All rights reserved.</p>
            </div>
        </footer>

        <script text="text/javascript" src="<%=path %>/js/jquery-3.2.1.min.js"></script>
        <script text="text/javascript" src="<%=path %>/js/bootstrap.min.js"></script>
        <script type="text/javascript ">
            var loginStatus = "${sessionScope.loginStatus}";
            if(loginStatus.match("true") != null) {
                $("#unlogin ").hide();
                $("#login ").show();
            } else {
                $("#login ").hide();
                $("#unlogin ").show();
            }
        </script>
        <script type="text/javascript">
            function getTypeInfo(typename) {
                var type = $(typename).text();
                window.location.href = "<%=path %>/ShowBlogListByType?type=" + type;
            }

            function getSearchInfo() {
                var key = $("#searchInput").val();
                if(key == "") {
                    alert("请输入搜索的内容");
                } else {
                    window.location.href = "<%=path %>/ShowBlogList?keyword=" + key;
                }
            }
        </script>
    </body>

</html>