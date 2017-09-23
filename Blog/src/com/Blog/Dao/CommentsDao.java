package com.Blog.Dao;

import java.util.List;
import java.util.Map;

import com.Blog.bean.Comment;

public interface CommentsDao {

	List<Map<String, Object>> queryCommentsByBlogId(int article_id) throws Exception;

	void addComment(Comment comment)throws Exception;

}
