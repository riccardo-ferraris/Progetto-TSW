package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Util.DriverManagerConnectionPool;

public class OrdineModel {
private static final String TABLE_NAME = "ordine";
	
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

		String selectSQL = "SELECT * FROM " + FumettiModel.TABLE_NAME;

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
				bean.setQuantità(rs.getInt("quantità"));
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
	
	public int databaseInsert(Ordine ordine) throws SQLException{ //sistemare l'insert, l'ordine viene passato come parametro da CheckoutServlet che chiama questo metodo
		int result = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "insert into " + ModelliniModel.TABLE_NAME + " (seriale, nome, prezzo, franchise,"
					+ "descrizione, dimensioni, quantità, categoria)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setLong(1, modellino.getSeriale());
			preparedStatement.setString(2, modellino.getNome());
			preparedStatement.setDouble(3, modellino.getPrezzo());
			preparedStatement.setString(4, modellino.getFranchise());
			preparedStatement.setString(5, modellino.getDescrizione());
			preparedStatement.setDouble(6, modellino.getDimensioni());
			preparedStatement.setInt(7, modellino.getQuantità());
			preparedStatement.setString(8, modellino.getCategoria());
			System.out.println(modellino.getCategoria());
			result = preparedStatement.executeUpdate();
			//System.out.println(fumetto.getCategoria());
			//connection.commit();	
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
}
