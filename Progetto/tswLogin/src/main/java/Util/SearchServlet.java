package Util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		ArticoloModel model;
		String keyWord = request.getParameter("keyWord");
		request.getSession().setAttribute("keyWord", keyWord);
		
		List<Articolo> ricercaProdotti = new ArrayList<Articolo>();
		List<FumettiBean> ricercaFumetti = new ArrayList<FumettiBean>();
		List<GraficheBean> ricercaGrafiche = new ArrayList<GraficheBean>();
		List<ModelliniBean> ricercaModellini = new ArrayList<ModelliniBean>();
		
		model = new FumettiModel();
		try {	
			ricercaFumetti = new ArrayList<FumettiBean>(((FumettiModel)model).doRetrieveAllByKeyWord(null, keyWord));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model = new GraficheModel();
		try {	
			ricercaGrafiche = new ArrayList<GraficheBean>(((GraficheModel)model).doRetrieveAllByKeyWord(null, keyWord));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model = new ModelliniModel();
		try {	
			ricercaModellini = new ArrayList<ModelliniBean>(((ModelliniModel)model).doRetrieveAllByKeyWord(null, keyWord));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ricercaProdotti.addAll(ricercaFumetti);
		ricercaProdotti.addAll(ricercaGrafiche);
		ricercaProdotti.addAll(ricercaModellini);
		
		request.getSession().setAttribute("searchedItems", ricercaProdotti);
		response.sendRedirect("ricerca.jsp");
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
