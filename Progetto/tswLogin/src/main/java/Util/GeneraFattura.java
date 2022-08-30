package Util;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Ordine;
import Model.OrdineModel;

/**
 * Servlet implementation class GeneraFattura
 */
@WebServlet("/GeneraFattura")
public class GeneraFattura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneraFattura() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String codiceOrdine = request.getParameter("codiceOrdine"); //Prendiamo il codice dell'ordine dalla request
		String path = getServletContext().getRealPath("/" + "files" + File.separator); //Creiamo il path del file dove sarà salvata la fattura
		
		OrdineModel model = new OrdineModel();
		Ordine ordine = new Ordine();
		String result = new String();
		
		try {
			ordine = model.doRetrieveAllByKey(codiceOrdine); //Creiamo il bean dell'ordine chiamando il model
			result = ordine.creaFattura(path); //Generiamo la fattura con il path e salviamo il risultato in result, ovvero il path finale della fattura
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			response.setContentType("text/html;charset=UTF-8"); //Settiamo la risposta a testo
			response.getWriter().write("Error"); //In caso di fallimento la risposta sarà Error e si esce
			e.printStackTrace();
		}
		
		String[] pathSubString = result.split("tswLogin"); //Splittiamo il path della fattura in modo da ottenere il path relativo al server
		result = "." + pathSubString[1]; //Aggiungiamo il punto prima del path per permettere al server di trovare il path relativo
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result); //Mandiamo ad ajax il path della fattura come risultato per aprirla in una pagina internet
		
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		return;
	}

}
