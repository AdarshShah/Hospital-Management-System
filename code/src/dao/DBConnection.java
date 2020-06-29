package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class DBConnection {
	
	static Connection conn;
	
	static {
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
	
	}
	
	public static Connection getConnection() {
			return conn;
	}
	
	public static String isLoggedIn(String username,String password) {
		try{
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
		try{
			PreparedStatement stmt = conn.prepareStatement("UPDATE USERSTORE SET logintime = ? WHERE login like ?");
			stmt.setString(1, new Date(0).toString());
			stmt.setString(2, username);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
	}
	
	public static boolean createPatient(int patient_id, String patient_name, String address,String city,String state,int age, String date_of_joining,String room_type) {
		try{
			PreparedStatement stmt = conn.prepareStatement("INSERT INTO PATIENT VALUES(?,?,?,?,?,?,?,?)");
			stmt.setInt(1, patient_id);
			stmt.setString(2, patient_name);
			stmt.setString(3, address);
			stmt.setString(4, city);
			stmt.setString(5, state);
			stmt.setInt(6, age);
			stmt.setString(7,date_of_joining);
			stmt.setString(8,room_type);
			return stmt.executeUpdate()>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	public static boolean updatePatient(int patient_id, String patient_name, String address,String city,String state,int age, String date_of_joining,String room_type) {
		try{
			PreparedStatement stmt = conn.prepareStatement("UPDATE PATIENT SET patient_name = ? ,address = ? ,city = ? ," + 
					"    state = ?,age = ?, date_of_joining = ?, room_type = ? WHERE patient_id = ?");
			stmt.setInt(8, patient_id);
			stmt.setString(1, patient_name);
			stmt.setString(2, address);
			stmt.setString(3, city);
			stmt.setString(4, state);
			stmt.setInt(5, age);
			stmt.setString(6,date_of_joining);
			stmt.setString(7,room_type);
			return stmt.executeUpdate()>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	public static boolean deletePatient(int patient_id) {
		try{
			PreparedStatement stmt = conn.prepareStatement("DELETE FROM PATIENT WHERE patient_id = ?");
			stmt.setInt(1, patient_id);
			return stmt.executeUpdate()>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public static ResultSet searchPatient(int patient_id) {
		try {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM patient WHERE patient_id = ?;");
			stmt.setInt(1, patient_id);
			ResultSet rs = stmt.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;
	}
	
	public static ResultSet getAllPatients() {
		try {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM patient;");
			ResultSet rs = stmt.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;
	}

	public static ResultSet getIssuedMedicines(int patient_id) {
		ResultSet rs=null;
		try {
			PreparedStatement stmt = conn.prepareStatement("SELECT medicine_name, quantity, rate, quantity*rate  FROM patient natural join patient_medicine natural join medicine where patient_id = ? ;");
			stmt.setInt(1, patient_id);
			rs = stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static ResultSet[] getBillDetails(int patient_id) {
		ResultSet rs[] = new ResultSet[3];
		
		rs[0] = searchPatient(patient_id);
		
		try {
			PreparedStatement stmt = conn.prepareStatement("SELECT medicine_name, quantity, rate, medicine_name*rate  FROM patient natural join patient_medicine natural join medicine where patient_id = ? ;");
			stmt.setInt(1, patient_id);
			rs[1] = stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			PreparedStatement stmt = conn.prepareStatement("SELECT test_name, rate  FROM patient natural join patient_diagnostic natural join diagnostic where patient_id = ? ;");
			stmt.setInt(1, patient_id);
			rs[2] = stmt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public static ResultSet getMedicines() {
		try {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM  medicine;");
			ResultSet rs = stmt.executeQuery();
			return rs;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;
	}

	public static boolean issueMedicine(int patient_id, String medicine, int quantity) {
		// TODO Auto-generated method stub
		
		try {
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM  medicine where medicine_name = ?;");
			stmt.setString(1, medicine.trim());
			ResultSet rs = stmt.executeQuery();
			if(!rs.next())
				return false;
			int available = rs.getInt("quantity_available");
			int medicine_id = rs.getInt("medicine_id");
			if(available<quantity)
				return false;
			available = available-quantity;
			PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO patient_medicine VALUES(?,?,?)");
			stmt1.setInt(1,patient_id);
			stmt1.setInt(2, medicine_id);
			stmt1.setInt(3, quantity);
			stmt1.execute();
			
			PreparedStatement stmt2 = conn.prepareStatement("UPDATE medicine SET quantity_available = ? WHERE medicine_id = ? ;");
			stmt2.setInt(1, available);
			stmt2.setInt(2, medicine_id);
			
			stmt2.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return true;
	}
}
