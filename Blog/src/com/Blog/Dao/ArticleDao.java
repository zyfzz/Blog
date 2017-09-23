package com.Blog.Dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.Blog.bean.Article;

public class ArticleDao {

	public Article getArticleInfoByArticleId(int article_id){      //
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		Article article=null;
		try {
			sqlSession=dbAccess.getSqlSession();
			//通锟斤拷sqlSession执锟斤拷SQL锟斤拷锟�
//			User user=sqlSession.selectList("User.getUserInfo");
			article=sqlSession.selectOne("Article.getArticleInfoByArticleId",article_id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return article;
	}
	public Article getDeletedArticleInfoByArticleId(int article_id){      //
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		Article article=null;
		try {
			sqlSession=dbAccess.getSqlSession();
			//通锟斤拷sqlSession执锟斤拷SQL锟斤拷锟�
//			User user=sqlSession.selectList("User.getUserInfo");
			article=sqlSession.selectOne("Article_delete.getArticleInfoByArticleId",article_id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return article;
	}
	
	public List<Article> getDeletedArticleInfoByUserId(int user_id){      //
		List<Article> list=new ArrayList<Article>();
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			list=sqlSession.selectList("Article_delete.getDeletedArticleInfoByUserId",user_id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return list;
	}
	
	public List<Article> getArticleInfoByUserId(int user_id){      //
		List<Article> list=new ArrayList<Article>();
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			list=sqlSession.selectList("Article.getArticleInfoByUserId",user_id);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return list;
	}
	
	public List<Article> getAllArticleInfo(String article_name){      //根据用户名
		List<Article> list=new ArrayList<Article>();
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			list=sqlSession.selectList("Article.getAllArticleInfo",article_name);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return list;
	}
	
	public List<Article> getAllArticleInfoByType(String type){      
		List<Article> list=new ArrayList<Article>();
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			list=sqlSession.selectList("Article.getAllArticleInfoBytype",type);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return list;
	}
	
	public List<Article> getAllArticleOrderByViews(){
		List<Article> list=new ArrayList<Article>();
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			list=sqlSession.selectList("Article.getAllArticleOrderByViews");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return list;
	}
	
	public List<Article> getAllArticleOrderByLikenum(){
		List<Article> list=new ArrayList<Article>();
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			list=sqlSession.selectList("Article.getAllArticleOrderByLikenum");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return list;
	}
	public List<Article> getAllArticleOrderByDate(){
		List<Article> list=new ArrayList<Article>();
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			list=sqlSession.selectList("Article.getAllArticleOrderByDate");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
		return list;
	}
	
	
	public void addNewArticle(Article article){      
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			sqlSession.insert("Article.addArticle",article);
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
	
	public void updateArticle(Article article){      
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			sqlSession.insert("Article.updateArticle",article);
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
	
	public void addArticleDelete(Article article){      //把删除的博文添加到回收站 
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			sqlSession.insert("Article_delete.addArticleDelete",article);
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
	
	public void addDeletedArticleToArticle(Article article){      //把删除的博文从回收站恢复
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
		try {
			sqlSession=dbAccess.getSqlSession();
			sqlSession.insert("Article.addDeletedArticleToArticle",article);
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
	
	public void deleteArticle(int artice_id) {
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
        try {
        	sqlSession=dbAccess.getSqlSession();
			sqlSession.delete("Article.deleteArticle",artice_id);
			sqlSession.commit();
        }catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
    }
	
	public void deleteArticle_Delete(int artice_id) {
		DbAccess dbAccess=new DbAccess();
		SqlSession sqlSession = null;
        try {
        	sqlSession=dbAccess.getSqlSession();
			sqlSession.delete("Article_delete.deleteArticle_Delete",artice_id);
			sqlSession.commit();
        }catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(sqlSession != null)
			sqlSession.close();
		}
    }
	
	public static void main(String[] args) {
		List<Article> list=new ArrayList<Article>();
		ArticleDao articleDao=new ArticleDao();
		Article article=new Article();
		/*article.setArticle_name("测试文章");
		article.setUser_id(1);
		article.setContent("asdasd afgdfsg");
		article.setDate("2017-9-10");
		article.setDigest("摘要");
		article.setDislike_num(0);
		article.setLike_num(0);
		article.setType("数据结构");
		article.setView_number(0);*/
		list=articleDao.getAllArticleInfo("第");
		System.out.println(list.get(0).getArticle_name());
		System.out.println(list.get(0).getContent());
		System.out.println(list.get(0).getUser().getHeadshot());
		System.out.println(list.get(0).getUser().getTruename());
		//Article article=new Article();
		
	}
	
}
