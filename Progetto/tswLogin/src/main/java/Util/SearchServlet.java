package Util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FumettiModel fModel = new FumettiModel();
		GraficheModel gModel = new GraficheModel();
		ModelliniModel mModel = new ModelliniModel();
		String keyWord = request.getParameter("keyWord");
		
		ArrayList<Articolo> ricercaProdotti = new ArrayList<Articolo>();
		
		ArrayList<FumettiBean> ricercaFumetti = new ArrayList<FumettiBean>();
		ArrayList<GraficheBean> ricercaGrafiche = new ArrayList<GraficheBean>();
		ArrayList<ModelliniBean> ricercaModellini = new ArrayList<ModelliniBean>();
		try {
			
			ricercaFumetti = new ArrayList<FumettiBean>(fModel.doRetrieveAllByKeyWord(null, keyWord));
			ricercaGrafiche = new ArrayList<GraficheBean>(gModel.doRetrieveAllByKeyWord(null, keyWord));
			ricercaModellini = new ArrayList<ModelliniBean>(mModel.doRetrieveAllByKeyWord(null, keyWord));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ricercaProdotti.addAll(ricercaFumetti);
		ricercaProdotti.addAll(ricercaGrafiche);
		ricercaProdotti.addAll(ricercaModellini);
		
		request.getSession().setAttribute("searchedItems", ricercaProdotti);
		response.sendRedirect("ricerca.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
