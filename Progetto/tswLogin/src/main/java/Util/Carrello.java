package Util;

import java.util.ArrayList;
import Model.ProdottoInCarrello;
import Model.Articolo;

public class Carrello {
	private ArrayList<ProdottoInCarrello> prodotti;

	  public Carrello() {
	    prodotti = new ArrayList<ProdottoInCarrello>();
	  }

	  public void aggiungi(Articolo prodotto, int quantit�) {
	    for (ProdottoInCarrello x : prodotti) {
	      if (x.getProdotto().getSeriale() == prodotto.getSeriale()) {
	        // ce l'ho gi�
	        // aggiorno la quantit�
	        x.setQuantity(x.getQuantity() + quantit�);
	        return;
	      }
	    }
	    // altrimenti instanzio un prodottoincarrello
	    // con questo prodotto e quantit� = 1
	    // e inserisco nell'array
	    
	    ProdottoInCarrello prod = new ProdottoInCarrello();
	    prod.setProdotto(prodotto);
	    prod.setQuantity(quantit�);
	    prod.setPrezzo(prodotto.getPrezzo());
	    prod.setIva(prodotto.getIva());
	    prodotti.add(prod);
	  }

	  public void rimuoviProdotto(Articolo prodotto) {
	    for (ProdottoInCarrello x : prodotti) {
	      if (x.getProdotto().getSeriale() == prodotto.getSeriale()) {
	        // ho trovato quel prodotto
	        prodotti.remove(x);
	        return;
	      }
	    }
	  }
	  
	  public void rimuoviProdotto(long seriale) {
		    for (ProdottoInCarrello x : prodotti) {
		      if (x.getProdotto().getSeriale() == seriale) {
		        // ho trovato quel prodotto
		        prodotti.remove(x);
		        return;
		      }
		    }
		  }
	  
	  public void clearAll() {
	    prodotti.clear();
	    return;
	  }

	  public ArrayList<ProdottoInCarrello> getProdotti() {
	    return prodotti;
	  }

	@Override
	public String toString() {
		return "Carrello [prodotti=" + prodotti + "]";
	}
	  
}

