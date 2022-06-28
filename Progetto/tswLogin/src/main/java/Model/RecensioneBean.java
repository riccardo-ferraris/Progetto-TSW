package Model;

public class RecensioneBean {
	String username, testo;
	long seriale;
	int punteggio;
	
	public RecensioneBean() {
		
	}
	
	public RecensioneBean(String username, String testo, long seriale, int punteggio) {
		super();
		this.username = username;
		this.testo = testo;
		this.seriale = seriale;
		this.punteggio = punteggio;
	}

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTesto() {
		return testo;
	}

	public void setTesto(String testo) {
		this.testo = testo;
	}

	public long getSeriale() {
		return seriale;
	}

	public void setSeriale(long seriale) {
		this.seriale = seriale;
	}

	public int getPunteggio() {
		return punteggio;
	}

	public void setPunteggio(int punteggio) {
		this.punteggio = punteggio;
	}

	@Override
	public String toString() {
		return "RecensioneBean [username=" + username + ", testo=" + testo + ", seriale=" + seriale + ", punteggio="
				+ punteggio + "]";
	}

	@Override
	public boolean equals(Object obj) {
		return ((RecensioneBean)obj).username.equals(username) && ((RecensioneBean)obj).seriale == seriale;
	}
	
	
	
}
