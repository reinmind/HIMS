package com.briup.common.util;

import java.io.IOException;
import java.sql.*;
import java.util.Properties;

public class JdbcUtil {
	private static String driver;
	private static String url;
	private static String username;
	private static String password;
	private static Connection connection = null;
	private static Statement stmt = null;
	// 相比于statement，性能更好，安全性能更高
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;

	static {
		Properties properties = new Properties();
		// load file
		try {
			// reflect
			properties.load(JdbcUtil.class.getResourceAsStream("datasource.properties"));
			driver = properties.getProperty("driver");
			url = properties.getProperty("url");
			username = properties.getProperty("username");
			password = properties.getProperty("password");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public static Connection getConnection() {
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, username, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return connection;
	}

	public static Statement getStatement() {
		try {
			stmt = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return stmt;
	}

	public static PreparedStatement getPstmt(String sql) {
		try {
			pstmt = connection.prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pstmt;
	}

	
	
	public static void close() {
		
			try {
				if (rs != null) 
				rs.close();
				if(pstmt != null) {
					pstmt.close();
				}
				if(connection != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}

	
	
}
