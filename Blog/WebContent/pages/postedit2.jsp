<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>

    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>写博客</title>

        <!-- Bootstrap Core CSS -->
        <link rel="stylesheet" href="../css/bootstrap.min - 3.3.7.css" type="text/css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="../css/style.css">
        <!-- Custom Fonts -->
        <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">

        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../froala_editor/css/froala_editor.css">
        <link rel="stylesheet" href="../froala_editor/css/froala_style.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/code_view.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/colors.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/emoticons.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/image_manager.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/image.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/line_breaker.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/table.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/char_counter.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/video.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/fullscreen.css">
        <link rel="stylesheet" href="../froala_editor/css/plugins/file.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.3.0/codemirror.min.css">

    </head>
	<%String path=request.getContextPath();%>
    <body>
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
                                <a href="home.jsp">个人中心</a>
                            </li>
                            <li><a id="loginOut"
								class="glyphicon glyphicon-log-out logout"
								href="${pageContext.request.contextPath }/pages/UserInfoServlet?flag=signout">退出</a>
							</li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <br>

        <!--导航栏-->
        <nav id="menu" class="navbar container">
            <div class="navbar-header">
                    <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                    <a class="navbar-brand" href="<%=path %>/ShowAllArticle">
                        <div class="logo"><span>首页</span></div>
                    </a>
                </div>
            <div class="navbar-header">
                <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
                <a class="navbar-brand" href="<%=path%>/pages/UserInfoServlet?flag=signin">
                    <div class="logo"><span>个人中心</span></div>
                </a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="disabled">
                        <a href="#" data-toggle="tab">文章管理</a>
                    </li>
                    <li>
                        <a href="#new_article" data-toggle="tab">发表文章</a>
                    </li>
                    <li class="disabled">
                        <a href="#" data-toggle="tab">类别管理</a>
                    </li>
                    <!--<li class="disabled">
                        <a href="#" data-toggle="tab">评论管理</a>
                    </li>
                    <li class="disabled">
                        <a href="#" data-toggle="tab">博客配置</a>
                    </li>
                    <li class="disabled">
                        <a href="#" data-toggle="tab">草稿箱</a>
                    </li>-->
                    <li class="disabled">
                        <a href="#" data-toggle="tab">回收站</a>
                    </li>
                </ul>
            </div>
        </nav>
        </header>

        <div class="container">
            <div id="myTabContent" class="tab-content">

                <!--new_article -->
                <div class="tab-pane fade in active" id="new_article">
                    <form  action="" id="editContent" method="post">
                        <p class="subtit">文章标题</p>
                        <div>
                            <select id="selType" name="titletype" style="float: left;padding: 2px;border: solid 1px #ccc;">
                                <option value="无">请选择</option>
                                <option value="原创">原创</option>
                                <option value="转载">转载</option>
                                <option value="翻译">翻译</option>
                            </select>
                            <input type="text" name="title" id="txtTitle" value="${secondTitle }" class="form-control" style="width:560px;float:left; border: solid 1px #ccc;" maxlength="50">
                        </div>

                        <p class="subtit">文章内容</p>

                        <div id="editor">
                            <div id='edit' style="width:99%;margin: auto;text-align: left;">
                                <h1>Hello World!</h1>
                            </div>
                        </div>

                        <p class="subtit">文章标签（添加Tag，你的内容能被更多人看到）
                            <a href="http://blog.csdn.net/csdnproduct/article/details/12423189" target="_blank">我们为什么要打Tag？</a>
                        </p>
                        <input type="text" class="form-control" style="width:700px;float:left; border: solid 1px #ccc; padding-left: 4px;">
                        <label style="color: black;padding-top: 5px;">（最多添加5个标签，多个标签之间用“,”分隔）</label>

                        <p class="subtit">文章分类（到分类首页）</p>

                        <div class="radioBox channel">
                            <input type="radio" name="radChl" id="radChl1" value="数据结构">
                            <label style="color: black;">数据结构</label>
                            <input type="radio" name="radChl" id="radChl1" value="编程语言">
                            <label style="color: black;">编程语言</label>
                            <input type="radio" name="radChl" id="radChl1" value="操作系统">
                            <label style="color: black;">操作系统</label>
                            <input type="radio" name="radChl" id="radChl2" value="移动开发">
                            <label style="color: black;">移动开发</label>
                            <input type="radio" name="radChl" id="radChl3" value="物联网">
                            <label style="color: black;">物联网</label>
                            <input type="radio" name="radChl" id="radChl4" value="架构">
                            <label style="color: black;">架构</label>
                            <input type="radio" name="radChl" id="radChl5" value="云计算/大数据">
                            <label style="color: black;">云计算/大数据</label>
                            <input type="radio" name="radChl" id="radChl6" value="游戏开发">
                            <label style="color: black;">游戏开发</label>
                            <input type="radio" name="radChl" id="radChl7" value="运维">
                            <label style="color: black;">运维</label>
                            <input type="radio" name="radChl" id="radChl8" value="数据库">
                            <label style="color: black;">数据库</label>
                        </div>

                        <p class="subtit">摘要：（默认自动提取您文章的前200字显示在博客首页作为文章摘要，您也可以在这里自行编辑 ）</p>
                        <div><textarea rows="6" style="width:99%;" name="digest" >${article.digest }</textarea></div>
                        <br>
                        <br>
                    </form>
                        <div class="btn_area_1" style="padding: 30px 0 14px 450px;">
                            <input id="btnPublish" type="button" onclick="submit();" class="btn-default" style="height: 30px;padding: 0 15px;background:#080808;color: #4CAE4C;" value="发表文章" title="保存并跳转">
                            <input id="btnCancel" type="button" class="btn-default" style="height: 30px;padding: 0 15px;background:#080808;color: #4CAE4C" value="舍弃">
                        </div>
                </div>

                <!--article_management -->
                <div class="tab-pane fade" id="article_management">
					
                    <table style="width:100%;padding: 12px 4px 2px 4px;border-bottom: solid 1px #f5f5f5;border-bottom-color: #f0f0f0;" cellspacing="0">
                        <tbody>
                            <tr class="">
                                <th class="tdleft">标题</th>
                                <th style="width:70px;">状态</th>
                                <th style="width:50px;">阅读</th>
                                <th style="width:50px;">收藏</th>
                                <th style="width:50px;">评论</th>
                                <th style="width:100px;">评论权限</th>
                                <th style="width:100px;">操作</th>
                            </tr>
                            
                        </tbody>
                    </table>
                    <c:forEach items="${BlogList}" var="article">
                    <div class="box">
                            <div class="row">
                                <div class="col-md-6">                                	
                                    <a href="#"><h6 class="blogName">${article.article_name }(${article.date})</h6></a>
                                </div>      
                                                          
                                <div class="col-md-4">                                    
                                    <div class="info" style="float: right;">
                                        <span>${article.statu }</span>
                                        <span style="width:30px">${article.view_number }</span>
                                        <span>${article.like_num }</span>
                                        <span>0 </span>
                                    </div>                                    
                                </div>                                
                                <div class="col-md-2">                                	
                                	<div  style="float: right;">
                                         <span><a onclick="editblog(${article.article_id});" style="padding-right: ;">编辑</a>|</span>
                                     <a id="a" href="#new_article" data-toggle="tab">编辑2</a>
                                        <a onclick="sss();">sss</a>
                                        <span><a onclick="deleteArticle(${article.article_id});" >删除</a></span>
                                    </div>                                    
                                </div> 
                            </div>
                    </div>
                    </c:forEach>
                        <hr class="line">
                    

                    <center>
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
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
                                    <span aria-hidden="true">»</span>
                                </a>
                            </li>
                        </ul>
                    </center>
                    
                    
                </div>

                <!--category_management -->
                <div class="tab-pane fade" id="category_management">

                    <table style="width:100%;border-bottom: solid 1px #f5f5f5;border-bottom-color: #f0f0f0;" cellspacing="0">
                        <tbody>
                            <tr class="">
                                <th class="tdleft">类别</th>
                                <th style="width:300px;">操作</th>
                            </tr>
                        </tbody>
                    </table>

                    <div style="padding-top: 20px;">
                        <input type="text" class="form-control" style="width:700px;float:left; border: solid 1px #ccc; padding-left: 40px;">
                        <input type="button" class="btn btn-primary btn-large" style="height: 30px;padding-top: 6px;" value="添加分类">
                    </div>
                </div>

                <!--recycle_bin -->
                <div class="tab-pane fade" id="recycle_bin">

                    <table style="width:100%;padding: 12px 4px 2px 4px;border-bottom: solid 1px #f5f5f5;border-bottom-color: #f0f0f0;" cellspacing="0">
                        <tbody>
                            <tr class="">
                                <th class="tdleft">标题</th>
                                <th style="width:70px;">状态</th>
                                <th style="width:50px;">阅读</th>
                                <th style="width:50px;">收藏</th>
                                <th style="width:50px;">评论</th>
                                <th style="width:100px;">评论权限</th>
                                <th style="width:100px;">操作</th>
                            </tr>
                            
                        </tbody>
                    </table>
                    <c:forEach items="${deleteBlogList}" var="delete_article">
                    <div class="box">
                            <div class="row">
                                <div class="col-md-6">                                	
                                    <a href="#"><h6 class="blogName">${delete_article.article_name }(${delete_article.date})</h6></a>
                                </div>      
                                                          
                                <div class="col-md-4">                                    
                                    <div class="info" style="float: right;">
                                        <span>${delete_article.statu }</span>
                                        <span style="width:30px">${delete_article.view_number }</span>
                                        <span>${delete_article.like_num }</span>
                                        <span>0 </span>
                                    </div>                                    
                                </div>                                
                                <div class="col-md-2">                                	
                                	<div  style="float: right;">
                                        <span><a onclick="RecoverArticle(${delete_article.article_id});" >恢复</a></span>
                                    </div>                                    
                                </div> 
                            </div>
                    </div>
                    </c:forEach>
                    <center>
                        <ul class="pagination">
                            <li>
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">«</span>
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
                                    <span aria-hidden="true">»</span>
                                </a>
                            </li>
                        </ul>
                    </center>

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

  
        <script type="text/javascript" src="../froala_editor/js/froala_editor.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/align.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/code_beautifier.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/code_view.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/colors.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/draggable.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/emoticons.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/font_size.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/font_family.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/image.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/file.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/image_manager.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/line_breaker.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/link.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/lists.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/paragraph_format.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/paragraph_style.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/video.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/table.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/url.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/entities.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/char_counter.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/inline_style.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/save.min.js"></script>
        <script type="text/javascript" src="../froala_editor/js/plugins/fullscreen.min.js"></script>

        <script>
            $(function() {
                $('#edit').froalaEditor({
                    height: 300
                })
            });
            
            $(function() {
            	/* var content=${article.content};
            	alert(content); */
            	    
            	//alert( "${article.content}" );
            	
            	if("${firstTitle}"=="原创") {   $("#selType").get(0).selectedIndex = 1; }	
            	if("${firstTitle}"=="转载") { $("#selType").get(1).selectedIndex = 1; }	
            	if("${firstTitle}"=="翻译") { $("#selType").get(2).selectedIndex = 1; }	
            	if("${article.type}"=="数据结构")   { $(':radio').val(["数据结构"]); }
            	if("${article.type}"=="编程语言")   { $(':radio').val(["编程语言"]); }
            	if("${article.type}"=="操作系统")   { $(':radio').val(["操作系统"]); }
            	if("${article.type}"=="移动开发")   { $(':radio').val(["移动开发"]); }
            	if("${article.type}"=="物联网")   { $(':radio').val(["物联网"]); }
            	if("${article.type}"=="架构")   { $(':radio').val(["架构"]); }
            	if("${article.type}"=="云计算/大数据")   { $(':radio').val(["云计算/大数据"]); }
            	if("${article.type}"=="游戏开发")   { $(':radio').val(["游戏开发"]); }
            	if("${article.type}"=="运维")   { $(':radio').val(["运维"]); }
            	if("${article.type}"=="数据库")   { $(':radio').val(["数据库"]); }
            	$(".fr-wrapper").children().html("${article.content}");
            		//alert($(".fr-wrapper").children().html());
            });
        </script>
        <script type="text/javascript">
        $("#a").click(function(){
        	alert("ssss");
        });
        
        function sss(){
        	alert("sss");
        }
        
        function editblog(id){
        	window.location.href = "<%=path%>/pages/postedit.jsp#new_article";
     			<%-- window.location.href = "<%=path%>/pages/updateBlog"; --%>
   			
    		}
        
        
        function deleteArticle(id){
        	var isdel=confirm("确认要删除吗?");
        	if(isdel){
    			window.location.href = "<%=path%>/pages/deleteArticle?article_id="+id;
    			alert("已删除！");
    		}
        }
        function RecoverArticle(id){
        	var isdel=confirm("确认要恢复吗?");
        	if(isdel){
    			window.location.href = "<%=path%>/pages/recoverArticle?article_id="+id;
    		}
        }
        
        function submit(){
        	alert("发表成功");
        	var content=$(".fr-wrapper").children().html();
        	var url="<%=path%>/pages/commitUpdateBlog?id=${article.article_id}&content="+content;
        	//alert(url);
        	$("#editContent").attr("action",url).submit();
       }
        </script>
    </body>

</html>