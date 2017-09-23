package com.Blog.proxy;

import java.lang.reflect.Proxy;
import java.sql.Connection;

import com.Blog.Utils.JDBCUtils;


public class ServiceProxy {

	@SuppressWarnings("unchecked")
	public static <T> T getProxy(T target) {
		return (T) Proxy.newProxyInstance(target.getClass().getClassLoader(), target.getClass().getInterfaces(),
				(proxy, method, args) -> {
					Connection conn = JDBCUtils.getConnection();
					conn.setAutoCommit(false);
					Object result = null;
					try {
						result = method.invoke(target, args);
						conn.commit();
					} catch (Exception e) {
						e.printStackTrace();
						conn.rollback();
					}
					return result;
				});

	}
}
