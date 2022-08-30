package Model;

public class Articolo {
	protected String nome;
	protected long seriale;
	protected double prezzo;
	protected int quantità;
	protected String descrizione;
	protected String macroCategoria;
	protected int numVendite;
	protected double iva;
	protected boolean visible;
	protected String categoria;
	
	public Articolo() {}

	public Articolo(String nome, long seriale, double prezzo, int quantità, String descrizione, String macroCategoria, int numVendite, double iva, boolean visible, String categoria) {
		this.nome = nome;
		this.seriale = seriale;
		this.prezzo = prezzo;
		this.quantità = quantità;
		this.descrizione = descrizione;
		this.macroCategoria = macroCategoria;
		this.numVendite = numVendite;
		this.iva = iva;
		this.visible = visible;
		this.categoria = categoria;
	}

	public long getSeriale() {
		return seriale;
	}
	
	public void setSeriale(long seriale) {
		this.seriale = seriale;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
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
	
	public String getMacroCategoria() {
		return macroCategoria;
	}
	
	public int getNumVendite() {
		return numVendite;
	}

	public void setNumVendite(int numVendite) {
		this.numVendite = numVendite;
	}

	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	@Override
	public String toString() {
		return "Articolo [nome=" + nome + ", seriale=" + seriale + ", prezzo=" + prezzo + ", quantità=" + quantità
				+ ", descrizione=" + descrizione + ", macroCategoria=" + macroCategoria + "]";
	}
}
