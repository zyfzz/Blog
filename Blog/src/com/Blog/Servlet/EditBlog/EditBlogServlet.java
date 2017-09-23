package com.Blog.Servlet.EditBlog;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Blog.Dao.ArticleDao;
import com.Blog.bean.Article;
import com.Blog.bean.UserInfo;
@WebServlet("/pages/EditBlog")
public class EditBlogServlet extends HttpServlet{

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		Article article=new Article();
		ArticleDao articleDao=new ArticleDao();
		String title=req.getParameter("titletype")+"--"+req.getParameter("title");
		String radChl=req.getParameter("radChl");
		String digest=req.getParameter("digest");
		String content=req.getParameter("content");
		UserInfo userinfo=(UserInfo) req.getSession().getAttribute("userInfo");
		Integer user_id=userinfo.getUser_id();
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd: HH:mm:ss");
		String date=df.format(new Date());
		if(digest==null) {
			digest=content.substring(0, 100);
		}
		article.setArticle_name(title);
		article.setType(radChl);
		article.setDigest(digest);
		article.setContent(content);
		article.setUser_id(user_id);
		article.setDate(date);
		article.setStatu("Œ¥…Û∫À");
		articleDao.addNewArticle(article);
		
		//req.getRequestDispatcher("UserInfoServlet?flag=signin").forward(req, resp);
		resp.sendRedirect("UserInfoServlet?flag=signin");
		//PrintWriter p=resp.getWriter();
		//p.println(article.getContent());
		/*p.println("title is "+title);
		p.println("radChl is "+radChl);
		p.println("digest is "+digest);
		p.println("content is "+content);*/
		
	}

	
}
