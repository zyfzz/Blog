package com.blog.manager;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class AdminDao {
	private DBUtil dbu = DBUtil.getDBUInstance();
	
	/**
	 * 管理员登录，若查找到管理员信息返回true ,若查找不到返回false
	 * @param adminId
	 * @param passwd
	 * @return
	 */
	public boolean login(String adminId, String passwd){
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		boolean  flag = false;
		String sql = "select * from admin where admin_id = '" + adminId + "' and admin_passwd = '" + passwd + "' ";
		try{
			conn = dbu.getDBConn();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if(rs.next()){
				flag = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbu.close(rs);
			dbu.close(stat);
			dbu.close(conn);
		}
		
		return flag;
	}
	/**
	 * 显示所有未审核的博文
	 * @return
	 */
	public  ArrayList<Article>  articleList(String statu,String article_id,String article_name){
		ArrayList<Article>  aList = new ArrayList<Article>(100);
		Connection conn = null;
		Statement stat = null;
		Article a = null;
		ResultSet rs = null;
		String sql = "select * from  article where  1=1 ";
		if(statu != null && !"".equals(statu)){
			sql =  sql + "  and statu = '" + statu + "' ";
		}
		if(article_id != null && !"".equals(article_id)){
			sql = sql + " and article_id = '" + article_id + "' ";
		}
		if(article_name != null && !"".equals(article_name)){
			sql = sql + " and article_name  like '%" + article_name +"%' ";
		}
		try{
			conn = dbu.getDBConn();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while(rs.next()){
				a = new Article();
				a.setArticle_id(rs.getInt(1));
				a.setArticle_name(rs.getString(3));
				a.setDate(rs.getString(4));
				a.setStatu(rs.getString(11));
				aList.add(a);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbu.close(rs);
			dbu.close(stat);
			dbu.close(conn);
		}
		
		return aList;
	}
	/**
	 * 根据博文编号查找博文内容
	 * @param article_id
	 * @return
	 */
	public Article showArticle(int article_id){
		Connection conn = null;
		Statement stat = null;
		Article a = null;
		ResultSet rs = null;
		String sql = "select content from article where article_id = " + article_id;
		try{
			conn = dbu.getDBConn();
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			while(rs.next()){
				a = new Article();
				a.setContent(rs.getString(1));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbu.close(rs);
			dbu.close(stat);
			dbu.close(conn);
		}
		
		return a;
	}
	/**
	 * 审核通过将  审核状态设置为 true
	 * @param article_id
	 * @return
	 */
	public boolean checkArticle(int article_id){
		Connection conn = null;
		Statement stat = null;
		String sql = "update article set statu = '已审核' where article_id =  " + article_id;
		int isTrue = 0;
		try{
			conn = dbu.getDBConn();
			stat = conn.createStatement();
			isTrue = stat.executeUpdate(sql);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbu.close(stat);
			dbu.close(conn);
		}
		
		if(isTrue > 0){
			return true;
		}
		return false;
	}
	/**
	 * 审核未通过，根据博文编号删除博文
	 * @param article_id
	 * @return
	 */
	public boolean articleDelete(int article_id){
		Connection conn = null;
		Statement stat = null;
		String sql = "delete from article where article_id =  " + article_id;
		int isTrue = 0;
				
				try{
					conn = dbu.getDBConn();
					stat = conn.createStatement();
					isTrue = stat.executeUpdate(sql);
					
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					dbu.close(stat);
					dbu.close(conn);
				}
				
				if(isTrue > 0){
					return true;
				}
				
		return false;
	}

}

