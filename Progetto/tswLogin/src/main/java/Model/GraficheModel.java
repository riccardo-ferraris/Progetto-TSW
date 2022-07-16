package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Util.DriverManagerConnectionPool;


public class GraficheModel extends ArticoloModel{
	private static final String TABLE_NAME = "grafica";
	
	@Override
	public synchronized GraficheBean doRetrieveByKey(long seriale) throws SQLException, ClassNotFoundException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select * from grafica where seriale = ?;";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setLong(1, seriale);

			rs = preparedStatement.executeQuery();

			if (rs.next()) {
				GraficheBean bean = new GraficheBean();
				bean.setSeriale(rs.getLong("seriale"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
				
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
	public synchronized Collection<GraficheBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<GraficheBean> products = new LinkedList<GraficheBean>();

		String selectSQL = "SELECT * FROM " + GraficheModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				GraficheBean bean = new GraficheBean();

				bean.setSeriale(rs.getLong("seriale"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
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
	
	public synchronized Collection<GraficheBean> doRetrieveAllModerna(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<GraficheBean> products = new LinkedList<GraficheBean>();

		String selectSQL = "SELECT * FROM " + GraficheModel.TABLE_NAME + " WHERE categoria = 'Moderna'";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				GraficheBean bean = new GraficheBean();

				bean.setSeriale(rs.getLong("seriale"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
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
	
	public synchronized Collection<GraficheBean> doRetrieveAllOpera(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<GraficheBean> products = new LinkedList<GraficheBean>();

		String selectSQL = "SELECT * FROM " + GraficheModel.TABLE_NAME + " WHERE categoria = 'Opera'";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				GraficheBean bean = new GraficheBean();

				bean.setSeriale(rs.getLong("seriale"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
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
	
	public int databaseInsert(GraficheBean grafica) throws SQLException{
		int result = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "insert into " + GraficheModel.TABLE_NAME + " (seriale, titolo, prezzo, quantità"
					+ ", descrizione, categoria)"
					+ " values(?, ?, ?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setLong(1, grafica.getSeriale());
			preparedStatement.setString(2, grafica.getNome());
			preparedStatement.setDouble(3, grafica.getPrezzo());
			preparedStatement.setInt(4, grafica.getQuantità());
			preparedStatement.setString(5, grafica.getDescrizione());
			preparedStatement.setString(6, grafica.getCategoria());
			preparedStatement.setDouble(7, grafica.getIva());
			
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
	
	@Override
	public synchronized Collection<GraficheBean> doRetrieveAllByKeyWord(String order, String keyWord) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<GraficheBean> products = new LinkedList<GraficheBean>();
		ResultSet rs = null;
		
		String selectSQL = "SELECT * FROM " + GraficheModel.TABLE_NAME + " WHERE titolo LIKE ? UNION"
				+ " SELECT * FROM " + GraficheModel.TABLE_NAME + " WHERE descrizione LIKE ? UNION"
				+ " SELECT * FROM " + GraficheModel.TABLE_NAME + " WHERE categoria LIKE ?;";
		
		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			
			preparedStatement = connection.prepareStatement(selectSQL);

			preparedStatement.setString(1, "%" + keyWord + "%");
			preparedStatement.setString(2, "%" + keyWord + "%");
			preparedStatement.setString(3, "%" + keyWord + "%");

			rs = preparedStatement.executeQuery();

			while (rs.next()) {
				GraficheBean bean = new GraficheBean();

				bean.setSeriale(rs.getLong("seriale"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setNumVendite(rs.getInt("numVendite"));
				bean.setIva(rs.getDouble("iva"));
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
	
}
