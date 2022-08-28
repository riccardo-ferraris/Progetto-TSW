package Util;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

/**
 * Servlet implementation class RetrieveProdotti
 */
@WebServlet("/RetrieveProdotti")
public class RetrieveProdotti extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RetrieveProdotti() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArticoloModel model;
		List<FumettiBean> arrayFumetti = new ArrayList<FumettiBean>();
		List<GraficheBean> arrayGrafiche = new ArrayList<GraficheBean>(); 
		List<ModelliniBean> arrayModellini = new ArrayList<ModelliniBean>();
		
		model = new FumettiModel();
		try {
			arrayFumetti = new ArrayList<FumettiBean>(((FumettiModel)model).doRetrieveAll(null));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model = new GraficheModel();
		try {
			arrayGrafiche = new ArrayList<GraficheBean>(((GraficheModel)model).doRetrieveAll(null));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model = new ModelliniModel();
		try {
			arrayModellini = new ArrayList<ModelliniBean>(((ModelliniModel)model).doRetrieveAll(null));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("arrayFumetti", arrayFumetti);
		request.setAttribute("arrayGrafiche", arrayGrafiche);
		request.setAttribute("arrayModellini", arrayModellini);
		
		RequestDispatcher view = request.getRequestDispatcher("home.jsp");
		view.forward(request, response);
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
