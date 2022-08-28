package Util;

import java.util.ArrayList;
import java.util.List;

import Model.ProdottoInCarrello;
import Model.Articolo;

public class Carrello {
	private List<ProdottoInCarrello> prodotti;

	  public Carrello() {
	    prodotti = new ArrayList<ProdottoInCarrello>();
	  }

	  public void aggiungi(Articolo prodotto, int quantità) {
		  for(ProdottoInCarrello x : prodotti) {
			  if(x.getProdotto().getSeriale() == prodotto.getSeriale()) { //Se il prodotto è già presente
				  x.setQuantity(x.getQuantity() + quantità); //Aggiorno la quantità
				  return;
			  }
		  }
		  
		   //Altrimenti creiamo un nuovo ProdottoInCarrello e lo inseriamo nel carrello
		  ProdottoInCarrello prod = new ProdottoInCarrello();
		  prod.setProdotto(prodotto);
		  prod.setQuantity(quantità);
		  prod.setPrezzo(prodotto.getPrezzo());
		  prod.setIva(prodotto.getIva());
		  prodotti.add(prod);
	  }

	  public void rimuoviProdotto(Articolo prodotto) {
		  for (ProdottoInCarrello x : prodotti) {
		      if(x.getProdotto().getSeriale() == prodotto.getSeriale()) {
		        prodotti.remove(x);
		        return;
		      }
		  }
	  }
	  
	  public void rimuoviProdotto(long seriale) {
		  for (ProdottoInCarrello x : prodotti) {
			  if(x.getProdotto().getSeriale() == seriale) {
				  prodotti.remove(x);
			      return;
			  }
		  }
	  }
	  
	  public void clearAll() {
	    prodotti.clear();
	    return;
	  }

	  public List<ProdottoInCarrello> getProdotti() {
	    return prodotti;
	  }

	@Override
	public String toString() {
		return "Carrello [prodotti=" + prodotti + "]";
	}
}

