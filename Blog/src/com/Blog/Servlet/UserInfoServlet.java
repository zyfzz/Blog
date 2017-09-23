package com.Blog.Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.IOUtils;

import com.Blog.Utils.BeanFactory;
import com.Blog.bean.Article;
import com.Blog.bean.Collection;
import com.Blog.bean.UserInfo;
import com.Blog.service.BlogService;
import com.Blog.service.BlogServiceImpl;
import com.Blog.service.UserInfoService;
import com.Blog.service.UserInfoServiceImpl;

import sun.misc.BASE64Encoder;

@WebServlet("/pages/UserInfoServlet")
@MultipartConfig
public class UserInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserInfoService userInfoService = BeanFactory.getBean(UserInfoServiceImpl.class);
    BlogService blogService = BeanFactory.getBean(BlogServiceImpl.class);
	public UserInfoServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String flag = request.getParameter("flag");
		String user_idd = request.getParameter("user_id");
		String isauthorId = request.getParameter("isauthorId");
		System.out.println(user_idd);
		if(user_idd==null) {
			user_idd="-1";
		}
		Integer user_id =Integer.parseInt(user_idd);
		switch (flag) {
		case "signup":
			signup(request, response);
			break;
		case "signin":
			signin(request, response);
			break;
		case "signout":
			signout(request, response);
			break;
		case "modify":
			modify(request, response);
			break;
		case "getBlogList":
			if("true".equals(isauthorId)) {
				getAuthorBlogList(user_id, request, response);
				request.getRequestDispatcher("authorInfo.jsp").forward(request, response);
				break;
			}
			getBlogList(user_id,request, response);
			request.getRequestDispatcher("home.jsp").forward(request, response);
			break;
		case "seeauthor":
			seeauthor(request,response);
			break;
		}

	}

	private void seeauthor(HttpServletRequest request, HttpServletResponse response) {

		Integer  authorId = Integer.parseInt( request.getParameter("authorId"));
		UserInfo authorInfo;
		try {
			HttpSession session = request.getSession();
			BASE64Encoder encoder = new BASE64Encoder();
			authorInfo = userInfoService.getAuthorInfo(authorId);
			String url = "data:image/png;base64,"+ encoder.encode(authorInfo.getHeadshot());
			List<Article> hotViewBlog = blogService.queryforHotBlog(authorId);
			session.setAttribute("authorInfo", authorInfo);
			session.setAttribute("authorImage", url);
			session.setAttribute("hotViewBlog", hotViewBlog);

			getAuthorBlogList(authorId,request, response);
			request.getRequestDispatcher("/pages/authorInfo.jsp").forward(request, response);
		} catch (Exception e) {

			e.printStackTrace();
		}
		
	}

	private void modify(HttpServletRequest request, HttpServletResponse response) {

		try {
			String truename = request.getParameter("truename");
			String job = request.getParameter("job");
			String email = request.getParameter("email");
			String trade = request.getParameter("trade");
			String sex = request.getParameter("sex");
			String country = request.getParameter("country");
			String city = request.getParameter("province");
			String introduction = request.getParameter("introduction");
			HttpSession session = request.getSession();
			UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
			userInfo.setCity(city);
			userInfo.setCountry(country);
			userInfo.setEmail(email);
			userInfo.setIntroduction(introduction);
			userInfo.setJob(job);
			userInfo.setTrade(trade);
			userInfo.setSex(sex);
			userInfo.setTruename(truename);

			// 接收上传的文件对象
			Part part = request.getPart("image");
			InputStream in = part.getInputStream();
			byte[] image = IOUtils.toByteArray(in);
			userInfo.setHeadshot(image);
			userInfoService.modify(userInfo);
			session.setAttribute("userInfo", userInfo);
			
			signin( request, response);
//			session.setAttribute("image", image);
//			response.sendRedirect(request.getContextPath() + "/pages/home.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void signout(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			session.removeAttribute("userInfo");
			response.sendRedirect(request.getContextPath() + "/pages/account.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void signin(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		UserInfo userInfo = new UserInfo();
		userInfo = (UserInfo) session.getAttribute("userInfo");
		try {
			if (userInfo == null) {
				userInfo = new UserInfo();
				String username = request.getParameter("signin_name");
				String password = request.getParameter("signin_password");
				userInfo.setUsername(username);
				userInfo.setPassword(password);
			}

			Map<String, Object> userInfomap = userInfoService.signin(userInfo);
			if (userInfomap.containsKey("msg")) {
				// 登录失败
				session.setAttribute("error", userInfomap);
				request.getRequestDispatcher("account.jsp").forward(request, response);
			} else {
				// 登录成功
				session.setAttribute("userInfo", userInfomap.get("userInfo"));
				session.setAttribute("imageURL", userInfomap.get("image"));
				int user_id=((UserInfo)userInfomap.get("userInfo")).getUser_id();
				getBlogList(user_id,request,response);
				getCollections(user_id,request,response);
				request.getRequestDispatcher("home.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void getCollections(int user_id, HttpServletRequest request, HttpServletResponse response) {
		
		
		try {
			List<Collection> list = userInfoService.getCollections(user_id);
			HttpSession session = request.getSession();
			session.setAttribute("Collections",list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	private void getAuthorBlogList(int user_id ,HttpServletRequest request, HttpServletResponse response) {

		try {
			
			String current = request.getParameter("currentPage");
			if (current == null) {
				current = "1";
			}
			// 当前页
			int currentPage = Integer.parseInt(current);
			// 每一页显示数据的条数
			int pageSize = 3;
			// 资源信息总记录数
			int count;
			count = userInfoService.countMyBlog(user_id);
			// 总页码
			int totalPage = (count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
			// 开始位置
			int start = (currentPage - 1) * pageSize + 1;
			// 结束位置
			int end = currentPage * pageSize;
			List<Map<String, Object>> blogList = userInfoService.queryMyBlog(user_id,start, end);
			request.setAttribute("blogList", blogList);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
			//request.getRequestDispatcher(request.getContextPath() + "/pages/home.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void getBlogList(int user_id ,HttpServletRequest request, HttpServletResponse response) {

		try {
			
			String current = request.getParameter("currentPage");
			if (current == null) {
				current = "1";
			}
			HttpSession session = request.getSession();
			UserInfo userInfo = new UserInfo();
			userInfo = (UserInfo) session.getAttribute("userInfo");
			int id = userInfo.getUser_id();
			// 当前页
			int currentPage = Integer.parseInt(current);
			// 每一页显示数据的条数
			int pageSize = 3;
			// 资源信息总记录数
			int count;
			count = userInfoService.countMyBlog(id);
			// 总页码
			int totalPage = (count % pageSize == 0 ? count / pageSize : count / pageSize + 1);
			// 开始位置
			int start = (currentPage - 1) * pageSize + 1;
			// 结束位置
			int end = currentPage * pageSize;
			List<Map<String, Object>> blogList = userInfoService.queryMyBlog(user_id,start, end);
			request.setAttribute("blogList", blogList);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
			//request.getRequestDispatcher(request.getContextPath() + "/pages/home.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void signup(HttpServletRequest request, HttpServletResponse response) {

		try {
			String username = request.getParameter("signup_name");
			String password = request.getParameter("signup_password");
			String email = request.getParameter("signup_email");

			UserInfo userInfo = new UserInfo(username, password, email);
			Map<String, Object> map = userInfoService.signup(userInfo);

			if (map.containsKey("signupsuccess")) {
				response.sendRedirect(request.getContextPath() + "/pages/account.jsp");
			}
			if (map.containsKey("signupfail")) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
