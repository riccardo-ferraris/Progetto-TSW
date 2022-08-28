package Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ArticoloModel;
import Model.FumettiModel;
import Model.GraficheModel;
import Model.ModelliniModel;

/**
 * Servlet implementation class NascondiProdotto
 */
@WebServlet("/NascondiProdotto")
public class NascondiProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NascondiProdotto() {
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
		String catProd = request.getParameter("categoria");
		long serialeProd = Long.parseLong(request.getParameter("seriale"));
		boolean value = Boolean.valueOf(request.getParameter("nascondi"));
		ArticoloModel model = new ArticoloModel();
		
		switch(catProd) {
		case "Fumetti":
			model = new FumettiModel();
			break;
			
		case "Grafiche":
			model = new GraficheModel();
			break;
			
		case "Modellini":
			model = new ModelliniModel();
			break;
		}
		
		try {
			model.toggleVisibility(serialeProd, value);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("CatalogoAdmin.jsp");
		return;
	}

}
