package com.nobious.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {


	private static Connection con=null;
	
	public static Connection getConnection()
	{
		String url="jdbc:mysql://localhost:3306/jdbc?createDatabaseIfNotExist=true";
		String username="root";
		String password="1234";
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url,username,password);
//			System.out.println("Connection Successfull!!");
		}
		catch(ClassNotFoundException cf)
		{
			System.out.println("Please load driver");
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		return con;
	}
}