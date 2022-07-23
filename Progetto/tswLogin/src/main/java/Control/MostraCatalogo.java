package Control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ArticoloModel;
import Model.FumettiBean;
import Model.FumettiModel;
import Model.GraficheBean;
import Model.GraficheModel;
import Model.ModelliniBean;
import Model.ModelliniModel;
import Model.UserBean;

/**
 * Servlet implementation class MostraCatalogo
 */
@WebServlet("/MostraCatalogo")
public class MostraCatalogo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostraCatalogo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");
		String page = request.getParameter("page");
		String parag = request.getParameter("parag");
		ArticoloModel model;
		ArrayList<FumettiBean> arrayManga = new ArrayList<FumettiBean>();
		ArrayList<FumettiBean> arrayManhua = new ArrayList<FumettiBean>(); 
		ArrayList<GraficheBean> arrayOpera = new ArrayList<GraficheBean>();
		ArrayList<GraficheBean> arrayModerne = new ArrayList<GraficheBean>();
		ArrayList<ModelliniBean> arrayFunko = new ArrayList<ModelliniBean>();
		ArrayList<ModelliniBean> arrayFigures = new ArrayList<ModelliniBean>();
		
		model = new FumettiModel();
		try {
			arrayManga = new ArrayList<FumettiBean>(((FumettiModel)model).doRetrieveAllManga(null));
			arrayManhua = new ArrayList<FumettiBean>(((FumettiModel)model).doRetrieveAllManhua(null));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model = new GraficheModel();
		try {
			 arrayOpera = new ArrayList<GraficheBean>(((GraficheModel)model).doRetrieveAllOpera(null));
			 arrayModerne = new ArrayList<GraficheBean>(((GraficheModel)model).doRetrieveAllModerna(null));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model = new ModelliniModel();
		try {
			arrayFunko = new ArrayList<ModelliniBean>(((ModelliniModel)model).doRetrieveAllFunko(null));
			arrayFigures = new ArrayList<ModelliniBean>(((ModelliniModel)model).doRetrieveAllFigures(null));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("arrayManga", arrayManga);
		request.setAttribute("arrayManhua", arrayManhua);
		request.setAttribute("arrayOpera", arrayOpera);
		request.setAttribute("arrayModerne", arrayModerne);
		request.setAttribute("arrayFunko", arrayFunko);
		request.setAttribute("arrayFigures", arrayFigures);

		if(utente == null || utente.getRuolo().equals("user") || (page != null && page.equals("viewUtenti"))){
			if(parag == null || parag.equals("")) {
				RequestDispatcher view = request.getRequestDispatcher("Catalogo.jsp");
				view.forward(request, response);
			}else {
				RequestDispatcher view = request.getRequestDispatcher("Catalogo.jsp" + parag);
				view.forward(request, response);
			}
			
			return;
		}else if(utente.getRuolo().equals("admin")){
		RequestDispatcher view = request.getRequestDispatcher("CatalogoAdmin.jsp");
		view.forward(request, response);
		return;
		}
		
        
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
