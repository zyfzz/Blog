<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <title>博客主页</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="../css/style.css">
        <!-- Custom Fonts -->
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    </head>

    <body>

        <head>
            <!--顶部-->
            <nav id="top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <h4><strong><a href="${pageContext.request.contextPath }/ShowAllArticle">SBlog!</a></strong></h4>
                        </div>
                        <c:if test="${not empty userInfo }">
                            <div id="unlogin" class="col-md-6">
                                <ul class="list-inline top-link link">
                                    <li>用户名:
                                        <a href="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=signin">${userInfo.username}</a>
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
                                        <a href="${pageContext.request.contextPath}/pages/account.jsp">注册</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/pages/account.jsp">登录</a>
                                    </li>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </div>
            </nav>
        </head>

        <hr class='line' />

        <div class="featured container" style="background-color: transparent; border-color: transparent;">
            <h1>${author.username }的专栏</h1>
            <div class="row">
               <br />
               <button id="view" class="btn-3" style="float: right">摘要视图</button></div>
        </div>

        <div id="page-content" class="index-page container">
            <div class="row">

                <div id="sidebar" class="col-md-3">

                    <div class="widget">
                        <div class="heading">
                            <h4>个人资料</h4>
                        </div>
                        <div class="content">
                            <img src="${authorheadshot}" class="center-block" style="width: 60%;">
                            <h4 style="text-align: center;">
                        <a href="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=seeauthor&authorId=${author.user_id}">${author.username }</a>
                    </h4>
                            <hr class="line">&
                            <br /> <strong>访问量：<span>${blog.view_number }</span></strong><br /> <strong>积分：<span>${author.score }</span></strong><br />
                            <strong>等级：<span>LV5</span></strong><br /> <strong>排名：<span>998</span></strong><br />
                        </div>
                    </div>

                    <div class="widget">
                        <div class="heading">
                            <h4>阅读排行</h4>
                        </div>
                        <c:forEach items="${hotViewBlog }" var="hotViewBlog">
                            <div class="content">
                                <strong>${hotViewBlog.article_name}</strong> <span style="float: right;"><i
                        class="fa fa-eye"></i>${hotViewBlog.view_number }</span>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="widget">
                        <div class="heading">
                            <h4>评论排行</h4>
                        </div>
                        <div class="content">
                            <strong>${hotCommBlog.article_name}</strong> <span style="float: right;"><i
                        class="fa fa-comment"></i>${hotCommBlog.view_number }</span>
                        </div>
                    </div>

                </div>

               <div id="catalogue" class="col-md-9">

                    <div class="box">
                        <a href="#">
                            <h2 class="blogName">Lorem ipsum dolor sit amet</h2>
                        </a> <br />
                        <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                        <div class="info" style="float: right;">
                            <span><i class="fa fa-calendar"></i>25/3/2015</span> <span><i
                        class="fa fa-eye"></i>600</span> <span><i class="fa fa-comment"></i>1,200</span>
                        </div>
                    </div>
                    <hr class="line">

                </div>

            </div>
        </div>

        <!-- Footer -->
        <footer>
            <div class="copy-right">
                <p>Copyright &copy; 2017.Company name All rights reserved.</p>
            </div>
        </footer>

        <script text="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
        <script text="text/javascript" src="../js/bootstrap.min.js"></script>      
    </body>

</html>