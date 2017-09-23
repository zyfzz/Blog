package com.Blog.Dao;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import com.Blog.bean.Article_Delete;

public class ArticleDeleteDao {

	public void addNewArticle(Article_Delete article_delete){      
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			sqlSession.insert("Article_delete.addArticleDelete",article_delete);
			sqlSession.commit();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
	}
}
