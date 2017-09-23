package com.blog.manager;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	private static DBUtil dbu = null;
	
	private String url  = "jdbc:mysql://192.168.43.7:3306/blog?useSSL=false";
	private String dbDriver = "com.mysql.jdbc.Driver";
	private String userName = "root";
	private String passwd = "123456";
	private DBUtil(){
		
	}
	
	public static DBUtil getDBUInstance(){
		if(dbu == null){
			return dbu = new DBUtil();
		}
		return dbu;
	}
	
	public Connection  getDBConn() throws Exception{
		try{
		Class.forName(dbDriver);
		return DriverManager.getConnection(url,userName,passwd);
		}catch(ClassNotFoundException e){
			throw new ClassNotFoundException("数据库驱动异常!");
		} catch(SQLException e){
			throw new SQLException("数据库连接异常 !");
		}
	}
	/**
	 * 数据库关闭方法。
	 * @param conn
	 */
	public void close(Connection conn){
		try{
			if(conn != null){
				conn.close();
			}
		}catch(SQLException e){
			System.out.println("数据库链接关闭异常！！");
		}
	}
	
	/**
	 * 
	 * @param stat
	 */
	public void close(Statement stat){
		try{
			if(stat != null){
				stat.close();
			}
		}catch(SQLException e){
			System.out.println("Statement关闭异常！！");
		}
	}
	
	/**
	 * 
	 * @param stat
	 */
	public void close(ResultSet rs){
		try{
			if(rs != null){
				rs.close();
			}
		}catch(SQLException e){
			System.out.println("结果集关闭异常！！");
		}
	}
}
