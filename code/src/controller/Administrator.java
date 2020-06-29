package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DBConnection;

/**
 * Servlet implementation class Administrator
 */
@WebServlet("/Administrator")
public class Administrator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Administrator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		switch(request.getParameter("function")) {
		case "create":
			createPatient(request, response);
			break;
		case "update":
			try {
				updatePatient(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "delete":
			try {
				deletePatient(request,response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "search":
			try {
				searchPatient(request,response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "bill":
			generateBill(request,response);
		}
		
	}
	
	private void generateBill(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int patient_id = Integer.parseInt(request.getParameter("ssn_id"));
		ResultSet patient = DBConnection.searchPatient(patient_id);
		
	}

	private void deletePatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		// TODO Auto-generated method stub
		if(request.getParameter("get")!=null) {
		int patient_id; 
		patient_id = Integer.parseInt(request.getParameter("ssn_id"));
		ResultSet rs = DBConnection.searchPatient(patient_id);
		if(!rs.next()) {
			request.setAttribute("message","Patient does not exist");
			RequestDispatcher rd = request.getRequestDispatcher("html/delete_patient.jsp");
			rd.forward(request, response);		
		}else {
			request.setAttribute("patient",rs);
			RequestDispatcher rd = request.getRequestDispatcher("html/delete_patient.jsp");
			rd.forward(request, response);
			}
		}
		
		if(request.getParameter("delete")!=null) {
		RequestDispatcher rd = null;
		if(DBConnection.deletePatient(Integer.parseInt(request.getParameter("ssn_id")))) {
			request.setAttribute("message", "Patient deleted successfully");
		}else {
			request.setAttribute("message", "Patient does not exists");
		}
		rd = request.getRequestDispatcher("html/delete_patient.jsp");
		rd.forward(request, response);
		}
	}

	private void updatePatient(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		
		if(request.getParameter("get")!=null) {
			int patient_id; 
			patient_id = Integer.parseInt(request.getParameter("ssn_id"));
			ResultSet rs = DBConnection.searchPatient(patient_id);
			if(!rs.next()) {
				request.setAttribute("message","Patient does not exist");
				RequestDispatcher rd = request.getRequestDispatcher("html/update_patient.jsp");
				rd.forward(request, response);		
			}else {
				request.setAttribute("patient",rs);
				RequestDispatcher rd = request.getRequestDispatcher("html/update_patient.jsp");
				rd.forward(request, response);
			}
		}
		
		if(request.getParameter("update")!=null) {
		int patient_id; String patient_name, address, city, state;
		int age;
		String date_of_joining;
		String room_type;
		
		patient_id = Integer.parseInt(request.getParameter("ssn_id"));
		
		ResultSet rs = DBConnection.searchPatient(patient_id);
		if(!rs.next()) {
			request.setAttribute("message","Patient does not exist");
			RequestDispatcher rd = request.getRequestDispatcher("html/create_patient.jsp");
			rd.forward(request, response);		
		}else {
		patient_name = request.getParameter("patient_name")==null?rs.getString("patient_name"):request.getParameter("patient_name");
		age = Integer.parseInt(request.getParameter("patient_age")==null?""+rs.getInt("age"):request.getParameter("patient_age"));
		date_of_joining =  request.getParameter("date_admission")==null?rs.getString("date_of_joining"):request.getParameter("date_admission");
		room_type =  request.getParameter("beds")==null?rs.getString("room_type"):request.getParameter("beds");
		address = request.getParameter("address")==null?rs.getString("address"):request.getParameter("address");
		state = request.getParameter("State")==null?rs.getString("state"):request.getParameter("State");
		city = request.getParameter("city")==null?rs.getString("city"):request.getParameter("city");
		if(DBConnection.updatePatient(patient_id, patient_name, address, city, state, age, date_of_joining, room_type)) {
			request.setAttribute("message","Patient updated successfully");
		}else {
			request.setAttribute("message","Patient is not updated");
		}
		RequestDispatcher rd = request.getRequestDispatcher("html/update_patient.jsp");
		rd.forward(request, response);
		}
		}
	}

	private void createPatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int patient_id; String patient_name, address, city, state;
		int age;
		String date_of_joining;
		String room_type;
		
		patient_id = Integer.parseInt(request.getParameter("ssn_id"));
		patient_name = request.getParameter("patient_name");
		age = Integer.parseInt(request.getParameter("patient_age"));
		date_of_joining =  request.getParameter("date_admission");
		room_type =  request.getParameter("beds");
		address = request.getParameter("address");
		state = request.getParameter("State");
		city = request.getParameter("city");
		if(DBConnection.createPatient(patient_id, patient_name, address, city, state, age, date_of_joining, room_type)) {
			request.setAttribute("message","Patient created successfully");
		}else {
			request.setAttribute("message","Patient already exists");
		}
		RequestDispatcher rd = request.getRequestDispatcher("html/create_patient.jsp");
		rd.forward(request, response);
	}

	private void searchPatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int patient_id; 
		patient_id = Integer.parseInt(request.getParameter("ssn_id"));
		ResultSet rs = DBConnection.searchPatient(patient_id);
		if(!rs.next()) {
			request.setAttribute("message","Patient does not exist");
			RequestDispatcher rd = request.getRequestDispatcher("html/patient_search.jsp");
			rd.forward(request, response);		
		}else {
			request.setAttribute("patient",rs);
			RequestDispatcher rd = request.getRequestDispatcher("html/patient_search.jsp");
			rd.forward(request, response);
		}
	}
}

