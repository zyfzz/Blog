package com.Blog.Servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Blog.Utils.BeanFactory;
import com.Blog.bean.Article;
import com.Blog.bean.Collection;
import com.Blog.bean.Comment;
import com.Blog.bean.UserInfo;
import com.Blog.service.BlogService;
import com.Blog.service.BlogServiceImpl;
import com.Blog.service.CommentsService;
import com.Blog.service.CommentsServiceImpl;
import com.Blog.service.UserInfoService;
import com.Blog.service.UserInfoServiceImpl;

import sun.misc.BASE64Encoder;

@WebServlet("/pages/blogServlet")
public class blogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BlogService blogService = BeanFactory.getBean(BlogServiceImpl.class);
	UserInfoService userInfoService = BeanFactory.getBean(UserInfoServiceImpl.class);
	CommentsService commentsService = BeanFactory.getBean(CommentsServiceImpl.class);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag = request.getParameter("flag");
		switch (flag) {
		case "blogDetail":
			blogDetail(request, response);
			break;
		case "like":
			like(request, response);
			break;
		case "dislike":
			dislike(request, response);
			break;
		case "addcomment":
			addComment(request, response);
			break;
		case "collectornot":
			collectornot(request,response);
			break;

		}

		/**
		 * 在所有需要进入blog.jsp页面的地方（比如：点击博文标题进入blog.jsp） 提交请求到 /blogServlet?flag=blogDetail
		 */

	}

	private void collectornot(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		Integer article_id = Integer.parseInt(request.getParameter("blogid"));
		String user_ids = request.getParameter("user_id");
		System.out.println(user_ids);
		Integer user_id = Integer.parseInt(user_ids);
		String  article_name = request.getParameter("article_name");
		String  user_name = request.getParameter("user_name");

		String  operation = request.getParameter("operation");
		switch (operation) {
		case "collect":
		
			collect(article_id,user_id,article_name,user_name,request,response);
			break;
		case "cancle":
			cancle(article_id,user_id,request,response);
			break;
		}
	}

	private void collect(Integer article_id, Integer user_id, String article_name, String user_name,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		try {
			boolean  b = blogService.collect(article_id,user_id,article_name,  user_name);
			if(b) {
				response.getWriter().println("已收藏");
			}else {
				response.getWriter().println("");
			}
		} catch (Exception e) {
			response.getWriter().println("");
			e.printStackTrace();
		}
		
	}

	private void cancle(Integer article_id, Integer user_id, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		try {
			boolean  b = blogService.cancle(article_id,user_id);
			if(b) {
				response.getWriter().println("收藏");
			}else {
				response.getWriter().println("");
			}
		} catch (Exception e) {
			response.getWriter().println("");
			e.printStackTrace();
		}
		
	}

	private void like(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			String article_id = request.getParameter("blogid");
			Integer likenum = Integer.parseInt(request.getParameter("likenum"));
			blogService.like(article_id, likenum);
			likenum = likenum + 1;
			Article article = (Article)session.getAttribute("blog");
			article.setDislike_num(likenum);
			session.setAttribute("blog", article);
			response.getWriter().println(likenum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void dislike(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			String article_id = request.getParameter("blogid");
			Integer dislikenum = Integer.parseInt(request.getParameter("dislikenum"));
			blogService.dislike(article_id, dislikenum);
			dislikenum = dislikenum + 1;
			Article article = (Article)session.getAttribute("blog");
			article.setDislike_num(dislikenum);
			session.setAttribute("blog", article);
			response.getWriter().println(dislikenum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	private void addComment(HttpServletRequest request, HttpServletResponse response) {
		try {
			String commentcontent  = request.getParameter("commentcontent");
			int article_id =  Integer.parseInt( request.getParameter("article_id"));
			int user_id =  Integer.parseInt( request.getParameter("user_id"));
			HttpSession session = request.getSession();
//			UserInfo userInfo   =  (UserInfo) session.getAttribute("userInfo");
			
//			Integer user_id =userInfo.getUser_id();
			Comment comment = new Comment(article_id,user_id,commentcontent);
			commentsService.addComment(comment);
			List<Map<String, Object>> commentsList = commentsService.queryCommentsByBlogId(article_id);
			session.setAttribute("commentsList", commentsList);
			session.setAttribute("commentscount", commentsList.size());
			response.sendRedirect(request.getContextPath()+"/pages/blog.jsp");
//			request.getRequestDispatcher(request.getContextPath()+"/pages/blog.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	private void blogDetail(HttpServletRequest request, HttpServletResponse response) {

		try {
			Collection collection = null;
			HttpSession session  = request.getSession();
			BASE64Encoder encoder = new BASE64Encoder();
			String  suser_id = request.getParameter("user_id");
			
			Integer blogId = Integer.parseInt(request.getParameter("blogId"));
			if(suser_id==null) {
				
			}else {
				//用户是否已经收藏该博客
				Integer user_id = Integer.parseInt(suser_id);
				collection = blogService.queryCollection(user_id,blogId);
			}
			// 获取博文详情
			Article blog = blogService.queryArticleById(blogId);
			// 获取对应博文下的所有评论
			List<Map<String, Object>> commentsList = commentsService.queryCommentsByBlogId(blog.getArticle_id());
			// 获取对应博文的作者
			UserInfo userInfo = userInfoService.queryUserInfoByBlogId(blog.getArticle_id());
			List<Article> hotViewBlog = blogService.queryforHotBlog(userInfo.getUser_id());
//			List<Article> hotCommBlog = blogService.queryforCommBlog(userInfo.getUser_id());
			session.setAttribute("author", userInfo);
			String url = "data:image/png;base64," + encoder.encode(userInfo.getHeadshot());
			session.setAttribute("hotViewBlog", hotViewBlog);
//			session.setAttribute("hotCommBlog", hotCommBlog);
			session.setAttribute("collect", collection);
			session.setAttribute("authorheadshot", url);
			session.setAttribute("commentsList", commentsList);
			session.setAttribute("blog", blog);
			session.setAttribute("commentscount", commentsList.size());

			request.getRequestDispatcher( "/pages/blog.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
