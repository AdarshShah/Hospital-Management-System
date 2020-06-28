package controller;

import java.io.IOException;

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

}
