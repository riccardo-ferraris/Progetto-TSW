package Util;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.Ordine;
import Model.OrdineModel;

/**
 * Servlet implementation class FiltraOrdiniAdmin
 */
@WebServlet("/FiltraOrdiniAdmin")
public class FiltraOrdiniAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FiltraOrdiniAdmin() {
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
		String username = request.getParameter("username");
		String dataString = request.getParameter("date");
		String dataRange = request.getParameter("datefilter");
		long seriale = (request.getParameter("seriale") !=  "") ? seriale = Long.parseLong(request.getParameter("seriale")) : 0;
		
		OrdineModel model = new OrdineModel();
		ArrayList<Ordine> listaOrdini = new ArrayList<Ordine>();
        try {
			listaOrdini = new ArrayList<Ordine>(model.doRetrieveAll(null));
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        String[] dataRangeParts = (dataRange != "") ? dataRangeParts = dataRange.split("-") : null;
		String dataMinString = (dataRangeParts != null) ? dataMinString = dataRangeParts[0].replace(" ", "").replace("/", "-") : null;
		String dataMaxString = (dataRangeParts != null) ? dataMaxString = dataRangeParts[1].replace(" ", "").replace("/", "-") : null;
		Date dataMin = (dataMinString != null) ? dataMin = Date.valueOf(dataMinString) : null;
		Date dataMax = (dataMaxString != null) ? dataMax = Date.valueOf(dataMaxString) : null;
        Date data = (dataString != "") ? data = Date.valueOf(dataString) : null;
             
        List<Ordine> filteredList = listaOrdini
        		  .stream()
        		  .filter(c -> username == "" || c.getUtente().equals(username))
        		  .filter(c -> data == null || c.getData().equals(data))
        		  .filter(c -> dataRange == "" || ((c.getData().after(dataMin) && c.getData().before(dataMax)) || (c.getData().equals(dataMin)) || (c.getData().equals(dataMax))))
        		  .filter(c -> seriale == 0 || c.containsSeriale(seriale))
        		  .collect(Collectors.toList());
        
        Collections.reverse(filteredList);
        response.setContentType("application/json");
		new Gson().toJson(filteredList, response.getWriter());
		return;
	}

}
