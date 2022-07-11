package Model;

import java.sql.SQLException;

import com.google.gson.Gson;
import com.google.gson.JsonElement;

public class UserBean {
	private String username;
	private String password;
	private String nome;
	private String cognome;
	private String ruolo;
	private String email;
	
	public UserBean() {
	}

	public UserBean(String username, String password, String nome, String cognome, String ruolo, String email) {
		super();
		this.username = username;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.ruolo = ruolo;
		this.email = email;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCognome() {
		return cognome;
	}
	
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	
	public String getRuolo() {
		return ruolo;
	}
	
	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "Utente: Nome=" + nome + "\nCognome=" + cognome;
	}
	
	public JsonElement toJson() throws SQLException{
		String stringUtente = new Gson().toJson(this);
		Gson gson = new Gson();
		
		JsonElement jsonObj = gson.fromJson(stringUtente, JsonElement.class);
		System.out.println(jsonObj.toString());
		jsonObj.getAsJsonObject().remove("password");
		//System.out.println(jsonObj.toString());
		return jsonObj;
	}
	
}
