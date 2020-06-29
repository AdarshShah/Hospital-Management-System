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
 * Servlet implementation class Pharmacist
 */
@WebServlet("/Pharmacist")
public class Pharmacist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Pharmacist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String function= request.getParameter("function");
		switch(function) {
		case "issue":
			issueMedicine(request,response);
			break;
		case "forward":
			request.setAttribute("patient_id",Integer.parseInt(request.getParameter("ssn_id")));
			RequestDispatcher rd = request.getRequestDispatcher("html/issue_medicines.jsp");
			rd.forward(request, response);
			break;
		case "search":
			try {
				searchPatient(request, response);
			} catch (ServletException | IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		}
	}

	private void issueMedicine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int patient_id = request.getAttribute("patient_id")==null?10001:(Integer)request.getAttribute("patient_id");
		String medicine = request.getParameter("medicine");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		if(DBConnection.issueMedicine(patient_id,medicine,quantity)) {
			request.setAttribute("message", "");
		}else {
			request.setAttribute("message", "Please enter correct quantity");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/html/issue_medicines.jsp");
		rd.forward(request, response);

	}
	
	private void searchPatient(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		int patient_id; 
		patient_id = Integer.parseInt(request.getParameter("ssn_id"));
		ResultSet rs = DBConnection.searchPatient(patient_id);
		if(!rs.next()) {
			request.setAttribute("message","Patient does not exist");
			RequestDispatcher rd = request.getRequestDispatcher("html/search_medicine.jsp");
			rd.forward(request, response);		
		}else {
			request.setAttribute("patient",rs);
			RequestDispatcher rd = request.getRequestDispatcher("html/search_medicine.jsp");
			rd.forward(request, response);
		}
	}

}
