package com.Blog.Utils;

import java.io.InputStream;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.io.IOUtils;

public class JDBCUtils {

	private static ThreadLocal<Connection> threadLocal = new ThreadLocal<Connection>();

	/**
	 * ��ȡ���ݿ�����
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnection() throws Exception {
		Connection conn = threadLocal.get();
		if (conn == null) {
			Properties prop = new Properties();
			prop.load(JDBCUtils.class.getResourceAsStream("/jdbc.properties"));
			Class.forName(prop.getProperty("driver"));
			conn = DriverManager.getConnection(prop.getProperty("url"), prop);
			threadLocal.set(conn);
		}
		return conn;
	}

	/**
	 * �ͷ���Դ
	 * @param rs
	 * @param st
	 * @param conn
	 */
	public static void free(ResultSet rs, Statement st, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				rs = null;
			}

		}
		if (st != null) {
			try {
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				st = null;
			}

		}
		if (conn != null) {
			threadLocal.remove();
		}

	}

	/**
	 * ��ɾ�Ĳ����� �ɱ���������ڷ����������һ��൱��Objec[] ����
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static boolean update(String sql,Object...params) throws Exception {

		Connection conn = getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		//����ֵ
		if(params != null) {
			int index = 1;
			for (Object obj : params) {
				ps.setObject(index++, obj);
			}
		}
		int count = ps.executeUpdate();
		free(null,ps,null);
		return count> 0? true : false;
		
	}
	
	
	/**
	 * ��ѯ�������ݣ���ÿһ�����ݷ�װ��T���Ͷ����У������������list
	 * 
	 * @param <T>
	 * @param sql
	 * @param clazz
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static <T> List<T> queryForList(String sql, Class<T> clazz, Object... params) throws Exception {
		Connection conn = JDBCUtils.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		if (params != null) {
			int index = 1;
			for (Object obj : params) {
				ps.setObject(index++, obj);
			}
		}
		List<T> list = new ArrayList<T>();
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			// ����T���͵Ķ���
			T t = clazz.newInstance();
			// ��ȡһ�����ݶ���
			ResultSetMetaData data = rs.getMetaData();
			// ��ȡһ�����ݵ�����
			int count = data.getColumnCount();
			for (int i = 1; i <= count; i++) {
				// ��ȡ����
				String columnName = data.getColumnName(i);
				// ��ȡ������
				int columnType = data.getColumnType(i);
				// ��ȡT���������е�����
				Field[] fs = clazz.getDeclaredFields();
				for (Field f : fs) {
					// �������Կɱ�����
					f.setAccessible(true);
					// �����������������һֱ��Ҫ����ֵ����Ϊ����ֵ
					if (columnName.equalsIgnoreCase(f.getName())) {
						Object value = rs.getObject(columnName);
						// ����t��������
						f.set(t, convert(value, f.getType(), columnType));
					}
				}
			}
			list.add(t);
		}
		free(rs, ps, null);
		return list;
	}

	/**
	 * ��ѯһ������
	 * 
	 * @param <T>
	 * @param sql
	 * @param clazz
	 * @param params
	 * @return
	 * @return
	 * @throws Exception
	 */
	public static <T> T queryForObject(String sql, Class<T> clazz, Object... params) throws Exception {
		Connection conn = JDBCUtils.getConnection();
		System.out.println(sql);
		PreparedStatement ps = conn.prepareStatement(sql);
		if (params != null) {
			int index = 1;
			for (Object obj : params) {
				ps.setObject(index++, obj);
			}
		}
		System.out.println(ps);
		ResultSet rs = ps.executeQuery();
		// ����T���͵Ķ���
		T t = null;
		if (rs.next()) {
			t = clazz.newInstance();
			// ��ȡһ�����ݶ���
			ResultSetMetaData data = rs.getMetaData();
			// ��ȡһ�����ݵ�����
			int count = data.getColumnCount();
			for (int i = 1; i <= count; i++) {
				// ��ȡ����
				String columnName = data.getColumnName(i);
				// ��ȡ������
				int columnType = data.getColumnType(i);
				// ��ȡT���������е�����
				Field[] fs = clazz.getDeclaredFields();
				for (Field f : fs) {
					// �������Կɱ�����
					f.setAccessible(true);
					String name = f.getName();
					// �����������������һֱ��Ҫ����ֵ����Ϊ����ֵ
					if (columnName.equalsIgnoreCase(name)) {
						Object value = rs.getObject(columnName);
						// ����t��������
						f.set(t, convert(value, f.getType(), columnType));
					}
				}
			}
		}
		free(rs, ps, null);
		return t;
	}
	
	
	
	public static List<Map<String,Object>> queryForList(String sql, Object... params) throws Exception {
		Connection conn = JDBCUtils.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		if (params != null) {
			int index = 1;
			for (Object obj : params) {
				ps.setObject(index++, obj);
			}
		}
		ResultSet rs = ps.executeQuery();
		List<Map<String,Object>> list = new ArrayList<>();
		while (rs.next()) {
			Map<String,Object> map = new HashMap<>();
			// ��ȡһ�����ݶ���
			ResultSetMetaData data = rs.getMetaData();
			// ��ȡһ�����ݵ�����
			int count = data.getColumnCount();
			for (int i = 1; i <= count; i++) {
				// ��ȡ����
				String columnName = data.getColumnName(i);
				// ��ȡ��ֵ
				Object value = rs.getObject(i);
				map.put(columnName, value);
				System.out.println(columnName);
			
			}
			list.add(map);
		}
		free(rs, ps, null);
		return list;
	}
	

	/**
	 * ͨ����ѯ����ͳ�Ƽ�¼��������
	 * 
	 * @param sql
	 * @param params
	 * @return
	 * @throws Exception
	 */
	public static int queryForInt(String sql, Object... params) throws Exception {
		Connection conn = JDBCUtils.getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		int count = 0;
		// ���ò���
		if (params != null) {
			int index = 1;
			for (Object obj : params) {
				ps.setObject(index++, obj);
			}
		}
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			count = rs.getInt(1);
		}
		free(rs, ps, null);
		return count;
	}
	
	
	/**
	 * ���ݿ����ͺ������͵�ת�� ע�⣺�÷���û���ж�clob����Ŷ
	 * 
	 * @param val
	 * @param type
	 * @param columnType
	 * @return
	 * @throws Exception 
	 */
	private static Object convert(Object val, Class<?> type, int columnType) throws Exception {

		if (val == null)
			return val;
		if ((type == Byte.class || type == byte.class) && (columnType == Types.NUMERIC || columnType == Types.BIT)) {
			return Byte.parseByte(String.valueOf(val));
		}
		if ((type == Short.class || type == short.class) && (columnType == Types.NUMERIC)) {
			return Short.parseShort(String.valueOf(val));
		}
		if ((type == Integer.class || type == int.class)
				&& (columnType == Types.NUMERIC || columnType == Types.INTEGER)) {
			return Integer.parseInt(String.valueOf(val));
		}
		if ((type == Long.class || type == long.class)
				&& (Types.INTEGER == columnType || Types.NUMERIC == columnType)) {
			return Long.parseLong(String.valueOf(val));
		}
		if ((type == Float.class || type == float.class)
				&& (Types.FLOAT == columnType || Types.NUMERIC == columnType)) {
			return Float.parseFloat(String.valueOf(val));
		}
		if ((type == Double.class || type == double.class)
				&& (Types.DOUBLE == columnType || Types.NUMERIC == columnType)) {
			return Double.parseDouble(String.valueOf(val));
		}
		if ((type == String.class) && (Types.VARCHAR == columnType || Types.CHAR == columnType)) {
			return String.valueOf(val);
		}

		if ((type == Character.class || type == char.class)
				&& (Types.VARCHAR == columnType || Types.CHAR == columnType)) {
			return String.valueOf(val).charAt(0);
		}

		if ((type == java.util.Date.class) && (Types.DATE == columnType || Types.TIMESTAMP == columnType)) {
			return val;
		}
		if(type==byte[].class && Types.LONGVARBINARY == columnType){
//			Long l = (Long ) val; 
			byte[] b =(byte[]) val;
//			return IOUtils.toByteArray(in);
			return b;
		}
		throw new RuntimeException("�������ݿ��ֶ����ͺͷ��ص������Ƿ�һ�£�����");
	}
	
	
}
