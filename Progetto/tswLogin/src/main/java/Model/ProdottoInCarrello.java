package Model;

public class ProdottoInCarrello {
	private Articolo prodotto;
	private int quantità;
	private double prezzo;
	
	public ProdottoInCarrello(Articolo prodotto, int quantità, double prezzo) {
		super();
		this.prodotto = prodotto;
		this.quantità = quantità;
		this.prezzo = prezzo;
	}
	
	public ProdottoInCarrello() {
	}
	
	public Articolo getProdotto() {
		return prodotto;
	}
	
	public void setProdotto(Articolo prodotto) {
		this.prodotto = prodotto;
	}
	
	public int getQuantità() {
		return quantità;
	}
	
	public void setQuantità(int quantità) {
		this.quantità = quantità;
	}
	
	public double getPrezzo() {
		return prezzo;
	}
	
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	
	@Override
	public String toString() {
		return "ProdottoInCarrello [prodotto=" + prodotto + ", quantità=" + quantità + "]";
	}
	
	
	
}
