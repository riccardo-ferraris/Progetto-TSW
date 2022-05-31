package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

import Util.DriverManagerConnectionPool;

public class OrdineModel {
	
	public synchronized Ordine doRetrieveByKey(String codice) throws SQLException, ClassNotFoundException {
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
				//bisogna aggiungere i prodotti nel carrello all'array dell'ordine passandoli come parametri
				
				return bean;
			} else
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
	
	public synchronized Collection<FumettiBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<FumettiBean> products = new LinkedList<FumettiBean>();

		String selectSQL = "SELECT * FROM ordine";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				FumettiBean bean = new FumettiBean();

				bean.setSeriale(rs.getLong("seriale"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantit�(rs.getInt("quantit�"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setScrittore(rs.getString("scrittore"));
				bean.setNumPagine(rs.getInt("numPagine"));
				bean.setDisegnatore(rs.getString("disegnatore"));
				bean.setCategoria(rs.getString("categoria"));
				products.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return products;
	}
	
	/**
	 * Inserisce un ordine passato come parametro nel database, genera un codice, incrementando il massimo gi� presente nel db tramite generateCode(), ed inserisce le informazioni generali.
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
				sql = "insert into prodottiordine (codiceordine, seriale" + catProd + ") values(?, ?);";
				preparedStatement = connection.prepareStatement(sql);
				
				preparedStatement.setString(1, codice);
				System.out.println(codice);
				preparedStatement.setLong(2, prod.getProdotto().getSeriale());
				
				result = preparedStatement.executeUpdate();
			}
			
			
			
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
	 * Gestisce la connessione al database per generare un codice da assegnare ad un nuovo ordine, il range utilizzato � AA00000000-ZZ99999999. L'incremento � gestito da increment();
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