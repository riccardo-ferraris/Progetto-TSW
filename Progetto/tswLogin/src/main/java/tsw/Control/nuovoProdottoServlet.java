package tsw.Control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Articolo;
import Model.ArticoloModel;
import Model.FumettiBean;
import Model.FumettiModel;
import Model.GraficheBean;
import Model.GraficheModel;
import Model.ModelliniBean;
import Model.ModelliniModel;

/**
 * Servlet implementation class nuovoProdottoServlet
 */
@WebServlet("/nuovoProdottoServlet")
public class nuovoProdottoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nuovoProdottoServlet() {
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
		String categoria = request.getParameter("categoria");
		Articolo articolo = null;
		ArticoloModel model = null;
		PrintWriter out = response.getWriter();
		
		switch(categoria) {
		case "fumetti":
			model = new FumettiModel();
			articolo = new FumettiBean(request.getParameter("nome"), request.getParameter("scrittore"),
					Integer.parseInt(request.getParameter("numPagine")), 
					request.getParameter("disegnatore"), request.getParameter("sottoCategoria"),
					Long.parseLong(request.getParameter("seriale")), Double.parseDouble(request.getParameter("prezzo")),
					Integer.parseInt(request.getParameter("quantità")), request.getParameter("descrizione"));
			try {
				((FumettiModel)model).databaseInsert(((FumettiBean)articolo));
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//inserire query di inserimento db
			
			out.println("<p>" + articolo.toString() + "</p>");
			
			break;
			
		case "grafica": //articoloModel = new GraficheModel();
			articolo = new GraficheBean(request.getParameter("nome"), Long.parseLong(request.getParameter("seriale")),
					Double.parseDouble(request.getParameter("prezzo")), Integer.parseInt(request.getParameter("quantità")),
					request.getParameter("descrizione"), request.getParameter("categoria"));
			
			out.println("<p>" + articolo.toString() + "</p>");
		break;
		
		case "modellino": 
			articolo = new ModelliniBean(Long.parseLong(request.getParameter("seriale")), request.getParameter("nome"),
					Double.parseDouble(request.getParameter("prezzo")), Integer.parseInt(request.getParameter("quantità")),
					request.getParameter("descrizione"), request.getParameter("categoria"), request.getParameter("franchise"),
					Double.parseDouble(request.getParameter("dimensioni")));
			
			out.println("<p>" + articolo.toString() + "</p>");
		break;
		
		default: System.out.println("Errore!");
		break;
		}
	}

}
