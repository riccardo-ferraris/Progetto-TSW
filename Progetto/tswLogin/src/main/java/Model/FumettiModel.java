package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Util.DriverManagerConnectionPool;


public class FumettiModel extends ArticoloModel{
	private static final String TABLE_NAME = "fumetti";
	
	@Override
	public synchronized FumettiBean doRetrieveByKey(long seriale) throws SQLException, ClassNotFoundException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select * from fumetti where seriale = ?;";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setLong(1, seriale);

			rs = preparedStatement.executeQuery();

			if (rs.next()) {
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
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
				bean.setVisible(rs.getBoolean("visible"));
				
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
	
	@Override
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
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
				bean.setVisible(rs.getBoolean("visible"));
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
	
	public synchronized Collection<FumettiBean> doRetrieveAllManga(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<FumettiBean> products = new LinkedList<FumettiBean>();

		String selectSQL = "SELECT * FROM " + FumettiModel.TABLE_NAME + " WHERE categoria = 'Manga'";

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
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
				bean.setVisible(rs.getBoolean("visible"));
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
	
	public synchronized Collection<FumettiBean> doRetrieveAllManhua(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<FumettiBean> products = new LinkedList<FumettiBean>();

		String selectSQL = "SELECT * FROM " + FumettiModel.TABLE_NAME + " WHERE categoria = 'Manhwa'";

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
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
				bean.setVisible(rs.getBoolean("visible"));
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
	
	public int databaseInsert(FumettiBean fumetto) throws SQLException{
		int result = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "insert into " + FumettiModel.TABLE_NAME + " (seriale, titolo, prezzo, quantità"
					+ ", descrizione, scrittore, numPagine, disegnatore, categoria)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setLong(1, fumetto.getSeriale());
			preparedStatement.setString(2, fumetto.getNome());
			preparedStatement.setDouble(3, fumetto.getPrezzo());
			preparedStatement.setInt(4, fumetto.getQuantità());
			preparedStatement.setString(5, fumetto.getDescrizione());
			preparedStatement.setString(6, fumetto.getScrittore());
			preparedStatement.setInt(7, fumetto.getNumPagine());
			preparedStatement.setString(8, fumetto.getDisegnatore());
			preparedStatement.setString(9, fumetto.getCategoria());
			preparedStatement.setDouble(10, fumetto.getIva());
			preparedStatement.setBoolean(11, fumetto.isVisible());
			
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
	
	@Override
	public synchronized Collection<FumettiBean> doRetrieveAllByKeyWord(String order, String keyWord) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<FumettiBean> products = new LinkedList<FumettiBean>();
		ResultSet rs = null;
		
		String selectSQL = "SELECT * FROM " + FumettiModel.TABLE_NAME + " WHERE titolo LIKE ? UNION"
				+ " SELECT * FROM " + FumettiModel.TABLE_NAME + " WHERE descrizione LIKE ? UNION"
				+ " SELECT * FROM " + FumettiModel.TABLE_NAME + " WHERE scrittore LIKE ? UNION"
				+ " SELECT * FROM " + FumettiModel.TABLE_NAME + " WHERE disegnatore LIKE ? UNION"
				+ " SELECT * FROM " + FumettiModel.TABLE_NAME + " WHERE categoria LIKE ?;";
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			
			preparedStatement = connection.prepareStatement(selectSQL);

			preparedStatement.setString(1, "%" + keyWord + "%");
			preparedStatement.setString(2, "%" + keyWord + "%");
			preparedStatement.setString(3, "%" + keyWord + "%");
			preparedStatement.setString(4, "%" + keyWord + "%");
			preparedStatement.setString(5, "%" + keyWord + "%");

			rs = preparedStatement.executeQuery();

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
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
				bean.setVisible(rs.getBoolean("visible"));
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
	
	@Override
	public synchronized void updateProdotto(String nomeProdotto, String sottoCatProdotto, double prezzoProdotto, String descrizioneProdotto, String categoria, long seriale) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 9999;
		try {			
			connection = DriverManagerConnectionPool.getConnection();
			
			String sql = "update `perspectiveart`.`" + categoria +"` set `titolo` = ?, `prezzo` = ?, `descrizione` = ?, `categoria` = ? where (`seriale` = ?);";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, nomeProdotto);
			preparedStatement.setDouble(2, prezzoProdotto);
			preparedStatement.setString(3, descrizioneProdotto);
			preparedStatement.setString(4, sottoCatProdotto);
			preparedStatement.setLong(5, seriale);

			result = preparedStatement.executeUpdate();
			
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}
		
		return;
	}
	
	@Override
	public synchronized void toggleVisibility(long seriale, boolean value) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int result = 9999;
		try {			
			connection = DriverManagerConnectionPool.getConnection();
			
			String sql = "update `perspectiveart`.`fumetti` set `visible` = ? where (`seriale` = ?);";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setBoolean(1, value);
			preparedStatement.setLong(2, seriale);

			result = preparedStatement.executeUpdate();
			
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}
		
		return;
	}
	
}


