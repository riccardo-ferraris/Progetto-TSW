package Model;

public class ProdottoInCarrello {
	private Articolo prodotto;
	private int quantità;
	
	public ProdottoInCarrello(Articolo prodotto, int quantità) {
		super();
		this.prodotto = prodotto;
		this.quantità = quantità;
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
	@Override
	public String toString() {
		return "ProdottoInCarrello [prodotto=" + prodotto + ", quantità=" + quantità + "]";
	}
	
	
	
}
