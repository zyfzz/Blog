<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录/注册</title>

	<!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="../css/bootstrap.min - 3.3.7.css" type="text/css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="../css/style.css">
	<!-- Custom Fonts -->
	<link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">

</head>

<body>
	<!--顶部-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<h4><strong><a href="${pageContext.request.contextPath }/ShowAllArticle">SBlog!</a></strong></h4>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">

		<br>
		<div class="row">
			<div class="col-md-7 column">
				<div class="jumbotron">
					<h1>
						Hello, SBlog!
					</h1>
					<p>
						SBlog focus on IT professionals and IT companies to provide "integrated information dissemination and service platform".
					</p>
					<p>
						<a class="btn btn-primary btn-large" href="${pageContext.request.contextPath }/ShowAllArticle">Learn more</a>
					</p>
				</div>
			</div>

			<div class="col-md-5 column">
				<div class="jumbotron">
					<form role="form" id="signin" name="signin" action="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=signin" method="post">
						<div class="form-group">
							<label for="signin_name">用户名</label>
							<input type="text" class="form-control" id="signin_name" name="signin_name" placeholder="请输入用户名">
						</div>
						<div class="form-group">
							<label for="signin_password">密码</label>
							<input type="password" class="form-control" id="signin_password" name="signin_password" placeholder="请输入密码">
						</div>
						<div class="checkbox">
							<label><input type="checkbox" name="autosignin" value="autosignin" checked="checked">记住密码</label>
						</div>
						<!-- <button type="submit button" class="submit btn btn-default" onclick="signin.submit()" >提交</button> -->
						<input type="submit" class="submit btn btn-default" value="提交">
						<a style="padding-left: 20px; color: #0000FF;" href="#">忘记密码？</a><br><br>
						<label for="name">还没有帐号？ </label>
						<button type="button" class="btn btn-link" style="color: #0000FF;" data-toggle="modal" data-target="#myModal">立即注册</button><br>
					</form>

					<!-- 模态框（Modal） -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">
										新用户注册
									</h5>
								</div>
								<div class="modal-body">
									<form role="form" id="signup" name="signup" action="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=signup" method="post">
										<div class="form-group">
											<label for="signup_name" style="padding-left: 12px;">用户名</label>
											<input type="text" class="form-control" id="signup_name" name="signup_name" placeholder="用户名">
										</div>

										<div class="form-group">
											<label for="signup_password" style="padding-left: 12px;">密码</label>
											<input type="password" class="form-control" id="signup_password" name="signup_password" placeholder="密码">
										</div>

										<div class="form-group">
											<label for="signup_confirm_password" style="padding-left: 12px;">确认密码</label>
											<input type="password" class="form-control" id="signup_confirm_password" name="signup_confirm_password" placeholder="确认密码">
										</div>

										<div class="form-group">
											<label for="signup_email" style="padding-left: 12px;">Email</label>
											<input type="email" class="form-control" id="signup_email" name="signup_email" placeholder="Email">
										</div>

										<div class="form-group">
											<div class="row">
												<label for="signup_agree" style="padding-left:25px; padding-right: 20px; float:left">我已阅读用户声明</label>
												<input type="checkbox" class="checkbox" style="float:left" id="signup_agree" name="signup_agree">
											</div>
										</div>

										<button type="button" class="btn btn-default" data-dismiss="modal">
											关闭											
											</button>
										<!-- <button type="button submit" class="submit btn btn-primary " onclick="signup.submit()">
											提交										
											</button> -->
										<input type="submit" class="submit btn btn-default" value="提交">
									</form>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal -->
					</div>

				</div>
			</div>

		</div>

		<div class="row clearfix">
			<div class="col-md-4 column">
				<h2>
					Advertisement
				</h2>
				<p>
					Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
				</p>
				<p>
					<a class="btn" href="#">View details »</a>
				</p>
			</div>
			<div class="col-md-4 column">
				<h2>
					Advertisement
				</h2>
				<p>
					Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
				</p>
				<p>
					<a class="btn" href="#">View details »</a>
				</p>
			</div>
			<div class="col-md-4 column">
				<h2>
					Advertisement
				</h2>
				<p>
					Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh,
					ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
				</p>
				<p>
					<a class="btn" href="#">View details »</a>
				</p>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer>
		<div class="copy-right">
			<p>Copyright &copy; 2017.Company name All rights reserved.</p>
		</div>
	</footer>

	<script type="text/javascript" src="../js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min - 3.3.7.js"></script>
	<script type="text/javascript" src="../js/lib/jquery.js"></script>
	<script type="text/javascript" src="../js/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="../js/dist/localization/messages_zh.js"></script>

	<script>
		/* $.validator.setDefaults({
			submitHandler: function () {
				alert("登录成功!");
				alert($("#signin_name").val());
				alert($("#signin_password").val());
			}
		}); */
		$().ready(function () {
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
			});//signin

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
			});//signup
		});//validate
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
    
    <script>
        $(function () {
            function footerPosition() {
                $("footer").removeClass("fixed-bottom");
                var contentHeight = document.body.scrollHeight,//网页正文全文高度
                    winHeight = window.innerHeight;//可视窗口高度，不包括浏览器顶部工具栏
                if (!(contentHeight > winHeight)) {
                    //当网页正文高度小于可视窗口高度时，为footer添加类fixed-bottom
                    $("footer").addClass("fixed-bottom");
                }
            }
            footerPosition();
            $(window).resize(footerPosition);
        });
    </script>
    
    
</body>

</html>