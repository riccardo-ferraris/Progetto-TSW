package Model;

public class ProdottoInCarrello {
	private Articolo prodotto;
	private int quantity;
	private double prezzo, iva;
	
	public ProdottoInCarrello(Articolo prodotto, int quantity, double prezzo, double iva) {
		super();
		this.prodotto = prodotto;
		this.quantity = quantity;
		this.prezzo = prezzo;
		this.iva = iva;
	}
	
	public ProdottoInCarrello() {
	}
	
	public Articolo getProdotto() {
		return prodotto;
	}
	
	public void setProdotto(Articolo prodotto) {
		this.prodotto = prodotto;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantità) {
		this.quantity = quantità;
	}
	
	public double getPrezzo() {
		return prezzo;
	}
	
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	
	public double getIva() {
		return iva;
	}

	public void setIva(double iva) {
		this.iva = iva;
	}

	@Override
	public String toString() {
		return "ProdottoInCarrello [prodotto=" + prodotto + ", quantità=" + quantity + "]";
	}
	
	
	
}
