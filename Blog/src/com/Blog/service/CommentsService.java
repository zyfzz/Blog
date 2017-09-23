package com.Blog.service;

import java.util.List;
import java.util.Map;

import com.Blog.bean.Comment;

public interface CommentsService {

	List<Map<String, Object>> queryCommentsByBlogId(int article_id) throws Exception;

	void addComment(Comment comment)throws Exception;

}
