package tsw.Control;

import java.io.IOException;
import java.sql.SQLException;
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
		String action = request.getParameter("action"); //La variabile action prende il valore del parametro action, che indica la funzione evocata dall'utente
		String page = request.getParameter("page"); //La variabile page prende il valore del parametro page, che indica la pagina da cui è stata chiamata la servlet

		Carrello carrello = (Carrello) request.getSession().getAttribute("carrello"); //Prende il carrello dalla sessione
		
        if (carrello == null) {  //Se carrello è null perché non è presente in sessione, ne viene creato uno 
            carrello = new Carrello();
            request.getSession().setAttribute("carrello", carrello);
        }
		
	    
	    String codProd = request.getParameter("seriale");
	    String macroCategoriaProdotto = request.getParameter("macroCategoria"); //Prendiamo la macroCategoria per capire che tipo di articolo avremo
	    long codice = 00000;
	    
	    ArticoloModel model = null;
  	  	Articolo prodotto = null;
	    
  	  	try {
	    	if(codProd != null) { //Controlla che il codice sia effettivamente passato come parametro e che non sia nullo prima di fare un parse, che altrimenti genererebbe errore
	    		codice = Long.parseLong(codProd);
	    		
	    		if(macroCategoriaProdotto != null) {
	    			
		    		switch(macroCategoriaProdotto) { //Creiamo un bean del prodotto di cui abbiamo prodotto
		    		  case "Fumetti": model = new FumettiModel();
		      			prodotto = model.doRetrieveByKey(codice);
		      			break;
		    	  
		    		  case "Grafiche": model = new GraficheModel();
	      	  			prodotto = model.doRetrieveByKey(codice);
	      	  			break;
		      
		    		  case "Modellini": model = new ModelliniModel();
	      	  			prodotto = model.doRetrieveByKey(codice);
	      	  			break;
	      	  			
	      	  		  default: 
	      	  			  break;
		    		}
		    	}	
	    	}   	  
	     }
	    
	    catch (SQLException | ClassNotFoundException e) {
		  		  response.sendRedirect(page); //Se il try/catch fallisce l'utente viene reindirizzato alla pagina da cui ha chiamato la servlet, specificata nella variabile page
		  		  return;
		  	  }	

	    switch(action) { //Controlliamo il valore della variabile action per determinare l'operazione da svolgere
	    	case "aggiungi":  
	    		if (prodotto == null) { //Se il prodotto dovesse essere null l'utente torna alla pagina precedente e la servlet fallisce
	    			response.sendRedirect(page);
	    			return;
	    		}
	    		
	    		int quant = Integer.valueOf(request.getParameter("numAggiungi")); //La variabile quant prende il valore del parametro numAggiungi, che contiene la quantità del prodotto che l'utente ha inserito nel carrello
    			carrello.aggiungi(prodotto, quant); //Il prodotto viene aggiunto il carrello con la quantità specificata, tramite il metodo aggiungi()
    			  
    			request.getSession().setAttribute("carrello", carrello); //Salva il carrello  
    			response.sendRedirect("Prodotto.jsp?id="+codice); //Torna alla pagina del prodotto

    			return;
    			  
	    	case "rimuoviBySeriale":
	    		carrello.rimuoviProdotto(codice); //Rimuove il prodotto specificato dal seriale
    			request.getSession().setAttribute("carrello", carrello); //Salva il carrello
    			response.sendRedirect("carrello.jsp"); //Torna al carrello
    			return;
    			  	
	    	case "modificaQuantitativo": //Modifica la quantità del prodotto presente in carrello
	    		int q =  Integer.valueOf(request.getParameter("numModifica")); //La variabile q prende il valore del parametro numModifica, che viene passato quando un utente cambia la quantità di un prodotto presente in carrello
	    		  
	    		for (ProdottoInCarrello x : carrello.getProdotti()) { //Scorriamo tutti i prodotti in carrello per cercare quello che ci interessa
	    			if (x.getProdotto().getSeriale() == Long.parseLong(request.getParameter("seriale"))) { //Confrontiamo il seriale del prodotto nel ciclo con il seriale del prodotto di cui vogliamo modificare la quantità
	    				x.setQuantità(q); //Settiamo a q la quantità del prodotto tramite il metodo setQuantità()
		    	  		response.sendRedirect("carrello.jsp"); //Torniamo al carrello
		    	  		return;
		    	  	}
		    	}
		    	
	    		response.sendRedirect("carrello.jsp"); //In caso di errore torniamo alla pagina carrello
		    	return;
    			
	    		case "svuotaCarrello": carrello.clearAll(); //Svuotiamo il carrello tramite il metodo clearAll()
	    			response.sendRedirect("carrello.jsp"); //Torniamo alla pagina carrello
	    			return;
    			
	    		default: 
	    			if(page.equals("Prodotto.jsp")) { //In caso di errore, se la servlet è stata invocata dalla pagina del prodotto
	    				response.sendRedirect(page+ "?id=" +codProd); //L'utente viene reindirizzato alla pagina del prodotto da cui ha invocato la servlet
	    			}
	    			response.sendRedirect(page); //In caso di errore torniamo alla pagina da cui abbiamo invocato la servlet
    				return;
	    }
	    		  
	    		  /**********************************************************************************************************
	    		   * Metodo con if-else nestati poco pulito, ho optato per sostituirlo con uno switch							
	    		   * Questo commento verrà definitivamente eliminato successivamente, una volta appurato che il nuovo codice
	    		   * sia equivalente e funzionante
	    		   **********************************************************************************************************
	    		  if (action.trim().equals("aggiungi")) {
	    			  int quant = Integer.valueOf(request.getParameter("quantita"));
	    			  carrello.aggiungi(prodotto, quant);
		  
	    			  request.getSession().setAttribute("carrello", carrello);	//salva il carrello  
	    			  response.sendRedirect("Prodotto.jsp?id="+codice); //torna alla pagina del prodotto

	    			  return;
	    		  }
	    		  else if (action.trim().equals("rimuoviBySeriale")) {
	    			  carrello.rimuoviProdotto(codice);
 
	    			  request.getSession().setAttribute("carrello", carrello); //salva il carrello
	    			  response.sendRedirect("carrello.jsp"); //torna al carrello
	    			  return;
	    		  }
	    		  else {  //errore 			  
	    			  response.sendRedirect("Prodotto.jsp");
	    			  return;
	    		  }*/
	    	  
	    	}
	      
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
