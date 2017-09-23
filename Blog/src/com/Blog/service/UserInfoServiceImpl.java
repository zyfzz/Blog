package com.Blog.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.Blog.Dao.UserInfoDao;
import com.Blog.Dao.UserInfoDaoImpl;
import com.Blog.Utils.BeanFactory;
import com.Blog.bean.Collection;
import com.Blog.bean.UserInfo;

import sun.misc.BASE64Encoder;

public class UserInfoServiceImpl implements UserInfoService {

	UserInfoDao  userInfoDao = BeanFactory.getBean(UserInfoDaoImpl.class);
	@Override
	public Map<String, Object> signup(UserInfo userInfo) throws Exception {

		boolean  b= userInfoDao.signup(userInfo);
		Map<String ,Object >  map = new HashMap<String ,Object > ();
		if(b) {
			map.put("signupsuccess", "注册成功!");
		}else {
			map.put("signupfail", "注册失败!请稍后重试!");
		}
		return map;
	}
	@Override
	public void modify(UserInfo userInfo) throws Exception {

		userInfoDao.modify(userInfo);
	}
	@Override
	public int countMyBlog(int id) throws Exception {

		return userInfoDao.countMyBlog( id );
		
	}
	@Override
	public List<Map<String, Object>> queryMyBlog(int user_id,int start, int end) throws Exception {
		return userInfoDao.queryMyBlog(user_id,start, end);
	}
	@Override
	public UserInfo queryUserInfoByBlogId(int article_id) throws Exception {
		
		return userInfoDao.queryUserInfoByBlogId(article_id);
	}

	public static void main(String[] args) throws Exception {
		List<Map<String, Object>> list=new ArrayList<Map<String, Object>>();
		UserInfoService userInfoService=new UserInfoServiceImpl();
		list=userInfoService.queryMyBlog(4493,0, 3);
		System.out.println(list);
			
			
			
			
		
	}
	@Override
	public List<Collection> getCollections(int user_id) throws Exception {
		
		return userInfoDao.getCollections(user_id);
	}
	@Override
	public UserInfo getAuthorInfo(Integer authorId) throws Exception {
		
		return userInfoDao.getAuthorInfo( authorId);
	}
	@Override
	public Map<String, Object> signin(UserInfo userInfo) throws Exception {
		
		Map<String ,Object >  map = new HashMap<String ,Object > ();
		UserInfo auserInfo = userInfoDao.signin(userInfo);
		if(auserInfo == null) {
			map.put("msg", "用户不存在");
			return map;
		}
		boolean b =auserInfo.getPassword().equals(userInfo.getPassword());
		if(!b) {
			map.put("msg","用户名或者密码不正确");
		}else {
			//登录成功
			map.put("userInfo", auserInfo);
			if(auserInfo.getHeadshot()!=null) {
				BASE64Encoder encoder = new BASE64Encoder();
				String url = "data:image/png;base64,"+ encoder.encode(auserInfo.getHeadshot());
				map.put("image", url);
			}else {
				map.put("image", auserInfo.getUsername());				
			}
		}
		return map;
	}
}
