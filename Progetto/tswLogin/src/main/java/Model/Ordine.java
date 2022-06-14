package Model;

import java.sql.Date;
import java.util.ArrayList;

public class Ordine {
	String codice, utente;
	double totale;
	Date data;
	ArrayList<ProdottoInCarrello> articoliOrdine;
		
	public Ordine() {
	}
	
	public Ordine(String codice, String utente, double totale, Date data, ArrayList<ProdottoInCarrello> articoliOrdine) {
		super();
		this.codice = codice;
		this.utente = utente;
		this.totale = totale;
		this.data = data;
		this.articoliOrdine = articoliOrdine;
	}

	public String getCodice() {
		return codice;
	}

	public void setCodice(String codice) {
		this.codice = codice;
	}

	public String getUtente() {
		return utente;
	}

	public void setUtente(String utente) {
		this.utente = utente;
	}

	public double getTotale() {
		return totale;
	}

	public void setTotale(double totale) {
		this.totale = totale;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public ArrayList<ProdottoInCarrello> getArticoliOrdine() {
		return articoliOrdine;
	}

	public void setArticoliOrdine(ArrayList<ProdottoInCarrello> articoliOrdine) {
		this.articoliOrdine = articoliOrdine;
	}

	@Override
	public String toString() {
		return "Ordine [codice=" + codice + ", utente=" + utente + ", totale=" + totale + ", data=" + data
				+ ", articoliOrdine=" + articoliOrdine + "]";
	}
	
	
}
