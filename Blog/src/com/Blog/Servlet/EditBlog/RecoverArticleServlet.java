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
@WebServlet("/pages/recoverArticle")
public class RecoverArticleServlet extends HttpServlet{

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
		Article article=articleDao.getDeletedArticleInfoByArticleId(Integer.parseInt(article_id));
		articleDao.addDeletedArticleToArticle(article);
		articleDao.deleteArticle_Delete(Integer.parseInt(article_id));
		req.getRequestDispatcher("BlogManager").forward(req, resp);
		/*PrintWriter p=resp.getWriter();
		p.print(article_id);*/
	}
	
}
