package com.Blog.Dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DbAccess {

	/*
<<<<<<< HEAD
	 * ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Ä¼ï¿½ï¿½ï¿½ï¿½Óµï¿½ï¿½ï¿½ï¿½Ý¿ï¿½
=======
	 * ¸ù¾ÝÅäÖÃÎÄ¼þÁ¬½Óµ½Êý¾Ý¿â
>>>>>>> f35f971381cdc7b764d5db91bacdec0b18132d1b
	 */
	public SqlSession getSqlSession() throws IOException{
		Reader reader=Resources.getResourceAsReader("com/Blog/config/Configuration.xml");
		SqlSessionFactory sqlSessionFactory= new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		return sqlSession;
	}
}
