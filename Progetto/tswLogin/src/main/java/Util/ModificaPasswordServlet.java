package Util;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UserBean;
import Model.UserModel;

/**
 * Servlet implementation class ModificaPasswordServlet
 */
@WebServlet("/ModificaPasswordServlet")
public class ModificaPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newPasswordModal = request.getParameter("newPasswordModal");
		String oldPasswordModal = request.getParameter("oldPasswordModal"); 
		
		UserModel model = new UserModel();
		UserBean utente = ((UserBean)request.getSession().getAttribute("utente"));
		
		if (!utente.getPassword().equals(oldPasswordModal) ) {             
			response.setContentType("text/html;charset=UTF-8");
		    response.getWriter().write("Incorrect");
		    return;
		}
		
		try {			
			model.changePassword(utente.getUsername(), newPasswordModal);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("True");
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.getWriter().write("Error");
		}
		return;
	}
}
