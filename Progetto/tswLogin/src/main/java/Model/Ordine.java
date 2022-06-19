package Model;

import java.sql.Date;
import java.util.ArrayList;

public class Ordine {
	String codice, utente, nomeF, cognomeF, indirizzoF, statoF, cityF, nomeS, cognomeS, indirizzoS, statoS, cityS;
	long capF, capS;
	double totale;
	Date data;
	ArrayList<ProdottoInCarrello> articoliOrdine;
		
	public Ordine() {
	}
	
	public Ordine(String codice, String utente, String nomeF, String cognomeF, String indirizzoF, String statoF, String cityF,
			long capF, String nomeS, String cognomeS, String indirizzoS, String statoS, String cityS, long capS, double totale,
			Date data, ArrayList<ProdottoInCarrello> articoliOrdine) {
		super();
		this.codice = codice;
		this.utente = utente;
		this.indirizzoF = indirizzoF;
		this.statoF = statoF;
		this.cityF = cityF;
		this.capF = capF;
		this.indirizzoS = indirizzoS;
		this.statoS = statoS;
		this.cityS = cityS;
		this.capS = capS;
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

	public String getIndirizzoF() {
		return indirizzoF;
	}

	public void setIndirizzoF(String indirizzoF) {
		this.indirizzoF = indirizzoF;
	}

	public String getStatoF() {
		return statoF;
	}

	public void setStatoF(String statoF) {
		this.statoF = statoF;
	}

	public String getCityF() {
		return cityF;
	}

	public void setCityF(String cityF) {
		this.cityF = cityF;
	}

	public String getIndirizzoS() {
		return indirizzoS;
	}

	public void setIndirizzoS(String indirizzoS) {
		this.indirizzoS = indirizzoS;
	}

	public String getStatoS() {
		return statoS;
	}

	public void setStatoS(String statoS) {
		this.statoS = statoS;
	}

	public String getCityS() {
		return cityS;
	}

	public void setCityS(String cityS) {
		this.cityS = cityS;
	}

	public long getCapF() {
		return capF;
	}

	public void setCapF(long capF) {
		this.capF = capF;
	}

	public long getCapS() {
		return capS;
	}

	public void setCapS(long capS) {
		this.capS = capS;
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

	public String getNomeF() {
		return nomeF;
	}

	public void setNomeF(String nomeF) {
		this.nomeF = nomeF;
	}

	public String getCognomeF() {
		return cognomeF;
	}

	public void setCognomeF(String cognomeF) {
		this.cognomeF = cognomeF;
	}

	public String getNomeS() {
		return nomeS;
	}

	public void setNomeS(String nomeS) {
		this.nomeS = nomeS;
	}

	public String getCognomeS() {
		return cognomeS;
	}

	public void setCognomeS(String cognomeS) {
		this.cognomeS = cognomeS;
	}

	@Override
	public String toString() {
		return "Ordine [codice=" + codice + ", utente=" + utente + ", totale=" + totale + ", data=" + data
				+ ", articoliOrdine=" + articoliOrdine + "]";
	}
	
	
}
