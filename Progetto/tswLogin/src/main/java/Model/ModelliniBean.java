package Model;

public class ModelliniBean extends Articolo{
	private String franchise;
	private double dimensioni;	
	
	public ModelliniBean() {
		this.macroCategoria = "Modellini";
	}
	

	public ModelliniBean(long seriale, String nome, double prezzo, int quantit�, String descrizione,
			 String franchise, double dimensioni, String macroCategoria, int numVendite, double iva, boolean visible, String categoria) {
		super(nome, seriale, prezzo, quantit�, descrizione, macroCategoria, numVendite, iva, visible, categoria);
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

	public int getQuantit�() {
		return quantit�;
	}

	public void setQuantit�(int quantit�) {
		this.quantit� = quantit�;
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
				+ ", nome=" + nome + ", seriale=" + seriale + ", prezzo=" + prezzo + ", quantit�=" + quantit�
				+ ", descrizione=" + descrizione + "]";
	}	
}


