package com.Blog.Dao;

import java.util.List;
import java.util.Map;

import com.Blog.Utils.JDBCUtils;
import com.Blog.bean.Comment;

public class CommentsDaoImpl implements CommentsDao {


	@Override
	public List<Map<String, Object>> queryCommentsByBlogId(int article_id) throws Exception {
		 String sql ="select comment.comment_id  comment_id , "
				+ " comment.article_id  comment_article_id , "
				+ " comment.user_id     comment_user_id , "
				+ " comment.content     comment_content , "
				+ " comment.date        comment_date , "
				+ " user_info.username  comment_username, "
				+ " user_info.headshot  comment_headshot "
				+ " from comment , user_info "
				+ " where article_id = ? "
				+ " and comment.user_id = user_info.user_id";
		return JDBCUtils.queryForList(sql, article_id);
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		Integer   comment_id   = (int) Math.random()*100000;
		String sql = "insert  into comment value (?,?,?,?,CURDATE())";
		JDBCUtils.update(sql, comment_id,comment.getArticle_id(),comment.getUser_id(),comment.getContent());
		
	}
}
