package com.Blog.service;

import java.util.List;
import java.util.Map;

import com.Blog.bean.Collection;
import com.Blog.bean.UserInfo;

public interface UserInfoService {

	Map<String, Object> signup(UserInfo userInfo)throws Exception;

	Map<String, Object> signin(UserInfo userInfo)throws Exception;

	void modify(UserInfo userInfo)throws Exception;

	int countMyBlog(int id) throws Exception;

	List<Map<String, Object>> queryMyBlog(int user_id,int start, int end) throws Exception;

	UserInfo queryUserInfoByBlogId(int article_id)throws Exception;

	List<Collection> getCollections(int user_id)throws Exception;

	UserInfo getAuthorInfo(Integer authorId)throws Exception;

}
