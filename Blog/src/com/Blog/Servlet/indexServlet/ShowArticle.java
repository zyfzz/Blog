package com.Blog.Servlet.indexServlet;

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

import sun.misc.BASE64Encoder;
@WebServlet("/ShowAllArticle")
public class ShowArticle extends HttpServlet{

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
		BASE64Encoder encoder = new BASE64Encoder();
		List<Article> list=new ArrayList<Article>();
		List<String> urlList=new ArrayList<String>();
		List<Article> OrderByViewlist=new ArrayList<Article>();
		List<Article> OrderByLikenumlist=new ArrayList<Article>();
		List<Article> OrderByDatelist=new ArrayList<Article>();
		String article_name=req.getParameter("article_name");
		ArticleDao articleDao=new ArticleDao();
		list=articleDao.getAllArticleInfo(article_name);
		OrderByViewlist=articleDao.getAllArticleOrderByViews();
		OrderByLikenumlist=articleDao.getAllArticleOrderByLikenum();
		OrderByDatelist=articleDao.getAllArticleOrderByDate();
		for (Article article : list) {
			String url=null;
			if(article.getUser().getHeadshot()==null){
				url=req.getContextPath()+"/images/ava-1.jpg";
			}
			else {
				
				url = "data:image/png;base64,"+ encoder.encode(article.getUser().getHeadshot());
			}
			urlList.add(url);
		}
		
		//String loginStatus="false";
		//req.getSession().setAttribute("loginStatus", loginStatus);
		req.setAttribute("ArticleList",list);
		req.setAttribute("OrderByViewlist",OrderByViewlist);
		req.setAttribute("OrderByLikenumlist",OrderByLikenumlist);
		req.setAttribute("OrderByDatelist",OrderByDatelist);
		req.setAttribute("urlList",urlList);
		req.getRequestDispatcher("pages/index.jsp").forward(req,resp);
		//System.out.println(list.get(0).getUser());
		//System.out.println(list.get(0).getUser().getUsername());
		PrintWriter pw = resp.getWriter();
		//pw.println(list.get(0).getUser().getHeadshot());
	}
	

}
