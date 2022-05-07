package Model;

public class FumettiBean extends Articolo{
	
	private String scrittore;
	private int numPagine;
	private String disegnatore;
	private String categoria;
	
	public FumettiBean() {
		
	}

	public FumettiBean(String nome, String scrittore, int numPagine, String disegnatore, String categoria,
			long seriale, double prezzo, int quantità, String descrizione) {
		super(nome, seriale, prezzo, quantità, descrizione);	
		this.scrittore = scrittore;
		this.numPagine = numPagine;
		this.disegnatore = disegnatore;
		this.categoria = categoria;
	}

	public long getSeriale() {
		return seriale;
	}

	public void setSeriale(long seriale) {
		this.seriale = seriale;
	}

	public String getTitolo() {
		return nome;
	}

	public void setTitolo(String titolo) {
		this.nome = titolo;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public int getQuantità() {
		return quantità;
	}

	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getScrittore() {
		return scrittore;
	}

	public void setScrittore(String scrittore) {
		this.scrittore = scrittore;
	}

	public int getNumPagine() {
		return numPagine;
	}

	public void setNumPagine(int numPagine) {
		this.numPagine = numPagine;
	}

	public String getDisegnatore() {
		return disegnatore;
	}

	public void setDisegnatore(String disegnatore) {
		this.disegnatore = disegnatore;
	}
	
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getCategoria() {
		return categoria;
	}
	
	
}


