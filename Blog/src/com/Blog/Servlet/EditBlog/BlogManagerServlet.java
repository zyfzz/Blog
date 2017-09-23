package com.Blog.Servlet.EditBlog;

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
import com.Blog.bean.UserInfo;
@WebServlet("/pages/BlogManager")
public class BlogManagerServlet extends HttpServlet{

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
		List<Article> delete_list=new ArrayList<Article>();
		ArticleDao articleDao=new ArticleDao();
		UserInfo userinfo=(UserInfo) req.getSession().getAttribute("userInfo");
		int user_id=userinfo.getUser_id();
		list=articleDao.getArticleInfoByUserId(user_id);
		delete_list=articleDao.getDeletedArticleInfoByUserId(user_id);
		req.setAttribute("BlogList", list);
		req.setAttribute("deleteBlogList", delete_list);
		/*PrintWriter p=resp.getWriter();
		p.print(list.get(0).getArticle_name());*/
		req.getRequestDispatcher("postedit.jsp").forward(req, resp);
	}

}
