package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Util.DriverManagerConnectionPool;


public class ModelliniModel extends ArticoloModel{
	private static final String TABLE_NAME = "modellino";
	
	@Override
	public synchronized ModelliniBean doRetrieveByKey(long seriale) throws SQLException, ClassNotFoundException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select * from modellino where seriale = ?;";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setLong(1, seriale);

			rs = preparedStatement.executeQuery();

			if (rs.next()) {
				ModelliniBean bean = new ModelliniBean();
				bean.setSeriale(rs.getLong("seriale"));
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setFranchise(rs.getString("franchise"));
				bean.setDimensioni(rs.getDouble("dimensioni"));
				
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
	public synchronized Collection<ModelliniBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ModelliniBean> products = new LinkedList<ModelliniBean>();

		String selectSQL = "SELECT * FROM " + ModelliniModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ModelliniBean bean = new ModelliniBean();

				bean.setSeriale(rs.getLong("seriale"));
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setFranchise(rs.getString("franchise"));
				bean.setDimensioni(rs.getDouble("dimensioni"));
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
	
	public synchronized Collection<ModelliniBean> doRetrieveAllFigures(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ModelliniBean> products = new LinkedList<ModelliniBean>();

		String selectSQL = "SELECT * FROM " + ModelliniModel.TABLE_NAME + " WHERE categoria = 'Action Figure'";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ModelliniBean bean = new ModelliniBean();

				bean.setSeriale(rs.getLong("seriale"));
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setFranchise(rs.getString("franchise"));
				bean.setDimensioni(rs.getDouble("dimensioni"));
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
	
	public synchronized Collection<ModelliniBean> doRetrieveAllFunko(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<ModelliniBean> products = new LinkedList<ModelliniBean>();

		String selectSQL = "SELECT * FROM " + ModelliniModel.TABLE_NAME + " WHERE categoria = 'Funko Pop!'";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				ModelliniBean bean = new ModelliniBean();

				bean.setSeriale(rs.getLong("seriale"));
				bean.setNome(rs.getString("nome"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setQuantità(rs.getInt("quantità"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setCategoria(rs.getString("categoria"));
				bean.setFranchise(rs.getString("franchise"));
				bean.setDimensioni(rs.getDouble("dimensioni"));
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
	
	public int databaseInsert(ModelliniBean modellino) throws SQLException{
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
