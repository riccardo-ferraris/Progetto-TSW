package Util;

import java.util.ArrayList;
import Model.ProdottoInCarrello;
import Model.Articolo;

public class Carrello {
	private ArrayList<ProdottoInCarrello> prodotti;

	  public Carrello() {
	    prodotti = new ArrayList<ProdottoInCarrello>();
	  }

	  public void aggiungi(Articolo prodotto) {
	    for (ProdottoInCarrello x : prodotti) {
	      if (x.getProdotto().getSeriale() == prodotto.getSeriale()) {
	        // ce l'ho già
	        // aggiorno la quantità
	        x.setQuantità(x.getQuantità() + 1);
	        return;
	      }
	    }
	    // altrimenti instanzio un prodottoincarrello
	    // con questo prodotto e quantità = 1
	    // e inserisco nell'array
	    ProdottoInCarrello prod = new ProdottoInCarrello();
	    prod.setProdotto(prodotto);
	    prod.setQuantità(1);
	    prodotti.add(prod);
	  }

	  public void rimuovi(Articolo prodotto) {
	    for (ProdottoInCarrello x : prodotti) {
	      if (x.getProdotto().getSeriale() == prodotto.getSeriale()) {
	        // ho trovato quel prodotto
	        int quantita = x.getQuantità();
	        if (quantita > 1) {
	          quantita--;
	          x.setQuantità(quantita);
	          return;
	        } else {
	          prodotti.remove(x);
	          return;
	        }
	      }
	    }
	  }

	  public void rimuoviPerBene(Articolo prodotto) {
	    for (ProdottoInCarrello x : prodotti) {
	      if (x.getProdotto().getSeriale() == prodotto.getSeriale()) {
	        // ho trovato quel prodotto
	        prodotti.remove(x);
	        return;
	      }
	    }
	  }
	  
	  public void clearAll() {
	    prodotti.clear();
	  }

	  public ArrayList<ProdottoInCarrello> getProdotti() {
	    return prodotti;
	  }

	@Override
	public String toString() {
		return "Carrello [prodotti=" + prodotti + "]";
	}
	  
	}

