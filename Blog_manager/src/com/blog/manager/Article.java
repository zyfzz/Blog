package com.blog.manager;

public class Article {

	private int	article_id;
	private int	user_id;
	private String	article_name;
	private String	date;
	private int	view_number;
	private String	content;
	private String	digest;
	private String	type;
	private int like_num;
	private int dislike_num;
	private UserInfo user;
	private String	statu;
	
	/**
	 * @return the statu
	 */
	public String getStatu() {
		return statu;
	}
	/**
	 * @param statu the statu to set
	 */
	public void setStatu(String statu) {
		this.statu = statu;
	}
	/**
	 * @return the user
	 */
	public UserInfo getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(UserInfo user) {
		this.user = user;
	}
	/**
	 * @return the digest
	 */
	public String getDigest() {
		return digest;
	}
	/**
	 * @param digest the digest to set
	 */
	public void setDigest(String digest) {
		this.digest = digest;
	}
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	
	
	/**
	 * @return the article_id
	 */
	public int getArticle_id() {
		return article_id;
	}
	/**
	 * @param article_id the article_id to set
	 */
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	/**
	 * @return the user_id
	 */
	public int getUser_id() {
		return user_id;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	/**
	 * @return the article_name
	 */
	public String getArticle_name() {
		return article_name;
	}
	/**
	 * @param article_name the article_name to set
	 */
	public void setArticle_name(String article_name) {
		this.article_name = article_name;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	/**
	 * @return the view_number
	 */
	public int getView_number() {
		return view_number;
	}
	/**
	 * @param view_number the view_number to set
	 */
	public void setView_number(int view_number) {
		this.view_number = view_number;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the like_num
	 */
	public int getLike_num() {
		return like_num;
	}
	/**
	 * @param like_num the like_num to set
	 */
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	/**
	 * @return the dislike_num
	 */
	public int getDislike_num() {
		return dislike_num;
	}
	/**
	 * @param dislike_num the dislike_num to set
	 */
	public void setDislike_num(int dislike_num) {
		this.dislike_num = dislike_num;
	}
	
	
}
