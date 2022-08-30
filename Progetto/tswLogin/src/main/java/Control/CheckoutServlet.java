package Control;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Ordine;
import Model.UserBean;
import Util.Carrello;
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
	
	/**
	 * Crea il bean dell'ordine che verrà salvato nel database con databaseInsert()
	 * il codice dell'ordine è qui passato come vuoto, verrà poi generato nel model
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");
		
		if(utente == null) {
			response.sendRedirect("login.jsp?pageLogin=carrello.jsp");
		}else {
			double totale = (double) request.getSession().getAttribute("totale");
			LocalDateTime dataTemp = LocalDateTime.now();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			Date dataFinal = Date.valueOf(dataTemp.format(formatter));
			
			Carrello prodOrdine = (Carrello) request.getSession().getAttribute("carrello");
			Ordine ordine = new Ordine("", utente.getUsername(), "", "", "", "", "", 0, "", "", "", "", "", 0, totale, dataFinal, prodOrdine.getProdotti());
			
			request.getSession().setAttribute("checkoutOrdine", ordine);
			response.sendRedirect("checkout.jsp");
		}
		
		return;
	}
}
