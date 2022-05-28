package tsw.Control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Ordine;
import Model.OrdineModel;
import Model.ProdottoInCarrello;
import Model.UserBean;
import Util.Carrello;
import Util.DriverManagerConnectionPool;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
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
		//prendo dal database il codice massimo da incrementare per assegnare il codice all'ordine attuale - se non ci sono ordini viene assegnato il primo codice AA00000000
		
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");
		double totale = (double) request.getSession().getAttribute("totale");
		LocalDateTime dataTemp = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		Date dataFinal = Date.valueOf(dataTemp.format(formatter)); 
		OrdineModel model = new OrdineModel();
		//System.out.println(dataFinal);
		
		Carrello prodOrdine = (Carrello) request.getSession().getAttribute("carrello");
		System.out.println(prodOrdine.toString());
		Ordine ordine = new Ordine("", utente.getUsername(), totale, dataFinal, prodOrdine.getProdotti());
		try {
			model.databaseInsert(ordine);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//qui bisogna chiamare ordine.databaseInsert che va sistemato, prendi esempio da nuovoProdottoServlet righe 90-95
	}

}
