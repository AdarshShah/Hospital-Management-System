package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DBConnection;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String role=null;
		if((role=DBConnection.isLoggedIn(username, password))==null) {
			response.sendRedirect("index_error.html");
		}
		else {
		DBConnection.LoggedInTime(username, password);
		HttpSession session = request.getSession(true);
		session.setAttribute("username",username);
		session.setAttribute("password",password);
		
		RequestDispatcher rd=null;
		switch(role.trim().toLowerCase()) {
			case "administrator":
				rd = request.getRequestDispatcher("html/create_patient.jsp");
				break;
			case "pharmacist":
				rd = request.getRequestDispatcher("pharm.html");
				break;
			case "diagnostitian":
				rd = request.getRequestDispatcher("diagn.html");
				break;
		}
		rd.forward(request, response);
		}
	}

}
