package tsw.Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Ordine;
import Model.OrdineModel;
import Model.UserBean;

/**
 * Servlet implementation class FinalizzaAcquistoServlet
 */
@WebServlet("/FinalizzaAcquistoServlet")
public class FinalizzaAcquistoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalizzaAcquistoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");
	    OrdineModel model = new OrdineModel();
	    if(utente == null || utente.getRuolo() == null)
	    {
	    	response.sendRedirect("login.jsp");	
	    	return;
	    }
	    
	    Ordine checkoutOrdine = ((Ordine) request.getSession().getAttribute("checkoutOrdine"));
	    
	    String indirizzoS = request.getParameter("indirizzoS");
	    String statoS = request.getParameter("statoS");
	    String cityS = request.getParameter("cityS");
	    long capS = Long.parseLong(request.getParameter("capS"));
	    
	    String indirizzoF = request.getParameter("indirizzoF");
	    String statoF = request.getParameter("statoF");
	    String cityF = request.getParameter("cityF");
	    long capF = Long.parseLong(request.getParameter("capF"));
	    
	    checkoutOrdine.setIndirizzoS(indirizzoS);
	    checkoutOrdine.setStatoS(statoS);
	    checkoutOrdine.setCityS(cityS);
	    checkoutOrdine.setCapS(capS);
	    
	    checkoutOrdine.setIndirizzoF(indirizzoF);
	    checkoutOrdine.setStatoF(statoF);
	    checkoutOrdine.setCityF(cityF);
	    checkoutOrdine.setCapF(capF);
	    
		
		try {
		model.databaseInsert(checkoutOrdine);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
