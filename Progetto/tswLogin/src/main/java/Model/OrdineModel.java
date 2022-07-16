package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import Util.DriverManagerConnectionPool;

public class OrdineModel {
	
	public synchronized Ordine doRetrieveAllByKey(String codice) throws SQLException, ClassNotFoundException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();
			String sql = "select * from ordine where codice = ?;";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, codice);
			rs = preparedStatement.executeQuery();

			if (rs.next()) {
				Ordine bean = new Ordine();
				bean.setCodice(rs.getString("codice"));
				bean.setUtente(rs.getString("utente"));
				bean.setTotale(rs.getDouble("totale"));
				bean.setData(rs.getDate("data"));
				
				sql = "select * from prodottiordine where codiceordine = ?;";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, codice);
				rs = preparedStatement.executeQuery();
					
				ResultSetMetaData rsmd = rs.getMetaData();
				String cat = new String();
				
				ArrayList<ProdottoInCarrello> arrayProdotti = new ArrayList<ProdottoInCarrello>();
				ArticoloModel model;
				Articolo articolo;
				
				//if (rs.next()) {
					while(rs.next()) {
						for(int i = 3; i <= 5; i++) {
							if(rs.getString(i) != null) {
								
								cat = rsmd.getColumnName(i).replace("seriale", "");
								switch (cat) {
								case "Fumetti": 
									model = new FumettiModel();
									articolo = new FumettiBean();
									articolo = model.doRetrieveByKey(Long.parseLong(rs.getString(i)));
									break;
								case "Grafiche":
									model = new GraficheModel();
									articolo = new GraficheBean();
									articolo = model.doRetrieveByKey(Long.parseLong(rs.getString(i)));
									break;
								case "Modellini":
									model = new ModelliniModel();
									articolo = new ModelliniBean();
									articolo = model.doRetrieveByKey(Long.parseLong(rs.getString(i)));
									break;
									
								default:
									throw new IllegalArgumentException("Unexpected value: " );
								}
								
								ProdottoInCarrello prodCarrello = new ProdottoInCarrello(articolo, rs.getInt("quantità"), rs.getDouble("prezzo"), rs.getDouble("iva"));
								
								arrayProdotti.add(prodCarrello);
							}
						}
					}
					bean.setArticoliOrdine(arrayProdotti);
					
					sql = "select * from indirizzospedizione where ordine = ?;";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, codice);
					rs = preparedStatement.executeQuery();

					if (rs.next()) {
						bean.setIndirizzoS(rs.getString("indirizzo"));
						bean.setStatoS(rs.getString("stato"));
						bean.setCityS(rs.getString("città"));
						bean.setCapS(rs.getLong("CAP"));
						bean.setNomeS(rs.getString("nome"));
						bean.setCognomeS(rs.getString("cognome"));
						
						rs = preparedStatement.executeQuery();	
					}
					
					sql = "select * from indirizzofatturazione where ordine = ?;";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, codice);
					rs = preparedStatement.executeQuery();

					if (rs.next()) {
						bean.setIndirizzoF(rs.getString("indirizzo"));
						bean.setStatoF(rs.getString("stato"));
						bean.setCityF(rs.getString("città"));
						bean.setCapF(rs.getLong("CAP"));
						bean.setNomeF(rs.getString("nome"));
						bean.setCognomeF(rs.getString("cognome"));
						
						rs = preparedStatement.executeQuery();	
					}
					
				//}else {
				//	bean = null;
				//}
				return bean;
			}else
				return null;
			
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}
	}
	
	public synchronized ArrayList<Ordine> doRetrieveAllByUsername(String username) throws SQLException, ClassNotFoundException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		ArrayList<Ordine> arrayOrdini = new ArrayList<Ordine>();
		
		try {			
			connection = DriverManagerConnectionPool.getConnection();
			String sql = "select * from ordine where utente = ?;";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			rs = preparedStatement.executeQuery();
			while(rs.next()) {
				//System.out.println(rs.getString("codice"));
				Ordine bean = new Ordine();
				ArrayList<ProdottoInCarrello> arrayProdotti = new ArrayList<ProdottoInCarrello>();
				bean.setCodice(rs.getString("codice"));
				bean.setUtente(rs.getString("utente"));
				bean.setTotale(rs.getDouble("totale"));
				bean.setData(rs.getDate("data"));	
				
				sql = "select * from prodottiordine where codiceordine = ?;";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, bean.getCodice());
				ResultSet rsTemp = preparedStatement.executeQuery();
					
				ResultSetMetaData rsmd = rsTemp.getMetaData();
				String cat = new String();
				
				
				ArticoloModel model;
				Articolo articolo = null;
				
				while(rsTemp.next()) {
					for(int i = 3; i <= 5; i++) {
						if(rsTemp.getString(i) != null) {
							
							cat = rsmd.getColumnName(i).replace("seriale", "");
							switch (cat) {
							case "Fumetti": 
								model = new FumettiModel();
								articolo = new FumettiBean();
								articolo = model.doRetrieveByKey(Long.parseLong(rsTemp.getString(i)));
								break;
							case "Grafiche":
								model = new GraficheModel();
								articolo = new GraficheBean();
								articolo = model.doRetrieveByKey(Long.parseLong(rsTemp.getString(i)));
								break;
							case "Modellini":
								model = new ModelliniModel();
								articolo = new ModelliniBean();
								articolo = model.doRetrieveByKey(Long.parseLong(rsTemp.getString(i)));
								break;
								
							default:
								throw new IllegalArgumentException("Unexpected value: " );
							}	
						}
					}
					ProdottoInCarrello prodCarrello = new ProdottoInCarrello(articolo, rsTemp.getInt("quantità"), rsTemp.getDouble("prezzo"), rsTemp.getDouble("iva"));
					arrayProdotti.add(prodCarrello);
				}
				
				bean.setArticoliOrdine(arrayProdotti);
				
				sql = "select * from indirizzospedizione where ordine = ?;";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, bean.getCodice());
				rsTemp = preparedStatement.executeQuery();

				if (rsTemp.next()) {
					bean.setIndirizzoS(rsTemp.getString("indirizzo"));
					bean.setStatoS(rsTemp.getString("stato"));
					bean.setCityS(rsTemp.getString("città"));
					bean.setCapS(rsTemp.getLong("CAP"));
					bean.setNomeS(rsTemp.getString("nome"));
					bean.setCognomeS(rsTemp.getString("cognome"));
					
					rsTemp = preparedStatement.executeQuery();	
				}
				
				sql = "select * from indirizzofatturazione where ordine = ?;";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, bean.getCodice());
				rsTemp = preparedStatement.executeQuery();

				if (rsTemp.next()) {
					bean.setIndirizzoF(rsTemp.getString("indirizzo"));
					bean.setStatoF(rsTemp.getString("stato"));
					bean.setCityF(rsTemp.getString("città"));
					bean.setCapF(rsTemp.getLong("CAP"));
					bean.setNomeF(rsTemp.getString("nome"));
					bean.setCognomeF(rsTemp.getString("cognome"));
					
					rsTemp = preparedStatement.executeQuery();	
				}
					
				arrayOrdini.add(bean);
			}
			
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}

		return arrayOrdini;
	}
	
	public synchronized Collection<Ordine> doRetrieveAll(String order) throws SQLException, NumberFormatException, ClassNotFoundException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Ordine> arrayOrdini = new LinkedList<Ordine>();

		String sql = "SELECT * FROM ordine";

		if (order != null && !order.equals("")) {
			sql += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(sql);

			ResultSet rs = preparedStatement.executeQuery();
			ResultSet rsTemp;
			ResultSetMetaData rsmd = rs.getMetaData();		

			while(rs.next()) {
				//System.out.println(rs.getString("codice"));
				Ordine bean = new Ordine();
				ArrayList<ProdottoInCarrello> arrayProdotti = new ArrayList<ProdottoInCarrello>();
				bean.setCodice(rs.getString("codice"));
				bean.setUtente(rs.getString("utente"));
				bean.setTotale(rs.getDouble("totale"));
				bean.setData(rs.getDate("data"));	
				
				sql = "select * from prodottiordine where codiceordine = ?;";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, bean.getCodice());
				rsTemp = preparedStatement.executeQuery();
					
				rsmd = rsTemp.getMetaData();
				String cat = new String();
				
				
				ArticoloModel model;
				Articolo articolo = null;
				
				while(rsTemp.next()) {
					for(int i = 3; i <= 5; i++) {
						if(rsTemp.getString(i) != null) {
							
							cat = rsmd.getColumnName(i).replace("seriale", "");
							switch (cat) {
							case "Fumetti": 
								model = new FumettiModel();
								articolo = new FumettiBean();
								articolo = model.doRetrieveByKey(Long.parseLong(rsTemp.getString(i)));
								break;
							case "Grafiche":
								model = new GraficheModel();
								articolo = new GraficheBean();
								articolo = model.doRetrieveByKey(Long.parseLong(rsTemp.getString(i)));
								break;
							case "Modellini":
								model = new ModelliniModel();
								articolo = new ModelliniBean();
								articolo = model.doRetrieveByKey(Long.parseLong(rsTemp.getString(i)));
								break;
								
							default:
								throw new IllegalArgumentException("Unexpected value: " );
							}	
						}
					}
					ProdottoInCarrello prodCarrello = new ProdottoInCarrello(articolo, rsTemp.getInt("quantità"), rsTemp.getDouble("prezzo"), rsTemp.getDouble("iva"));
					arrayProdotti.add(prodCarrello);
				}
				
				bean.setArticoliOrdine(arrayProdotti);
				
				sql = "select * from indirizzospedizione where ordine = ?;";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, bean.getCodice());
				rsTemp = preparedStatement.executeQuery();

				if (rsTemp.next()) {
					bean.setIndirizzoS(rsTemp.getString("indirizzo"));
					bean.setStatoS(rsTemp.getString("stato"));
					bean.setCityS(rsTemp.getString("città"));
					bean.setCapS(rsTemp.getLong("CAP"));
					bean.setNomeS(rsTemp.getString("nome"));
					bean.setCognomeS(rsTemp.getString("cognome"));
					
					rsTemp = preparedStatement.executeQuery();	
				}
				
				sql = "select * from indirizzofatturazione where ordine = ?;";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1, bean.getCodice());
				rsTemp = preparedStatement.executeQuery();

				if (rsTemp.next()) {
					bean.setIndirizzoF(rsTemp.getString("indirizzo"));
					bean.setStatoF(rsTemp.getString("stato"));
					bean.setCityF(rsTemp.getString("città"));
					bean.setCapF(rsTemp.getLong("CAP"));
					bean.setNomeF(rsTemp.getString("nome"));
					bean.setCognomeF(rsTemp.getString("cognome"));
					
					rsTemp = preparedStatement.executeQuery();	
				}
					
				arrayOrdini.add(bean);
			}
			
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}

		return arrayOrdini;
	}
	
	/**
	 * Inserisce un ordine passato come parametro nel database, genera un codice, incrementando il massimo già presente nel db tramite generateCode(), ed inserisce le informazioni generali.
	 * La seconda query inserisce i prodotti dell'ordine in prodottiordine, legando ogni row del database al codice del rispettivo ordine.
	 * @param ordine
	 * @return
	 * @throws SQLException
	 */
	public int databaseInsert(Ordine ordine) throws SQLException{
		int result = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "insert into ordine (codice, utente, totale, data)"
					+ " values(?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(sql);
			String codice = this.generateCode();
			ordine.setCodice(codice);
			
			preparedStatement.setString(1, ordine.getCodice());
			preparedStatement.setString(2, ordine.getUtente());
			preparedStatement.setDouble(3, ordine.getTotale());
			preparedStatement.setDate(4, ordine.getData());
			result = preparedStatement.executeUpdate();
			
			ArrayList<ProdottoInCarrello> prodottiOrdine = ordine.getArticoliOrdine();
			String catProd = new String();
			for (ProdottoInCarrello prod : prodottiOrdine) {
				catProd = prod.getProdotto().getMacroCategoria();
				sql = "insert into prodottiordine (codiceordine, seriale" + catProd + ", quantità, prezzo, iva) values(?, ?, ?, ?, ?);";
				preparedStatement = connection.prepareStatement(sql);
				
				preparedStatement.setString(1, codice);
				preparedStatement.setLong(2, prod.getProdotto().getSeriale());
				preparedStatement.setInt(3, prod.getQuantity());
				preparedStatement.setDouble(4, prod.getPrezzo());
				preparedStatement.setDouble(5, prod.getIva());
				
				result = preparedStatement.executeUpdate();
			}
				
			sql = "insert into indirizzospedizione (ordine, utente, indirizzo, stato, città, CAP, nome, cognome)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?);";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, ordine.getCodice());
			preparedStatement.setString(2, ordine.getUtente());
			preparedStatement.setString(3, ordine.getIndirizzoS());
			preparedStatement.setString(4, ordine.getStatoS());
			preparedStatement.setString(5, ordine.getCityS());
			preparedStatement.setLong(6, ordine.getCapS());
			preparedStatement.setString(7, ordine.getNomeS());
			preparedStatement.setString(8, ordine.getCognomeS());
			result = preparedStatement.executeUpdate();
			
			sql = "insert into indirizzofatturazione (ordine, utente, indirizzo, stato, città, CAP, nome, cognome)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?);";
			
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, ordine.getCodice());
			preparedStatement.setString(2, ordine.getUtente());
			preparedStatement.setString(3, ordine.getIndirizzoF());
			preparedStatement.setString(4, ordine.getStatoF());
			preparedStatement.setString(5, ordine.getCityF());
			preparedStatement.setLong(6, ordine.getCapF());
			preparedStatement.setString(7, ordine.getNomeF());
			preparedStatement.setString(8, ordine.getCognomeF());
			result = preparedStatement.executeUpdate();
			
				return result;
			
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
				
			} finally {
				connection.close();
				
			}	
		}
	}
	
	/**
	 * Gestisce la connessione al database per generare un codice da assegnare ad un nuovo ordine, il range utilizzato è AA00000000-ZZ99999999. L'incremento è gestito da increment();
	 * @return
	 */
	private String generateCode() {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		String codice = new String();
		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select max(codice) codice from ordine;";

			preparedStatement = connection.prepareStatement(sql);

			rs = preparedStatement.executeQuery();

			if (rs.next()) {
				codice = increment(rs.getString("codice"));
				System.out.println(codice);
			} else
				codice = "AA00000000";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return codice;
	}
	
	/**
	 *  Incrementa il codice massimo che riceve come parametro. Quando la sequenza delle ultime 8 cifre raggiunge 99999999, incrementa le lettere. Restituisce il codice incrementato 
	 * @param number
	 * @return
	 */
	public static String increment(String number) {
	    char[] string = number.toUpperCase().toCharArray();
	    for (int i = string.length - 1; i >= 0; i--) {
	        if (string[i] == 'Z') {
	        	string[i] = 'A';
	        } else if (string[i] == '9') {
	        	string[i] = '0';
	        } else {
	        	string[i]++;
	            break;
	        }
	    }
	    return String.valueOf(string);
	}
}
