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
import Model.UserBean;

/**
 * Servlet implementation class aggiungiRecensioneServlet
 */
@WebServlet("/aggiungiRecensioneServlet")
public class aggiungiRecensioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aggiungiRecensioneServlet() {
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
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");
		
		if(utente == null) {
			String pageRedirect = request.getParameter("pageLogin");
			response.sendRedirect("login.jsp?pageLogin=" + pageRedirect);
			return;
		}
		int punteggio = Integer.parseInt(request.getParameter("punteggioFormRecensione"));
		String testoRecensione = request.getParameter("testoRecensione");
		long serialeProdotto = Long.parseLong(request.getParameter("id"));
		String categoriaProdotto = request.getParameter("categoriaProdotto");
		RecensioneModel model = new RecensioneModel();
		RecensioneBean bean = new RecensioneBean(utente.getUsername(), testoRecensione, serialeProdotto, punteggio);
		
		try {
			model.databaseInsert(bean, categoriaProdotto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("Prodotto.jsp?id="+serialeProdotto);
		return;
	}
}
