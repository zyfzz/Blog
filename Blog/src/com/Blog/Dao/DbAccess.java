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
	 * ���������ļ����ӵ����ݿ�
=======
	 * ���������ļ����ӵ����ݿ�
>>>>>>> f35f971381cdc7b764d5db91bacdec0b18132d1b
	 */
	public SqlSession getSqlSession() throws IOException{
		Reader reader=Resources.getResourceAsReader("com/Blog/config/Configuration.xml");
		SqlSessionFactory sqlSessionFactory= new SqlSessionFactoryBuilder().build(reader);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		return sqlSession;
	}
}
