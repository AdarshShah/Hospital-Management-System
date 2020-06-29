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
 * Servlet implementation class Diagnostic
 */
@WebServlet("/Diagnostic")
public class Diagnostic extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Diagnostic() {
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
			issueTest(request,response);
			break;
		}
	}

	private void issueTest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int patient_id = request.getAttribute("patient_id")==null?10001:(Integer)request.getAttribute("patient_id");
		String test = request.getParameter("test");
		
		if(DBConnection.issueTest(patient_id, test)) {
			request.setAttribute("message", "");
		}else {
			request.setAttribute("message", "Please enter correct test");
		}
		RequestDispatcher rd = request.getRequestDispatcher("/html/add_diagnostics.jsp");
		rd.forward(request, response);

	}

}
