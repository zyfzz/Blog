package com.Blog.Dao;

import java.util.List;
import java.util.Map;

import com.Blog.Utils.JDBCUtils;
import com.Blog.bean.Collection;
import com.Blog.bean.UserInfo;

public class UserInfoDaoImpl implements UserInfoDao {

	@Override
	public boolean signup(UserInfo userInfo) throws Exception {

		String sql = "insert into user_info (user_id,username,password,email) values (?,?,?,?); ";
	
		return JDBCUtils.update(sql,(int)(Math.random()*10000), userInfo.getUsername(),userInfo.getPassword(),userInfo.getEmail());
	
	}

	@Override
	public UserInfo signin(UserInfo userInfo) throws Exception {
		String sql = "select * from user_info where username = ?";
		String username = userInfo.getUsername();
		return JDBCUtils.queryForObject(sql, UserInfo.class, username);
		
	}

	@Override
	public void modify(UserInfo userInfo) throws Exception {
		String sql ="update user_info set truename=? , job=? , email=? , trade=? , sex=? , country=? , city=? , introduction=? , headshot=? where username = ? ";
		JDBCUtils.update(sql, userInfo.getTruename(),userInfo.getJob(),userInfo.getEmail(),userInfo.getTrade(),userInfo.getSex(),userInfo.getCountry(),userInfo.getCity(),userInfo.getIntroduction(),userInfo.getHeadshot(),userInfo.getUsername());
		
	}

	@Override
	public int countMyBlog(int id ) throws Exception {
		
		String sql = "select count(*) from article where user_id  = ?";
		return JDBCUtils.queryForInt(sql, id);
	}
	
	public List<Map<String, Object>> queryMyBlog(int user_id,int start, int end) throws Exception {
		
		String sql = " select * from article where user_id=? order by date desc   limit   ?,? ";
		return JDBCUtils.queryForList(sql,user_id, start,end );
	}

	@Override
	public UserInfo queryUserInfoByBlogId(int article_id) throws Exception {
		String sql = "select user_info.user_id,username,headshot,score from article ,  user_info where article.user_id=user_info.user_id  and article.article_id=?";
		return JDBCUtils.queryForObject(sql, UserInfo.class, article_id);
	}

	@Override
	public List<Collection> getCollections(int user_id) throws Exception {
		String sql  = "select * from collection where user_id = ? ";
		return JDBCUtils.queryForList(sql, Collection.class, user_id);
	}

	@Override
	public UserInfo getAuthorInfo(Integer authorId) throws Exception {
		String sql = "select * from user_info where user_id = ?";
		return JDBCUtils.queryForObject(sql, UserInfo.class, authorId);
	}

}
