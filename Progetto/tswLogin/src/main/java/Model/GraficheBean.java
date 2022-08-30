package Model;

public class GraficheBean extends Articolo{

	
	public GraficheBean() {
		this.macroCategoria = "Grafiche";
	}
	
	public GraficheBean(String nome, long seriale, double prezzo, int quantità, String descrizione,
			 String macroCategoria, int numVendite, double iva, boolean visible, String categoria) {
		super(nome, seriale, prezzo, quantità, descrizione, macroCategoria, numVendite, iva, visible, categoria);
		this.macroCategoria = "Grafiche";
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

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getCategoria() {
		return categoria;
	}
	
	public String getMacroCategoria() {
		return macroCategoria;
	}

	@Override
	public String toString() {
		return "GraficheBean [categoria=" + categoria + ", nome=" + nome + ", seriale=" + seriale + ", prezzo=" + prezzo
				+ ", quantità=" + quantità + ", descrizione=" + descrizione + "]";
	}
	
	
	
}


