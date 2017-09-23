package com.blog.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import  com.blog.manager.AdminDao;
/**
 * Servlet implementation class doAdminLoginServlet
 */
@WebServlet("/doAdminLoginServlet")
public class DoAdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoAdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String adminId  = request.getParameter("signin_name");
		String passwd  = request.getParameter("signin_password");
		
		HttpSession session = request.getSession();
		
		AdminDao ad = new AdminDao();
		
		if(ad.login(adminId, passwd)){
			session.setAttribute("adminInfo", adminId + "" + passwd );
			response.sendRedirect("articleList.jsp");
		}else{
			request.setAttribute("MSGError", "账号或者密码错误，请重新输入!");
			request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
