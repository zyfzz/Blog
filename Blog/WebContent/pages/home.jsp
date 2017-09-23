<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

    <head>
        <%String path = request.getContextPath();%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>个人中心</title>
        <style type="text/css">
            #img {
                width: 150px;
                height: 150px;
            }
            
            #pagination {
                height: 50px;
                padding: 50px;
                text-align: center;
            }
            
            #image {
                width: 250px;
                height: 250px;
                position: absolute;
                top: 100px;
                left: 640px;
            }
        </style>
        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="../css/style.css">
        <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
        <!-- Custom Fonts -->
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">

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

                        <div id="login" class="col-md-6">
                            <ul class="list-inline top-link link">
                                <li>
                                    <c:if test="${not empty userInfo }">
                                        <a href="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=signin">${userInfo.username}</a>
                                    </c:if>
                                </li>
                                <li>
                                    <a id="loginOut" class="glyphicon glyphicon-log-out logout" href="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=signout">退出</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>

            <!--导航栏-->
            <nav id="menu" class="navbar container">
                <div class="navbar-header">
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<i class="fa fa-bars"></i>
				</button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath }/ShowAllArticle">
                        <div class="logo">
                            <span>首页</span>
                        </div>
                    </a>
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <!--<li class="dropdown">
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
                        </li>-->

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
                    <%-- <div class="col-md-4" style="float: right;">
                        <div class="input-group input-group-sm" style="margin-top:9px;">
                            <input type="text" id="searchInput" class="form-control">
                            <span class="input-group-btn">
                                <a id="ahref" class="btn btn-danger search" onclick="getSearchInfo()" href="<%=path %>/pages/bloglist.jsp" target="_blank"><span class="glyphicon glyphicon-search"></span></a>
                            </span>
                        </div>
                    </div> --%>
                </div>

        </header>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">编辑个人信息</h5>
                    </div>

                    <div class="modal-body">
                        <form role="form" id="signup" name="signup" action="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=modify" method="post" enctype="multipart/form-data">

                            <div class="img-circle" id="image"></div>

                            <div class="form-group">
                                <label for="signup_name" style="padding-left: 12px;">头像</label> <input type="file" name="image" value="" onchange="show(this)" class="form-control">
                            </div>

                            <div class="form-group">
                                <label for="signup_name" style="padding-left: 12px;">实名</label> <input type="text" class="form-control" name="truename" value="${userInfo.truename}">
                            </div>

                            <div class="form-group">
                                <label for="signup_password" style="padding-left: 12px;">职位</label>
                                <input class="form-control" name="job" value="${userInfo.job }">
                            </div>
                            <div class="form-group">
                                <label for="signup_email" style="padding-left: 12px;">Email</label>
                                <input class="form-control" name="email" value="${userInfo.email}"><br>
                            </div>

                            <div class="form-group">
                                <label for="signup_email" style="padding-left: 12px;">个人简介</label>
                                <input class="form-control" name="introduction" value="${userInfo.introduction}"><br>
                            </div>

                            <div class="row">
                                <div class="col-md-4">

                                    <div class="form-group">
                                        <label for="signup_confirm_password" style="padding-left: 12px;">行业&nbsp;</label>
                                        <select name="trade" style="padding-right: 20px;">
                                            <option value="IT">IT</option>
                                            <option value="非IT">非IT</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="signup_confirm_password" style="padding-left: 12px;">性别&nbsp;</label>
                                        <select name="sex" style="padding-right: 20px;">
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="signup_email" style="padding-left: 12px;">Address&nbsp;</label> &nbsp;&nbsp;
                                <select name="country" style="padding-right: 20px;" onchange="modifyprov()">
                                    <option value="中国">中国</option>
                                    <option value="美国">美国</option>
                                    <option value="英国">英国</option>
                                    <option value="法国">法国</option>
                                    <option value="俄罗斯">俄罗斯</option>
                                    <option value="加拿大">加拿大</option>
                                    <option value="巴西">巴西</option>
                                    <option value="澳大利亚">澳大利亚</option>
                                    <option value="印尼">印尼</option>
                                    <option value="泰国">泰国</option>
                                    <option value="马来西亚">马来西亚</option>
                                    <option value="新加坡">新加坡</option>
                                    <option value="菲律宾">菲律宾</option>
                                    <option value="越难">越难</option>
                                    <option value="印度">印度</option>
                                    <option value="日本">日本</option>
                                </select>
                                <select name="province">
                                    <option value="北京">北京</option>
                                    <option value="天津">天津</option>
                                    <option value="河北">河北</option>
                                    <option value="山西">山西</option>
                                    <option value="内蒙古">内蒙古</option>
                                    <option value="辽宁">辽宁</option>
                                    <option value="吉林">吉林</option>
                                    <option value="黑龙江">黑龙江</option>
                                    <option value="上海">上海</option>
                                    <option value="江苏">江苏</option>
                                    <option value="河南">河南</option>
                                    <option value="广东">广东</option>
                                    <option value="云南">云南</option>
                                    <option value="澳门">澳门</option>
                                    <option value="香港">香港</option>
                                    <option value="台湾">台湾</option>
                                    <option value="浙江">浙江</option>
                                    <option value="安徽">安徽</option>
                                    <option value="福建">福建</option>
                                    <option value="江西">江西</option>
                                    <option value="山东">山东</option>
                                    <option value="湖北">湖北</option>
                                    <option value="湖南">湖南</option>
                                    <option value="重庆">重庆</option>
                                    <option value="海南">海南</option>
                                    <option value="四川">四川</option>
                                    <option value="贵州">贵州</option>
                                </select>
                            </div>

                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button submit" class="submit btn btn-primary " onclick="signup.submit()">提交</button>

                        </form>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal -->
        </div>
        <div class="featured container">
            <div class="row">
                <div class="col-sm-2">

                    <%-- 
				<c:if test="${empty userInfo }">
					<div id="img">
						<img class="img-circle" src="../images/21.jpg" /><br />
					</div>
				</c:if> --%>
                    <div style="margin: auto;width:80%">
                        <c:if test="${userInfo.username eq imageURL }">
                            <div id="img">
                                <img class="img-circle" src="../images/21.jpg" /><br />
                            </div>
                        </c:if>

                        <c:if test="${userInfo.username ne imageURL }">
                            <div id="img">
                                <img class="img_circle" alt="" src="${imageURL}">
                            </div>
                        </c:if>

                    </div>

                </div>
                <div class="col-sm-10">
                    <span>${userInfo.username}</span> <br /> <br /> <br />
                    <c:if test="${empty userInfo.trade }">
                        <span>&nbsp;&nbsp;未填写行业&nbsp;&nbsp;</span>
                    </c:if>
                    <c:if test="${not empty userInfo.trade }">
                        <span>&nbsp;&nbsp;行业：${userInfo.trade}&nbsp;&nbsp;</span>
                    </c:if>
                    <span>|</span>
                    <c:if test="${empty userInfo.job }">
                        <span>&nbsp;&nbsp;未填写职业&nbsp;&nbsp;</span>
                    </c:if>
                    <c:if test="${not empty userInfo.job }">
                        <span>&nbsp;&nbsp;职业：${userInfo.job}&nbsp;&nbsp;</span>
                    </c:if>
                    <span>|</span>
                    <c:if test="${empty userInfo.truename }">
                        <span>&nbsp;&nbsp;未填写实名&nbsp;&nbsp;</span>
                    </c:if>
                    <c:if test="${not empty userInfo.truename }">
                        <span>&nbsp;&nbsp;姓名：${userInfo.truename}&nbsp;&nbsp;</span>
                    </c:if>
                    <span>|</span>
                    <c:if test="${empty userInfo.country }">
                        <span>&nbsp;&nbsp;未填写地址&nbsp;&nbsp;</span>
                    </c:if>
                    <c:if test="${not empty userInfo.country }">
                        <span>&nbsp;&nbsp;地址：${userInfo.country}&nbsp;${userInfo.city}&nbsp;&nbsp;</span>
                    </c:if>
                    <span>|</span>
                    <c:if test="${empty userInfo.sex }">
                        <span>&nbsp;&nbsp;未填写性别&nbsp;&nbsp;</span>
                    </c:if>
                    <c:if test="${not empty userInfo.sex }">
                        <span>&nbsp;&nbsp;性别：${userInfo.sex}&nbsp;&nbsp;</span>
                    </c:if>
                    <span>|</span>
                    <button type="button" class="btn btn-link" style="color: #0000FF;" data-toggle="modal" data-target="#myModal">编辑个人信息</button>
                    <br>
                </div>
            </div>
        </div>

        </nav>

        <div id="page-content" class="archive-page container">

            <div class="row">
                <div id="main-content" class="col-md-8">
                    <hr class="line">
                    <div class="box">
                        <a href="#">
                            <h3 class="vid-name">我的博客</h3>
                        </a>
                    </div>
                    <hr class="line">
                </div>
                <div id="main-content" class="col-md-4">
                    <hr class="line">
                    <div class="box">
                        <a href="#">
                            <h3 class="vid-name">我的收藏</h3>
                        </a>
                    </div>
                    <hr class="line">
                </div>

            </div>

            <div class="row">

                <div id="main-content" class="col-md-8">

                    <c:forEach items="${blogList }" var="blog">
                        <hr class="line">
                        <div class="box">
                            <a href="${pageContext.request.contextPath }/pages/blogServlet?flag=blogDetail&blogId=${blog.article_id}&user_id=${blog.user_id}">
                                <h3 class="blogName">${blog.article_name }</h3>
                            </a> <br />
                            <p>${blog.digest}</p>
                            <div class="info" style="float: right;">
                            	 <span>分类:&nbsp;${blog.type } </span>
                                 <span><i class="fa fa-heart"></i>${blog.like_num }</span>
                                <span><i class="fa fa-calendar">${blog.date}</i> </span>
                            </div>
                            <form action="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=deleteArticle" method="post">
                                <input type="hidden" id="current" name="currentPage" value="${blog.article_id}">
                            </form>
                        </div>
                        <hr class="line">
                    </c:forEach>

                    <div id="pagination">
                        <span>当前页：${currentPage }</span>/<span id="total">${totalPage }</span>&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" onclick="pageSplit('first')">首页</a>&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" onclick="pageSplit('pre')">上一页</a>&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" onclick="pageSplit('next')">下一页</a>&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0);" onclick="pageSplit('last')">尾页</a>&nbsp;&nbsp;&nbsp; go
                        <input type="text" size="2" id="go" onchange="pageSplit('go')">页
                        <form method="post" action="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=getBlogList&user_id=${userInfo.user_id}" name="myform">
                            <input type="hidden" id="currentPage" name="currentPage" value="${currentPage }">
                        </form>
                    </div>

                </div>
                <div id="main-content" class="col-md-4">
                    <hr class="line">
                    <c:forEach items="${Collections}" var="acollection">

                        <div class="box">
                            <a href="${pageContext.request.contextPath }/pages/blogServlet?flag=blogDetail&blogId=${acollection.article_id}&user_id=${acollection.user_id}">
                                <h5 class="vid-name">${acollection.article_name }</h5>
                            </a>
                        </div>
                        <hr class="line">
                    </c:forEach>
                </div>

            </div>

        </div>

    </body>

    <script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min - 3.3.7.js"></script>
    <script type="text/javascript" src="../js/lib/jquery.js"></script>
    <script type="text/javascript" src="../js/dist/jquery.validate.js"></script>
    <script type="text/javascript" src="../js/dist/localization/messages_zh.js"></script>

    <script>
        function pageSplit(obj) {
            alert(obj);
            var currentPage = document.getElementById("currentPage");
            alert(currentPage.value);
            var total = document.getElementById("total").innerHTML;
            alert(total);
            if("first" == obj) {
                currentPage.value = 1;
            } else if("last" == obj) {
                currentPage.value = total;
            } else if("pre" == obj) {
                var temp = currentPage.value - 1;
                if(temp <= 0) {
                    temp = 1;
                }
                currentPage.value = temp;
            } else if("next" == obj) {
                alert("weishenme")
                var temp = parseInt(currentPage.value) + 1;
                if(temp >= total) {
                    temp = total;
                }
                currentPage.value = temp;
            } else if("go" == obj) {
                var val = document.getElementById("go").value;
                if(val >= 1 && val <= total) {
                    currentPage.value = val;
                } else {
                    alert("输入页码有误！");
                    return;
                }
            }
            alert(currentPage.value);
            myform.submit();
        }
        $.validator.setDefaults({
            submitHandler: function() {
                alert("提交事件!");
            }
        });
        $().ready(function() {
            $("#signin").validate({
                rules: {
                    signin_name: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    },
                    signin_password: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    }
                },
                messages: {
                    signin_name: {
                        required: "请输入用户名",
                        minlength: "用户名至少由 6 个字符组成",
                        maxlength: "用户名长度不能多于 20 个字符"
                    },
                    signin_password: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 6 个字母",
                        maxlength: "密码长度不能多于 20 个字母"
                    }
                }
            }); //signin

            $("#signup").validate({
                rules: {
                    signup_name: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    },
                    signup_password: {
                        required: true,
                        minlength: 6,
                        maxlength: 20
                    },
                    signup_confirm_password: {
                        required: true,
                        minlength: 6,
                        maxlength: 20,
                        equalTo: "#signup_password"
                    },
                    signup_email: {
                        required: true,
                        email: true
                    },
                    signup_agree: {
                        required: true
                    }
                },
                messages: {
                    signup_name: {
                        required: "请输入用户名",
                        minlength: "用户名至少由 6 个字符组成",
                        maxlength: "用户名长度不能多于 20 个字符"
                    },
                    signup_password: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 6 个字母",
                        maxlength: "密码长度不能多于 20 个字母"
                    },
                    signup_confirm_password: {
                        required: "请输入密码",
                        minlength: "密码长度不能小于 6 个字母",
                        equalTo: "两次密码输入不一致"
                    },
                    signup_email: "请输入一个正确的邮箱",
                    signup_agree: {
                        required: "请接受我们的声明"
                    },
                }
            }); //signup
        }); //validate

        $(function() {
            function footerPosition() {
                $("footer").removeClass("fixed-bottom");
                var contentHeight = document.body.scrollHeight, //网页正文全文高度
                    winHeight = window.innerHeight; //可视窗口高度，不包括浏览器顶部工具栏
                if(!(contentHeight > winHeight)) {
                    //当网页正文高度小于可视窗口高度时，为footer添加类fixed-bottom
                    $("footer").addClass("fixed-bottom");
                }
            }
            footerPosition();
            $(window).resize(footerPosition);
        });

        function modifyprov() {
            var x = document.getElementById("choosecoun");
            var y = document.getElementById("chooseprov");
            if(x.selectedIndex == "0") {
                y.style.display = "inline-block";
            } else {
                y.style.display = "none";
            }
        }

        function show(obj) {
            var reader = new FileReader();
            reader.readAsDataURL(obj.files[0]);
            reader.onload = function() {
                //alert(this.result);
                var img = "<img id='photo' src = '" + this.result + "'/>";
                document.getElementById("image").innerHTML = img;
            }
        }
    </script>

    <style type="text/css">
        .error {
            color: red;
        }
        
        .fixed-bottom {
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>

</html>