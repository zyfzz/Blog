package com.Blog.service;

import java.util.List;

import com.Blog.bean.Article;
import com.Blog.bean.Collection;

public interface BlogService {

	Article queryArticleById(Integer blogId) throws Exception;

	void like(String article_id, Integer likenum) throws Exception;

	void dislike(String article_id, Integer dislikenum)throws Exception;

	boolean collect(Integer article_id, Integer user_id)throws Exception;

	boolean collect(Integer article_id, Integer user_id, String article_name, String user_name) throws Exception;

	boolean cancle(Integer article_id, Integer user_id)throws Exception;

	Collection queryCollection(Integer user_id, Integer blogId)throws Exception;

	List<Article> queryforHotBlog(Integer user_id)throws Exception;

}
