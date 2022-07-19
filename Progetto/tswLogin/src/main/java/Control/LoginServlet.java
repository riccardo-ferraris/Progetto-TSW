package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UserBean;
import Model.UserModel;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserModel model = new UserModel();
		
		
		try {
			UserBean utente = model.doRetrieveByKey(username);
				
			if (utente == null || !utente.getPassword().trim().equals(password) ) {
				request.getSession().setAttribute("utente", null);             
		        response.setContentType("text/html;charset=UTF-8");
		        request.getSession().setAttribute("ruolo", "guest");
		        response.getWriter().write("False");
		  }
			else if (utente.getPassword().trim().equals(password)) {
				request.getSession().setAttribute("utente", utente);
				request.getSession().setAttribute("ruolo", utente.getRuolo());
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("True");
				String page = request.getParameter("pageLogin");
				if(page != null) {
					response.getWriter().write(page);
				}else if(page == null || page.equals("")){
					response.getWriter().write("home.jsp");
				}
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("error loginservlet");
			return;
		}
		return;
	}

}
