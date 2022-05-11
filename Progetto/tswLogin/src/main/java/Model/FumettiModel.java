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
				bean.setQuantit�(rs.getInt("quantit�"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setScrittore(rs.getString("scrittore"));
				bean.setNumPagine(rs.getInt("numPagine"));
				bean.setDisegnatore(rs.getString("disegnatore"));
				bean.setCategoria(rs.getString("categoria"));
				
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
	
	public int databaseInsert(FumettiBean fumetto) throws SQLException{
		int result = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "insert into " + FumettiModel.TABLE_NAME + " (seriale, titolo, prezzo, quantit�"
					+ ", descrizione, scrittore, numPagine, disegnatore, categoria)"
					+ " values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setLong(1, fumetto.getSeriale());
			preparedStatement.setString(2, fumetto.getNome());
			preparedStatement.setDouble(3, fumetto.getPrezzo());
			preparedStatement.setInt(4, fumetto.getQuantit�());
			preparedStatement.setString(5, fumetto.getDescrizione());
			preparedStatement.setString(6, fumetto.getScrittore());
			preparedStatement.setInt(7, fumetto.getNumPagine());
			preparedStatement.setString(8, fumetto.getDisegnatore());
			preparedStatement.setString(9, fumetto.getCategoria());
			
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
