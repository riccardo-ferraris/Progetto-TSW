package Model;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;

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
	
	public String creaFattura(String path) throws ClassNotFoundException, SQLException {
		UserModel userModel = new UserModel();
		UserBean utente = userModel.doRetrieveByKey(this.utente); 
		
		 PDDocument doc = new PDDocument();
		//Create Blank Page
		 PDPage newpage = new PDPage();
			    //Add the blank page
		doc.addPage(newpage);

		 
			int n = 0;
			int limit = 11;
			Integer q;
			int x = 0, y = 0;
			double totaleIvaInclusa = this.getTotale();
			double totaleIvaEsclusa = 0;
			
		    PDPage page = (PDPage)doc.getPage(0);
		    
		    
		    
		    PDFont font = PDType1Font.HELVETICA;
		    
		    try {
		        //Prepare Content Stream
		        PDPageContentStream cs = new PDPageContentStream(doc, page);
		        
		        //Writing Single Line text
		        //Writing the Invoice title
		        cs.beginText();
		        cs.setFont(font, 20);
		        cs.newLineAtOffset(250, 750);
		        cs.showText("Perspective Art");
		        cs.endText();

		        //Writing Multiple Lines
		        //writing the customer details
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.setLeading(20f);
		        cs.newLineAtOffset(60, 610);
		        cs.showText("Cliente: ");
		        cs.newLine();
		        cs.showText("Indirizzo: ");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.setLeading(20f);
		        cs.newLineAtOffset(110, 610);
		        cs.showText(this.nomeF + " " + this.getCognomeF());
     
		   		cs.newLine();
		        cs.showText(this.indirizzoF + ", ");
		        cs.showText(this.capF + ", " + this.cityF + " (" + this.statoF + ")");
		        cs.endText();
		        
		        cs.beginText();
		        cs.newLineAtOffset(440, 610);
		        cs.showText("Data ordine: ");
		        cs.newLine();
		        cs.showText("Codice ordine: ");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.setLeading(20f);
		        cs.newLineAtOffset(510, 610);
		        cs.showText(this.getData().toString());
		        cs.newLine();
		        cs.showText(this.getCodice());
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(60, 540);
		        cs.showText("Prodotto");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(300, 540);
		        cs.showText("Prezzo unitario");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(300, 530);
		        cs.showText("(IVA eclusa)");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(370, 540);
		        cs.showText("IVA %");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(410, 540);
		        cs.showText("Prezzo unitario");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(410, 530);
		        cs.showText("(IVA inclusa)");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(480, 540);
		        cs.showText("Quantità");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(530, 540);
		        cs.showText("Prezzo totale");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 10);
		        cs.newLineAtOffset(530, 530);
		        cs.showText("(IVA inclusa)");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 8);
		        cs.setLeading(20f);
		        cs.newLineAtOffset(60, 510);
		        for(ProdottoInCarrello prod : this.articoliOrdine) {
		        	n++;
		          cs.showText(prod.getProdotto().getNome());
		          cs.setFont(font, 6);
		          cs.setLeading(10f);
		          cs.newLine();
		          cs.showText("Codice articolo: " + prod.getProdotto().getSeriale());
		          cs.setLeading(20f);
		          cs.setFont(font, 8);
		          cs.newLine();
		          
		          
		        }
		        cs.endText();
	        
		        cs.beginText();
		        cs.setFont(font, 8);
		        cs.setLeading(30f);
		        cs.newLineAtOffset(338, 510);
		        for(ProdottoInCarrello prod : this.articoliOrdine) {
		        	double prezzoIvaEsclusa = (prod.getPrezzo() / (100 + prod.getProdotto().getIva()) * 100);
		        	totaleIvaEsclusa += (prezzoIvaEsclusa * prod.getQuantity()) ;
		          cs.showText(new DecimalFormat("0.00").format(prezzoIvaEsclusa) + "€");
		          cs.newLine();
		        }
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 8);
		        cs.setLeading(30f);
		        cs.newLineAtOffset(375, 510);
		        for(ProdottoInCarrello prod : this.articoliOrdine) {
		          cs.showText(prod.getProdotto().getIva() + "%");
		          cs.newLine();
		        }
		        cs.endText();
		        
		        
		        cs.beginText();
		        cs.setFont(font, 8);
		        cs.setLeading(30f);
		        cs.newLineAtOffset(448, 510);
		        for(ProdottoInCarrello prod : this.articoliOrdine) {
		        	double prezzoIvaInclusa = prod.getPrezzo();
		          cs.showText(new DecimalFormat("0.00").format(prezzoIvaInclusa) + "€");
		          cs.newLine();
		        }
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 8);
		        cs.setLeading(30f);
		        cs.newLineAtOffset(500, 510);
		        for(ProdottoInCarrello prod : this.articoliOrdine) {
		          cs.showText(prod.getQuantity() + "pz");
		          cs.newLine();
		        }
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 8);
		        cs.setLeading(30f);
		        cs.newLineAtOffset(560, 510);
		        for(ProdottoInCarrello prod : this.articoliOrdine) {
		        	cs.showText(new DecimalFormat("0.00").format(prod.getPrezzo() * prod.getQuantity()) + "€");
		        	cs.newLine();
		        }
		        cs.endText();
		        
		        int k = 500-(25*n);
		        
		        cs.beginText();
		        cs.setFont(font, 8);
		        cs.setLeading(20f);
		        cs.newLineAtOffset(300, k);
		        cs.showText("Spedizione: ");
		        cs.setLeading(25f);
		        cs.newLine();
		        cs.setFont(font, 10);
		        cs.showText("Totale fattura: ");
		        cs.setLeading(20f);
		        cs.newLine();
		        cs.setFont(font, 8);
		        cs.showText("Totale IVA esclusa: ");
		        cs.endText();
		        
		        cs.beginText();
		        cs.setFont(font, 8);
		        cs.setLeading(20f);
		        cs.newLineAtOffset(560, k);
		        cs.showText(new DecimalFormat("0.00").format(5) + "€");
		        cs.setFont(font, 10);
		        cs.setLeading(25f);
		        cs.newLine();
		        cs.showText(new DecimalFormat("0.00").format(this.getTotale()) + "€");
		        cs.setFont(font, 8);
		        cs.setLeading(20f);
		        cs.newLine();
		        cs.showText(new DecimalFormat("0.00").format(totaleIvaEsclusa) + "€");
		        cs.endText();
		        
		        //Close the content stream
		        cs.close();
		        //Save the PDF
		        doc.save(path + "/fattura" + this.getCodice() + ".pdf");
		        doc.close();

		      } catch (IOException e) {
		        e.printStackTrace();
		      }
		    
		    return (path + "/fattura" + this.getCodice() + ".pdf");
		  }    
	}
