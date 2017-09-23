package com.Blog.Utils;

import com.Blog.proxy.ServiceProxy;

public class BeanFactory {

	public static <T> T getBean(Class<T> clazz){
		T obj = null;
		try {
			obj = clazz.newInstance();
			if(clazz.getName().endsWith("SeviceImpl")){
				obj = ServiceProxy.getProxy(obj);
			}
		} catch (InstantiationException | IllegalAccessException e) {
			e.printStackTrace();
		}
		return obj;
	}
}
