package tsw.Control;

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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserModel model = new UserModel();
		
		//aggiungere un filter per i ruoli dell'utente
		
		try {
			UserBean utente = model.doRetrieveByKey(username);
			request.getSession().setAttribute("ruolo", utente.getRuolo());
			if (utente == null || !utente.getPassword().trim().equals(password) ) {
				request.getSession().setAttribute("utente", "Account non trovato");
				response.setContentType("text/html");
				response.sendRedirect("InvalidLogin.jsp");
				
			}
			else if (utente.getPassword().trim().equals(password)) {
				request.getSession().setAttribute("utente", utente);
				response.setContentType("text/html");
				String page = request.getParameter("pageLogin");
				System.out.println(page);
				if(page.trim().equals("carrello.jsp")){
					response.sendRedirect("./" + page);
				}else {
					response.sendRedirect("./RedirectServlet?page=catalogo");
				}
				
				return;
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			return;
		}
	}

}
