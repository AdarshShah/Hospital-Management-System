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
		}
	}

	private void issueMedicine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int patient_id = 10001;
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
	
	

}
