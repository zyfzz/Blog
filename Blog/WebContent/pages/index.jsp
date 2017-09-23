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

        <title>博客首页</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="<%=path %>/css/bootstrap.min.css" type="text/css">
        <!-- Owl Carousel Assets -->
        <link href="<%=path %>/css/owl.carousel.css" rel="stylesheet">
        <link href="<%=path %>/css/owl.theme.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="<%=path %>/css/style.css">
        <link href="<%=path %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
                            <h4><strong><a href="${pageContext.request.contextPath }/ShowAllArticle">SBlog!</a></strong></h4>
                        </div>

                        <c:if test="${not empty userInfo }">
                            <div id="unlogin" class="col-md-6">
                                <ul class="list-inline top-link link">
                                    <li>
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
                                        <a href="<%=path %>/pages/account.jsp">注册</a>
                                    </li>
                                    <li>
                                        <a href="<%=path %>/pages/account.jsp">登录</a>
                                    </li>
                                </ul>
                            </div>
                        </c:if>

                    </div>
                </div>
            </nav>
            <!--导航栏-->
            <nav id="menu" class="navbar container">
                <div class="navbar-header">
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                    <a class="navbar-brand" href="<%=path %>/ShowAllArticle">
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
                            <a id="rank" href="#">排行榜</a>
                        </li>
                        <li>
                            <c:if test="${not empty userInfo }">
                                <a href="<%=path%>/pages/UserInfoServlet?flag=signin">我的空间</a>
                            </c:if>
                            <c:if test="${empty userInfo }">
                                <a onclick="warning();">我的空间</a>
                            </c:if>

                        </li>
                        <li>
                            <c:if test="${not empty userInfo }">
                                <a href="<%=path %>/pages/BlogManager">博客管理</a>
                            </c:if>
                            <c:if test="${empty userInfo }">
                                <a onclick="warning();">博客管理</a>
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

        <div id="scrollBar" class="featured container">
            <div class="row">
                <div class="col-sm-8">
                    <!-- Carousel -->
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="<%=path %>/images/1.jpg" alt="First slide">
                                <!-- Static Header -->
                                <div class="header-text hidden-xs">
                                    <div class="col-md-12 text-center">
                                        <h2>Aenean feugiat in ante et </h2>
                                        <br>
                                        <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                        <br>
                                    </div>
                                </div>
                                <!-- /header-text -->
                            </div>
                            <div class="item">
                                <img src="<%=path %>/images/2.jpg" alt="Second slide">
                                <!-- Static Header -->
                                <div class="header-text hidden-xs">
                                    <div class="col-md-12 text-center">
                                        <h2>Aenean feugiat in ante et blandit. Vestibulum</h2>
                                        <br>
                                        <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                        <br>
                                    </div>
                                </div>
                                <!-- /header-text -->
                            </div>
                            <div class="item">
                                <img src="<%=path %>/images/3.jpg" alt="Third slide">
                                <!-- Static Header -->
                                <div class="header-text hidden-xs">
                                    <div class="col-md-12 text-center">
                                        <h2>Curabitur tincidunt porta lorem vitae</h2>
                                        <br>
                                        <h3>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</h3>
                                        <br>
                                    </div>
                                </div>
                                <!-- /header-text -->
                            </div>
                        </div>
                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                    <!-- /carousel -->
                </div>

                <div class="col-sm-4">
                    <div class="widget wid-follow">
                        <div class="heading">
                            <h4>关注我们</h4></div>
                        <br />
                        <div class="content">
                            <ul class="list-inline">
                                <li>
                                    <a href="www.weibo.com">
                                        <div class="box-weibo">
                                            <span class="fa fa-weibo fa-2x icon"></span>
                                            <span>100</span>
                                            <span>Fans</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="www.wechat.com">
                                        <div class="box-wechat">
                                            <span class="fa fa-wechat fa-2x icon"></span>
                                            <span>125</span>
                                            <span>Fans</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="www.google.com">
                                        <div class="box-google">
                                            <span class="fa fa-google-plus fa-2x icon"></span>
                                            <span>52</span>
                                            <span>Fans</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                            <br />
                            <img src="<%=path %>/images/10.jpg" />
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div id="page-content" class="index-page container">
            <div class="row">

                <div id="main-content" class="col-md-9">
                    <div id="box-content">
                        <c:forEach items="${ArticleList }" varStatus="loop" var="article">
                            <div class="box">
                                <div class="row">
                                    <div class="col-md-2">
                                        <br />
                                        <div style="margin:auto;width:60%;">
                                            <img src="${urlList[loop.count-1] }" class="img-circle" />
                                            <h5 style="text-align: center;"><a href="#">  ${article.user.username } </a></h5>
                                        </div>
                                    </div>
                                    <div class="col-md-10">
                                        <h3 class="blogName"><a href="<%=path %>/pages/blogServlet?flag=blogDetail&blogId=${article.article_id}&user_id=${article.user.user_id}">
                                            ${article.article_name }</a></h3>
                                        <br />
                                        <p>${article.digest}</p>
                                        <div class="info" style="float: right;">
                                            <span>分类:${article.type } </span>
                                            <span><i class="fa fa-calendar">发表时间:${article.date }</i> </span>
                                            <span><i class="fa fa-heart"></i>${article.like_num }</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <hr class="line">
                        </c:forEach>

                    </div>

                    <div class="box">
                        <center>
                            <ul class="pagination">
                                <li>
                                    <a href="#" aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li>
                                    <a href="#">4</a>
                                </li>
                                <li>
                                    <a href="#">5</a>
                                </li>
                                <li>
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </center>
                    </div>

                </div>

                <div id="sidebar" class="col-md-3">

                    <!---- Start Widget ---->
                    <div class="widget wid-tags">
                        <div class="heading">
                            <h4>TAGS</h4>
                        </div>
                        <div class="content">
                            <a href="#">编程</a>
                            <a href="#">文学</a>
                            <a href="#">杂谈</a>
                            <a href="#">宠物</a>
                            <a href="#">摄影</a>
                            <a href="#">人文</a>
                            <a href="#">写作</a>
                            <a href="#">技术</a>
                            <a href="#">笔记</a>
                        </div>
                    </div>
                    <!---- Start Widget ---->
                    <div class="widget wid-banner">
                        <div class="content">
                            <img src="<%=path %>/images/banner-2.jpg" class="img-responsive" />
                        </div>
                    </div>
                    <!---- Start Widget ---->
                    <div class="widget wid-calendar">
                        <div class="heading">
                            <h4>CALENDAR</h4>
                        </div>
                        <div class="content">
                            <center>
                                <form action="" role="form">
                                    <div class="">
                                        <div class="input-group date form_date" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd"> </div>
                                        <input type="hidden" id="dtp_input2" value="" /><br/>
                                    </div>
                                </form>
                            </center>
                        </div>
                    </div>
                    <!---- Start Widget ---->
                    <!--<div class="widget wid-tweet">
                        <div class="heading">
                            <h4>TWEET</h4></div>
                        <div class="content">
                            <div class="tweet-item">
                                <p><i class="fa fa-weibo"></i> TLAS - Coming Soon PSD Mockup</p>
                                <a>https://t.co/dLsNZYGVbJ</a>
                                <a>#psd</a>
                                <a>#freebie</a>
                                <a>#freebie</a>
                                <a>#dribbble</a>
                                <span>July 15th, 2015</span>
                            </div>
                            <div class="tweet-item">
                                <p><i class="fa fa-wechat"></i> Little Dude Character With Multiple Hairs</p>
                                <a>https://t.co/dLsNZYGVbJ</a>
                                <a>#freebie</a>
                                <a>#design</a>
                                <a>#illustrator</a>
                                <a>#dribbble</a>
                                <span>June 23rd, 2015</span>
                            </div>
                            <div class="tweet-item">
                                <p><i class="fa fa-twitter"></i> Newsletter Subscription Form Mockup</p>
                                <a>https://t.co/dLsNZYGVbJ</a>
                                <a>#psd</a>
                                <a>#freebie</a>
                                <a>#freebie</a>
                                <a>#dribbble</a>
                                <span>June 22nd, 2015</span>
                            </div>
                        </div>
                    </div>-->

                </div>
            </div>
        </div>

        <div id="rank-content" class="index-page container">

            <div class="row">

                <div id="rankS" class="col-md-4">
                    <div class="widget">
                        <div class="heading">
                            <h4 style="text-align: center">观看周排行</h4>
                        </div>
                        <c:forEach items="${OrderByViewlist }" varStatus="loop" var="article">
                            <div class="content">
                                <div class="box">

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div>
                                                <img src="${urlList[loop.count-1] }" class="img-circle" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <a href="<%=path %>/pages/blogServlet?flag=blogDetail&blogId=${article.article_id}&user_id=${article.user_id}">
                                                <p class="blogName">${article.article_name }</p>
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="info" style="float: right;">
                                                <span><i class="fa fa-eye"></i>${article.view_number }</span>
                                            </div>
                                        </div>
                                    </div>
                                    <br/><hr class="line">

                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div id="randL" class="col-md-4">
                    <div class="widget">
                        <div class="heading">
                            <h4 style="text-align: center">喜爱周排行</h4>
                        </div>
                        <c:forEach items="${OrderByLikenumlist }" varStatus="loop" var="article">
                            <div class="content">
                                <div class="box">

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div>
                                                <img src="${urlList[loop.count-1] }" class="img-circle" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <a href="<%=path %>/pages/blogServlet?flag=blogDetail&blogId=${article.article_id}&user_id=${article.user_id}">
                                                <p class="blogName">${article.article_name }</p>
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="info" style="float: right;">
                                                <span><i class="fa fa-heart"></i>${article.like_num }</span>
                                            </div>
                                        </div>
                                    </div>
                                    <br/><hr class="line">
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <div id="randN" class="col-md-4">
                    <div class="widget">
                        <div class="heading">
                            <h4 style="text-align: center">本周最新博文</h4>
                        </div>
                        <c:forEach items="${OrderByDatelist }" varStatus="loop" var="article">
                            <div class="content">
                                <div class="box">

                                    <div class="row">
                                        <div class="col-md-3">
                                            <div>
                                                <img src="${urlList[loop.count-1] }" class="img-circle" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <a href="<%=path %>/pages/blogServlet?flag=blogDetail&blogId=${article.article_id}&user_id=${article.user_id}">
                                                <p class="blogName">${article.article_name }</p>
                                            </a>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="info" style="float: right;">
                                                <span><i class="fa fa-calendar">${article.date }</i> </span>
                                            </div>
                                        </div>
                                    </div>
                                    <br/><hr class="line">
                                
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

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
        <script type="text/javascript" src="<%=path %>/js/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="<%=path %>/js/locales/bootstrap-datetimepicker.fr.js"></script>
        <script text="text/javascript" src="<%=path %>/owl-carousel/owl.carousel.js"></script>
        <script text="text/javascript" src="<%=path %>/js/index.js"></script>
        <script type="text/javascript">
            function getSearchInfo() {
                var key = $("#searchInput").val();
                if(key == "") {
                    alert("请输入搜索的内容");
                } else {
                    window.location.href = "<%=path %>/ShowBlogList?keyword=" + key;
                }
            }

            function getTypeInfo(typename) {
                var type = $(typename).text();
                window.location.href = "<%=path %>/ShowBlogListByType?type=" + type;
            }

            function warning() {
                alert("请先登录");
            }
        </script>
    </body>

</html>