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
import Model.ProdottoInCarrello;
import Model.UserBean;
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
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String codice = new String();
		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select max(codice) codice from ordine;";

			preparedStatement = connection.prepareStatement(sql);

			rs = preparedStatement.executeQuery();

			if (rs.next()) {
				codice = rs.getString("codice") + 1;
				System.out.println(codice);
			} else
				codice = "AA00000000";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");
		double totale = (double) request.getSession().getAttribute("totale");
		LocalDateTime dataTemp = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		Date dataFinal = Date.valueOf(dataTemp.format(formatter)); 
		//System.out.println(dataFinal);
		
		@SuppressWarnings("unchecked")	
		ArrayList<ProdottoInCarrello> prodOrdine = (ArrayList<ProdottoInCarrello>) request.getSession().getAttribute("prodCarrello");
		
		Ordine ordine = new Ordine(codice, utente.getUsername(), totale, dataFinal, prodOrdine);
		//qui bisogna chiamare ordine.databaseInsert che va sistemato, prendi esempio da nuovoProdottoServlet righe 90-95
	}

}
