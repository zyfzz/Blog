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

import sun.misc.BASE64Encoder;
@WebServlet("/ShowBlogListByType")
public class BlogListBytypeServlet extends HttpServlet{

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
		resp.setContentType("text/html;charset=utf-8");
		req.setCharacterEncoding("utf-8");
		List<String> urlList=new ArrayList<String>();
		List<Article> list=new ArrayList<Article>();
		String type=req.getParameter("type");
		ArticleDao articleDao=new ArticleDao();
		list=articleDao.getAllArticleInfoByType(type);
		for (Article article : list) {
			String url=null;
			if(article.getUser().getHeadshot()==null){
				url=req.getContextPath()+"/images/ava-1.jpg";
			}else {
				
				url = "data:image/png;base64,"+ encoder.encode(article.getUser().getHeadshot());
			}
			urlList.add(url);
		}
		req.setAttribute("urlList",urlList);
		req.setAttribute("ArticleList",list);
		req.getRequestDispatcher("pages/bloglist.jsp").forward(req,resp);
		/*PrintWriter p=resp.getWriter();
		p.println(type);*/
	}
	
}
