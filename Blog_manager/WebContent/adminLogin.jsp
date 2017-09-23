<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>管理员登录</title>

	<!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="css/bootstrap.min - 3.3.7.css" type="text/css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="css/style.css">
	<!-- Custom Fonts -->
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">

</head>

<body>
	<!--顶部-->
	<nav id="top">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<strong><font color = "green" size = "4">管理员登录</font></strong>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">

		<br>
		<di v class="row">
		
			<br>
			<br>
			<br>
			<div class="col-md-5 column">
				<div class="jumbotron">
					<form role="form" id="signin" action = "doAdminLoginServlet" method = "post">
						<div class="form-group">
							<label for="signin_name">管理员账号</label>
							<input type="text" class="form-control" id="signin_name" name="signin_name" placeholder="请输入用户名">
						</div>
						<div class="form-group">
							<label for="signin_password">密码</label>
							<input type="password" class="form-control" id="signin_password" name="signin_password" placeholder="请输入密码">
						</div>
						<input type = "submit" class="submit btn btn-default"  value = "登录">
						

					</form>
					<%out.print(request.getAttribute("MSGError") == null ? "" : request.getAttribute("MSGError")); %>

				</div>
			</div>

		</div>

		
	</div>

	<!-- Footer -->


	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min - 3.3.7.js"></script>
	<script type="text/javascript" src="js/lib/jquery.js"></script>
	<script type="text/javascript" src="js/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="js/dist/localization/messages_zh.js"></script>

	<script>
	
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
						required: "请输入管理员账号",
						minlength: "管理员账号至少由 8 个字符组成",
						maxlength: "用户名长度不能多于 20 个字符"
					},
					signin_password: {
						required: "请输入密码",
						minlength: "密码长度不能小于 6 个字符",
						maxlength: "密码长度不能多于 20 个字符1"
					}
				}
			});//signin

	
			
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