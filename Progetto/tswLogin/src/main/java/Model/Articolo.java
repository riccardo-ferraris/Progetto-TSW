package Model;

public class Articolo {
	protected String nome;
	protected long seriale;
	protected double prezzo;
	protected int quantità;
	protected String descrizione;
	
	public Articolo() {
	}
	
	public Articolo(String nome, long seriale, double prezzo, int quantità, String descrizione) {
		super();
		this.seriale = seriale;
		this.prezzo = prezzo;
		this.quantità = quantità;
		this.descrizione = descrizione;
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
}
