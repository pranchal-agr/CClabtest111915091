package com.login.dao;

//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginDao {
	String url = "jdbc:mysql://localhost:3306/employees";
	String username = "root";
	String password ="Aman@123";
	String sql = "Select * from employee where first=? and mis=?";
	public boolean check(String first, String mis)
	{
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);	
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,first);
			st.setString(2,mis);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				return true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
