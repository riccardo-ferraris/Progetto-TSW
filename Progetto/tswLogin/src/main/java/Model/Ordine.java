package Model;

import java.awt.Color;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.awt.*;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;

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
		return "\nOrdine [codice=" + codice + ",\n utente=" + utente + ",\n totale=" + totale + ",\n data=" + data
				+ ",\n articoliOrdine=" + articoliOrdine + "]";
	}
	
	public boolean containsSeriale(Long seriale) {
		boolean result = false;
		for(ProdottoInCarrello prod : this.articoliOrdine) {
			if(prod.getProdotto().getSeriale() == seriale) {
				result = true;
			}
		}
		
		return result;
	}
	
	public void creaFattura(String path) throws ClassNotFoundException, SQLException {
		UserModel userModel = new UserModel();
		UserBean utente = userModel.doRetrieveByKey(this.utente); 
		
		 PDDocument doc = null;
		  
		  try
		  {
			int n = 0;
			int limit = 11;
			Integer q;
			int x = 0, y = 0;
			double totaleIvaInclusa = this.getTotale();
			double totaleIvaEsclusa = 0;
			
			
			File f = new File(path + "/struttura_fattura.pdf");
		    doc = PDDocument.load(f);
		    PDPage page = (PDPage)doc.getDocumentCatalog().getPages().get(0);
		    PDPageContentStream contentStream = new PDPageContentStream(doc, page, PDPageContentStream.AppendMode.APPEND, true, true);
		    
		    PDFont font = PDType1Font.HELVETICA;
		    
		    contentStream.beginText();
		    contentStream.setFont(font, 8);
		    
		    x+=65; y+=595;
		    contentStream.newLineAtOffset(65, 595);
		    contentStream.showText(utente.getNome() + " " + utente.getCognome()); //stampa nome e cognome
		    
		    x+=0; y+=-20;
		    contentStream.newLineAtOffset(0, -15);
		    contentStream.showText(this.getIndirizzoF());
		    contentStream.newLineAtOffset(0, -10);
		    contentStream.showText(this.getCapF() + " " + this.getCityF() + " (" + this.getStatoF() + ")"); //stampa indirizzo
		    
		    x+=372; y+=20;
		    contentStream.newLineAtOffset(372, 20);
		    contentStream.showText(this.getData().toLocalDate().toString()); //stampa data fattura
		    
		    x+=110; y+=0;
		    contentStream.newLineAtOffset(110, 0);
		    contentStream.showText(this.getCodice()); //stampa numero fattura (alias id ordine)
		    
		    x+=-478; y+=-100;
		    contentStream.newLineAtOffset(-478, -100);
		    
		    
		    for(ProdottoInCarrello prod : this.articoliOrdine)
		    {
		    	q = prod.getQuantità();
		    	
		    	contentStream.showText("(" + prod.getProdotto().getSeriale() +") "+ prod.getProdotto().getNome()); // stampa codice e nome del prodotto
		    
		    	double prezzoIvaEsclusa = prod.getPrezzo() - (prod.getPrezzo() * prod.getProdotto().getIva());
		    	totaleIvaEsclusa+= prezzoIvaEsclusa;
		    	
		    	x+=173; y+=0;
		    	contentStream.newLineAtOffset(173, 0);
		    	contentStream.showText((prod.getPrezzo()+"€")); //stampa prezzo con iva
		    
		    	x+=85; y+=0;
		    	contentStream.newLineAtOffset(85, 0);
		    	contentStream.showText(q.toString()+" pz"); //stampa quantita
		    
		    	x+=85; y+=0;
		    	contentStream.newLineAtOffset(85, 0);
		    	contentStream.showText(prezzoIvaEsclusa + "€"); //stampa prezzo senza iva
		    
		    	x+=80; y+=0;
		    	contentStream.newLineAtOffset(80, 0);
		    	contentStream.showText((prod.getProdotto().getIva()) + "%"); // stampa iva
		    	
		    	x+=-423; y+=-35;
		    	contentStream.newLineAtOffset(-423, -35);
		    	
		    	if(n == limit)
		    	{
		    		limit += 20;// nuovo numero
		    		
		    		f = new File(path + "/fattura_nextPage.pdf");
		    		
		    		page = (PDPage)PDDocument.load(f).getDocumentCatalog().getPages().get(0);
		    		
		    		doc.addPage(page);
		    		
		    		contentStream.endText();
		 		    contentStream.close();
		    		
		    		contentStream = new PDPageContentStream(doc, page, PDPageContentStream.AppendMode.APPEND, true, true);
		    		
		    		contentStream.beginText();
		    		contentStream.setFont(font, 8);
		    		
		    		x=65; y=765;
		    		contentStream.newLineAtOffset(x, y);
		    	}
		    }
		    
		    contentStream.endText();
		    
		    if(limit-n <=3)
		    {
		    	f = new File(path + "/fattura_nextPage.pdf");
	    		
	    		page = (PDPage)PDDocument.load(f).getDocumentCatalog().getPages().get(0);
	    		
	    		doc.addPage(page);
	    		
	 		    contentStream.close();
	    		
	    		contentStream = new PDPageContentStream(doc, page, PDPageContentStream.AppendMode.APPEND, true, true);
	    		contentStream.setFont(font, 8);
	    		
	    		x=65; y=765;
		    }
		    x=40; y+=0;
		    contentStream.moveTo(x, y);
		    
		    x=562; y+=0;
		    contentStream.lineTo(x, y);
		    contentStream.setLineWidth((float) 0.3);   
		    contentStream.setStrokingColor(new Color(255, 140, 0));
	        contentStream.stroke();   
		    
		    contentStream.beginText();
		    
		    x=65; y+= -40;
		    
		    contentStream.newLineAtOffset(400, 10);
		    contentStream.showText("Imponibile:   € " + totaleIvaEsclusa); //stampa totale senza iva
		    
		    contentStream.newLineAtOffset(0, -10);
		    contentStream.showText("di cui IVA:    € " +  String.format("%.2f",(totaleIvaInclusa - totaleIvaEsclusa))); //stampa importo dovuto all'iva
		    
		    contentStream.newLineAtOffset(0, -10);
		    contentStream.showText("Totale dovuto:  € " +  String.format("%.2f", totaleIvaInclusa)); //stampa totale
		    
		    contentStream.endText();
		    contentStream.close();
		    
		    page = (PDPage)doc.getDocumentCatalog().getPages().get(0);
		    contentStream = new PDPageContentStream(doc, page, PDPageContentStream.AppendMode.APPEND, true, true);
		    
		    contentStream.beginText();
		    contentStream.setFont(font, 8);
		    
		    contentStream.newLineAtOffset(335, 590);
		    contentStream.showText( String.format("%.2f", totaleIvaInclusa)+"€"); //stampa totale
		    
		    contentStream.endText();
		    contentStream.close();
		    
		    doc.save(path + "/fattura.pdf");  

		    doc.close();
		  }
		  catch (IOException e) 
		  {
		    e.printStackTrace();
		  }
		  
		  System.out.println(path);
		 }
	}
