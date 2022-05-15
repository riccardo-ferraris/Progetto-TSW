package Model;

public class ModelliniBean extends Articolo{
	private String categoria;
	private String franchise;
	private double dimensioni;	
	
	public ModelliniBean() {
		this.macroCategoria = "Modellini";
	}
	

	public ModelliniBean(long seriale, String nome, double prezzo, int quantità, String descrizione,
			 String categoria, String franchise, double dimensioni, String macroCategoria) {
		super(nome, seriale, prezzo, quantità, descrizione, macroCategoria);
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
	
	public String getMacroCategoria() {
		return macroCategoria;
	}


	@Override
	public String toString() {
		return "ModelliniBean [categoria=" + categoria + ", franchise=" + franchise + ", dimensioni=" + dimensioni
				+ ", nome=" + nome + ", seriale=" + seriale + ", prezzo=" + prezzo + ", quantità=" + quantità
				+ ", descrizione=" + descrizione + "]";
	}
	
	
}


