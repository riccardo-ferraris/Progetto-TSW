package tsw.Control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Articolo;
import Model.ArticoloModel;
import Model.FumettiModel;
import Model.GraficheModel;
import Model.ModelliniModel;
import Model.ProdottoInCarrello;
import Util.Carrello;

/**
 * Servlet implementation class ServletCarrello
 */
@WebServlet("/ServletCarrello")
public class ServletCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCarrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		
		Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
        if (carrello == null) {
            carrello = new Carrello();
            request.getSession().setAttribute("carrello", carrello);
        }
		
	    
	    String codProd = request.getParameter("seriale");
	    
	    if(action.trim().equals("modificaQuantitativo")){
	    	  int q =  Integer.valueOf(request.getParameter("quantità"));
	    	  for (ProdottoInCarrello x : carrello.getProdotti()) {
	    	      if (x.getProdotto().getSeriale() == Long.parseLong(request.getParameter("seriale"))) {
	    	        x.setQuantità(q);
	    	        response.sendRedirect("carrello.jsp");
	    	        return;
	    	      }
	    	    }
	      }else {
	    	  String macroCategoriaProdotto = request.getParameter("macroCategoria");
	    
	    	  /* if ((action == null) || (carrello == null) || (codProd == null)) {
	      	//lo rimando alla pagina carrello
	      	response.sendRedirect("checkout.jsp");
	      	return;
	    	}*/
	    
	    	  long codice = Long.parseLong(codProd);
	    	  ArticoloModel model = null;
	    	  Articolo prodotto = null;
	    	  try {
	    		  switch(macroCategoriaProdotto) {
	    		  case "Fumetti": model = new FumettiModel();
	      			prodotto = model.doRetrieveByKey(codice);
	      			break;
	    	  
	    		  case "Grafiche": model = new GraficheModel();
      	  			prodotto = model.doRetrieveByKey(codice);
      	  			break;
	      
	    		  case "Modellini": model = new ModelliniModel();
      	  			prodotto = model.doRetrieveByKey(codice);
      	  			break;
	    		  }
	      
	    		  if (prodotto == null) {
	    			  //response.sendRedirect("checkout.jsp");
	    			  return;
	    		  }
	      
	      
	    		  if (action.trim().equals("aggiungi")) {
	    			  int quant = Integer.valueOf(request.getParameter("quantita"));
	    			  carrello.aggiungi(prodotto, quant);
	        
	    			  //salvo il carrello
	    			  request.getSession().setAttribute("carrello", carrello);
	    			  
	    			  response.sendRedirect("Prodotto.jsp?id="+codice);
	    			  //System.out.println("Aggiunto al carrello");
	    			  return;
	    		  }
	    		  else if (action.trim().equals("rimuovi")) {
	    			  carrello.rimuovi(prodotto);
	        
	    			  //salvo il carrello
	    			  request.getSession().setAttribute("carrello", carrello);
	    			  //System.out.println("Rimosso dal carrello");
	    			  //ritorno alla pagina carrello

	    			  return;
	    		  }
	    		  else {
	    			  //errore
	    			  response.sendRedirect("Prodotto.jsp");
	    			  return;
	    		  }
	    	  }
	      
	    	  catch (SQLException | ClassNotFoundException e) {
	    		  response.sendRedirect("Prodotto.jsp");
	    		  return;
	    	}
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
