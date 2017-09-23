package com.Blog.Dao;

import java.util.List;

import com.Blog.Utils.JDBCUtils;
import com.Blog.bean.Article;
import com.Blog.bean.Collection;

public  class BlogDaoImpl implements BlogDao {

	@Override
	public Article queryArticleById(Integer blogId) throws Exception {

		String sql = "select * from article where article_id = ? ";
		String sql2 = 		 " update article set view_number=view_number+1 where article_id=? ";
		JDBCUtils.update(sql2, blogId);
		return JDBCUtils.queryForObject(sql, Article.class, blogId);
	}

	@Override
	public void like(String article_id ,Integer likenum) throws Exception {

		int article_id1 = Integer.parseInt(article_id);
		likenum = likenum+1;
		String sql ="update article set like_num = ? where article_id = ?";
		JDBCUtils.update(sql, likenum,article_id1);
	}

	@Override
	public void dislike(String article_id, Integer dislikenum) throws Exception {
		int article_id1 = Integer.parseInt(article_id);
		dislikenum = dislikenum+1;
		String sql ="update article set dislike_num = ? where article_id = ?";
		JDBCUtils.update(sql, dislikenum,article_id1);
		
	}

	@Override
	public boolean collect(Integer article_id, Integer user_id) throws Exception {

		return false;
	}

	@Override
	public boolean collect(Integer article_id, Integer user_id, String article_name, String user_name) throws Exception {
		String sql ="insert into collection values(?,?,?,?,?)";
		return JDBCUtils.update(sql, (int)(Math.random()*1000),user_id,user_name,article_id,article_name);
	}

	@Override
	public boolean cancle(Integer article_id, Integer user_id) throws Exception {

		String sql ="delete from collection where article_id=? and user_id= ? ";
		return JDBCUtils.update(sql, article_id,user_id);
	}

	@Override
	public Collection queryCollection(Integer user_id, Integer blogId) throws Exception {
		String sql = "select * from collection where user_id = ? and article_id = ?";
		return JDBCUtils.queryForObject(sql, Collection.class, user_id ,blogId);
	}

	@Override
	public List<Article> queryforHotBlog(Integer user_id) throws Exception {

		String sql = "select * from article where user_id = ? order by view_number desc limit 1,5";
		return JDBCUtils.queryForList(sql, Article.class, user_id);
	}
}
