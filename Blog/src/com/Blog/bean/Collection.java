package com.Blog.bean;

public class Collection {

	private Integer collection_id;
	private Integer user_id ;
	private String user_name ;
	private Integer article_id ;
	private String  article_name ;

	public Collection() {
	}
	
	public Collection( Integer user_id, String user_name, Integer article_id,
			String article_name) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.article_id = article_id;
		this.article_name = article_name;
	}
	
	
	public Collection(Integer collection_id, Integer user_id, String user_name, Integer article_id,
			String article_name) {
		this.collection_id = collection_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.article_id = article_id;
		this.article_name = article_name;
	}
	public Integer getCollection_id() {
		return collection_id;
	}
	public void setCollection_id(Integer collection_id) {
		this.collection_id = collection_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getArticle_id() {
		return article_id;
	}
	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}
	public String getArticle_name() {
		return article_name;
	}
	public void setArticle_name(String article_name) {
		this.article_name = article_name;
	}
	
	
}
