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
                            <hr class="line">
                            <br /> <strong>访问量：<span>${blog.view_number }</span></strong>
                            <br /> <strong>积分：<span>${author.score }</span></strong>
                            <br /><strong>等级：<span>LV5</span></strong>
                            <br /> <strong>排名：<span>998</span></strong><br />
                        </div>
                    </div>

                    <div class="widget">
                        <div class="heading">
                            <h4>阅读排行</h4>
                        </div>
                        <c:forEach items="${hotViewBlog }" var="hotViewBlog">
                            <div class="content">
                                <a href = "${pageContext.request.contextPath }/pages/blogServlet?flag=blogDetail&blogId=${hotViewBlog.article_id}&user_id=${hotViewBlog.user_id}"><strong>${hotViewBlog.article_name}</strong> </a><span style="float: right;"><i
						class="fa fa-eye"></i>${hotViewBlog.view_number }</span>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="widget">
                        <div class="heading">
                            <h4></h4>
                        </div>
                       
                    </div>

                </div>

                <div id="main-content" class="col-md-9">

                    <div id="headline" class="box">

                        <h5>${blog.article_name}</h5>
                        <br /> <strong>标签：${blog.type }</strong>
                        <div class="info" style="float: right;">
                            <span><i class="fa fa-calendar"></i>${blog.date }</span> <span><i
						class="fa fa-comment"></i>${commentscount }</span> <span><i
						class="fa fa-eye"></i>${blog.view_number }</span>
                        </div>

                    </div>

                    <hr class="line" />

                    <div class="info" style="float: right;">
                        <br />
                        <span id="comment"><a href="#">评论</a></span>
                        <c:if test="${not empty collect}">
                            <span><a id="collect">已收藏</a></span>
                        </c:if>
                        <c:if test="${empty collect }">
                            <span><a id="collect">收藏</a></span>
                        </c:if>
                        <p id="bar" style="display:none;"></p>
                        <span id="share"><a href="#" data-clipboard-action="copy"data-clipboard-target="location.href">分享</a></span>
                        
                    </div>

                    <div id="blog-content" class="box">

                        <p>${blog.content }</p>

                        <br /> <br /> <br />

                        <ul class="list-inline" style="margin: auto; width: 30%;">
                            <li>
                                <a>
                                    <div class="box-like" onclick="like()">
                                        <span class="fa fa-2x icon"></span>
                                        <span class="fa fa-2x fa-thumbs-up"></span>
                                        <span id="likenum">${blog.like_num }</span>
                                    </div>
                                    <%-- <a href="${pageContext.request.contextPath }/pages/blogServlet?flag=like&blogid=${blog.article_id }&likenum=${blog.like_num }"></a> --%>
                                </a>
                            </li>
                            <li>
                                <a>
                                    <div class="box-like" onclick="dislike()">
                                        <span class="fa fa-2x icon"></span>
                                        <span class="fa fa-2x fa-thumbs-down"></span>
                                        <span id="dislikenum">${blog.dislike_num }</span>
                                    </div>
                                </a>
                            </li>
                        </ul>

                    </div>

                    <hr class="line" />

                    <div class="box">

                        <h5>查看评论</h5>

                        <hr class="line" />

                        <c:forEach items="${commentsList}" var="acomment">

                            <div class="row">
                                <div class="col-md-1">
                                    <br />
                                    <div style="margin: auto; width: 90%;">
                                        <img src="${acomment.image }" class="img-circle" />
                                    </div>
                                </div>
                                <div class="col-md-11">
                                    <div class="info" style="float: right;">
                                        <span><i class="fa fa-calendar">${acomment.date}</i></span>
                                    </div>
                                    <h5>
								<a href="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=seeauthor&authorId=${acomment.user_id}">${acomment.username}</a>
							</h5>
                                    <p>${acomment.content}</p>
                                </div>
                            </div>
                            <hr class="line" />
                        </c:forEach>
                    </div>

                    <div id="evaluate" class="box">
                        <h5>发表评论</h5>
                      <c:if test="${empty userInfo }">
                      还未登录，不能评论
                      </c:if>
                      <c:if test="${not empty userInfo }">
                      
                      
                        <strong>用户名：<span>${sessionScope.userInfo.username }</span></strong><br />
                        <strong>评论内容：</strong>
                        <div style="margin: auto; width: 80%;">
                            <form  name="commentForm" method="post" action="${pageContext.request.contextPath }/pages/blogServlet?flag=addcomment&article_id=${blog.article_id}&user_id=${sessionScope.userInfo.user_id}">
                                <div class="form-group">
                                    <textarea name="commentcontent" id="commentcontent" class="form-control" rows="4" cols="25" required="required"></textarea>
                                </div>
                                 <button class="btn btn-4" name="evaluate" style="float: right;"  onclik="check()">提交</button>
                              
                          
                            </form>
                      </c:if>
                        </div>
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

        <script text="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
        <script text="text/javascript" src="../js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../clipboard.js-master/dist/clipboard.min.js"></script>
        <script>
            var clipboard = new Clipboard('#share', {
                text: function() {
                    return location.href;
                }
            });
            clipboard.on('success', function(e) {
                alert("复制链接成功")
            });

            function createXmlHttpRequest() {
                var xhr = null;
                //本地浏览器是否支持ActiveX对象，返回对象为true，返回null为false
                if(window.ActiveXObject) {
                    xhr = new ActiceXObject("Microsoft.XMLHTTP");
                    //本地浏览器是否支持XMLHttpRequest对象
                } else if(window.XMLHttpRequest) {
                    xhr = new XMLHttpRequest();
                } else {
                    alert("浏览器不支持XMLHttpRquest对象！");
                }
                return xhr;
            }

            function like() {
                alert("我要攒");
                var xhr = createXmlHttpRequest();
                if(xhr != null) {
                    xhr.open("get", "${pageContext.request.contextPath }/pages/blogServlet?flag=like&blogid=${blog.article_id }&likenum=${blog.like_num }");
                    xhr.onreadystatechange = function() {
                        if(xhr.readyState == 4 && xhr.status == 200) {
                            var likenum = xhr.responseText;
                            if(likenum != "" || likenum != null) {
                                document.getElementById("likenum").innerHTML = likenum;
                            }
                        }
                    }
                }
                xhr.send();
            }

            $("#collect").click(function() {
                alert("我要收藏或者取消收藏");
                var x;
                var obj = document.getElementById("collect");
                if("${userInfo}" == "" || "${userInfo}" == null) {
                    alert("请先登录！");
                    return;
                };
                if("收藏" == obj.innerHTML) {
                	alert("收藏");
                    x = "collect";
                } else {
                	alert("取消收藏");
                    x = "cancle"
                };
                var xhr = createXmlHttpRequest();
                if(xhr != null) {
                    xhr.open("get", "${pageContext.request.contextPath }/pages/blogServlet?flag=collectornot&blogid=${blog.article_id }&user_id=${userInfo.user_id}&article_name=${blog.article_name }&user_name=${userInfo.username }&operation=" + x);
                    xhr.onreadystatechange = function() {
                        if(xhr.readyState == 4 && xhr.status == 200) {
                            var result = xhr.responseText;
                            if(result != "" || result != null) {
                                alert("操作成功！");
                                document.getElementById("collect").innerHTML = result;
                            } else {
                                alert("操作失败。请稍后重试！");
                            }
                        }
                    }
                }
                xhr.send();
            });

            function dislike() {
                alert("我要踩");
                var xhr = createXmlHttpRequest();
                if(xhr != null) {
                    xhr.open("get", "${pageContext.request.contextPath }/pages/blogServlet?flag=dislike&blogid=${blog.article_id }&dislikenum=${blog.dislike_num }");
                    xhr.onreadystatechange = function() {
                        if(xhr.readyState == 4 && xhr.status == 200) {
                            var dislikenum = xhr.responseText;
                            if(dislikenum != "" || dislikenum != null) {
                                document.getElementById("dislikenum").innerHTML = dislikenum;
                            }
                        }
                    }
                }
                xhr.send();
            }
      
         
        </script>

    </body>

</html>