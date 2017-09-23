package com.Blog.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Blog.Dao.CommentsDao;
import com.Blog.Dao.CommentsDaoImpl;
import com.Blog.Utils.BeanFactory;
import com.Blog.bean.Comment;

import sun.misc.BASE64Encoder;

public class CommentsServiceImpl implements CommentsService {

	CommentsDao  commentsDao = BeanFactory.getBean(CommentsDaoImpl.class);
	@Override
	public List<Map<String, Object>> queryCommentsByBlogId(int article_id) throws Exception {

		BASE64Encoder encoder = new BASE64Encoder();
		List<Map<String, Object>>  list  = new ArrayList<Map<String, Object>>();
		list=commentsDao.queryCommentsByBlogId( article_id);
//		for (Map<String, Object> map : list) {
//			String url="data:image/png;base64," + encoder.encode((byte[]) map.get("headshot"));
//			map.put("image",url);
//		}
		
		return list;
	}
	@Override
	public void addComment(Comment comment) throws Exception {
		commentsDao. addComment(comment);
		
	}

}
