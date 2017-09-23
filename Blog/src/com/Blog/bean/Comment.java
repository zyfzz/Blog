package com.Blog.bean;

import java.util.Date;

public class Comment {

	private Integer comment_id;
	private Integer article_id;
	private Integer user_id;
	private String content;
	private Date date;

	public Comment() {
	}

	public Comment(Integer article_id, Integer user_id, String content) {
		this.article_id = article_id;
		this.user_id = user_id;
		this.content = content;
		
	}

	public Comment(Integer comment_id, Integer article_id, Integer user_id, String content, Date date) {
		this.comment_id = comment_id;
		this.article_id = article_id;
		this.user_id = user_id;
		this.content = content;
		this.date = date;
	}

	@Override
	public String toString() {
		return "Comment [comment_id=" + comment_id + ", article_id=" + article_id + ", user_id=" + user_id
				+ ", content=" + content + ", date=" + date + "]";
	}

	public Integer getComment_id() {
		return comment_id;
	}

	public void setComment_id(Integer comment_id) {
		this.comment_id = comment_id;
	}

	public Integer getArticle_id() {
		return article_id;
	}

	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
