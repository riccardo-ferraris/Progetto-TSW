package Model;

public class ModelliniBean extends Articolo{
	private String categoria;
	private String franchise;
	private double dimensioni;	
	
	public ModelliniBean() {
		
	}
	

	public ModelliniBean(long seriale, String nome, double prezzo, int quantità, String descrizione,
			 String categoria, String franchise, double dimensioni) {
		super(nome, seriale, prezzo, quantità, descrizione);
		this.nome = nome;
		this.categoria = categoria;
		this.franchise = franchise;
		this.dimensioni = dimensioni;
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

	public void setNome(String titolo) {
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
	
	public void setFranchise(String franchise) {
		this.franchise = franchise;
	}

	public String getFranchise() {
		return franchise;
	}
	
	public void setDimensioni(double dimensioni) {
		this.dimensioni = dimensioni;
	}

	public double getDimensioni() {
		return dimensioni;
	}
	
	
}


