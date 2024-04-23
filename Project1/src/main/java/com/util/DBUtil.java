package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil 
{
	Connection con=null;
	
	public Connection getConnectionData()
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1","root","");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
}
