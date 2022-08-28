package Util;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.RecensioneBean;
import Model.RecensioneModel;

/**
 * Servlet implementation class ModificaRecensione
 */
@WebServlet("/ModificaRecensione")
public class ModificaRecensione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaRecensione() {
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
		String testo = request.getParameter("testoRecensione");
		int punteggio = Integer.parseInt(request.getParameter("punti"));
		long seriale = Long.parseLong(request.getParameter("seriale"));
		String username = request.getParameter("username");
		String categoria = request.getParameter("categoria");
		RecensioneModel model = new RecensioneModel();
		RecensioneBean recensione = new RecensioneBean(username, testo, seriale, punteggio);
		
		try {
			model.updateRecensione(recensione, categoria);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("True");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			response.getWriter().write("Error");
			e.printStackTrace();
		}
		return;
	}
}
