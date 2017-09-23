package com.Blog.Servlet.BlogListServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Blog.Dao.ArticleDao;
import com.Blog.bean.Article;
@WebServlet("/ShowBlogList")
public class BlogListServlet extends HttpServlet{

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
		List<Article> list=new ArrayList<Article>();
		String keyword=req.getParameter("keyword");
		ArticleDao articleDao=new ArticleDao();
		list=articleDao.getAllArticleInfo(keyword);
		req.setAttribute("ArticleList",list);
		req.getRequestDispatcher("pages/bloglist.jsp").forward(req,resp);
		/*PrintWriter pw = resp.getWriter();
		pw.println(keyword);*/
	}

	
}
