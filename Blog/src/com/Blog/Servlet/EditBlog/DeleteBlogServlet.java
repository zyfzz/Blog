package com.Blog.Servlet.EditBlog;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Blog.Dao.ArticleDao;
import com.Blog.bean.Article;
import com.Blog.bean.Article_Delete;
@WebServlet("/pages/deleteArticle")
public class DeleteBlogServlet extends HttpServlet{

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
		String article_id=req.getParameter("article_id");
		ArticleDao articleDao=new ArticleDao();
		
		Article article=articleDao.getArticleInfoByArticleId(Integer.parseInt(article_id));
		articleDao.addArticleDelete(article);
		articleDao.deleteArticle(Integer.parseInt(article_id));
		/*article_delete.setArticle_id(article.getArticle_id());
		article_delete.setArticle_name(article.getArticle_name());
		article_delete.setContent(article.getContent());
		article_delete.setDelete_date(article.get);
		article_delete.setDigest(digest);
		article_delete.setType(type);
		article_delete.setUser_id(user_id);*/
		req.getRequestDispatcher("BlogManager").forward(req, resp);
		PrintWriter p=resp.getWriter();
		p.print(article.getArticle_name());
	}

}
