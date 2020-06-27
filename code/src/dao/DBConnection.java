package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class DBConnection {
	
	public static Connection getConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/test","root","root");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
	
	public static String isLoggedIn(String username,String password) {
		try(Connection conn = getConnection()){
			PreparedStatement stmt = conn.prepareStatement("SELECT role FROM USERSTORE WHERE LOGIN = ? AND PASSWORD = ?;");
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
				return rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;
	}
	
	public static void LoggedInTime(String username,String password) {
		try(Connection conn = getConnection()){
			PreparedStatement stmt = conn.prepareStatement("UPDATE USERSTORE SET logintime = ? WHERE login like ?");
			stmt.setTimestamp(1, new Timestamp(new Date(0).getTime()));
			stmt.setString(2, username);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
}
