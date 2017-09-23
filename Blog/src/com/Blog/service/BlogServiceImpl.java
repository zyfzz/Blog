package com.Blog.service;

import java.util.List;

import com.Blog.Dao.BlogDao;
import com.Blog.Dao.BlogDaoImpl;
import com.Blog.Utils.BeanFactory;
import com.Blog.bean.Article;
import com.Blog.bean.Collection;

public class BlogServiceImpl implements BlogService {

	
	BlogDao blogDao  = BeanFactory.getBean(BlogDaoImpl.class);
	
	@Override
	public Article queryArticleById(Integer blogId) throws Exception {
		return blogDao.queryArticleById(blogId);
	}

	@Override
	public void like(String article_id,Integer likenum) throws Exception {

		blogDao.like(article_id,likenum);
	}

	@Override
	public void dislike(String article_id, Integer dislikenum) throws Exception {
		blogDao.dislike(article_id,dislikenum);		
	}

	@Override
	public boolean collect(Integer article_id, Integer user_id) throws Exception {
		return blogDao.collect( article_id, user_id);

	}

	@Override
	public boolean collect(Integer article_id, Integer user_id, String article_name, String user_name) throws Exception {
		
		return blogDao.collect( article_id, user_id,article_name,user_name);
	}

	@Override
	public boolean cancle(Integer article_id, Integer user_id) throws Exception {

		return blogDao.cancle( article_id, user_id);
	}

	@Override
	public Collection queryCollection(Integer user_id, Integer blogId) throws Exception {

		
		return blogDao.queryCollection( user_id,  blogId);
	}

	@Override
	public List<Article> queryforHotBlog(Integer user_id) throws Exception {

		
		return blogDao.queryforHotBlog(user_id)	;
	}

}
