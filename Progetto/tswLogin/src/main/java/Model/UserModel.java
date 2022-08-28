package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Util.DriverManagerConnectionPool;

public class UserModel {
	public synchronized UserBean doRetrieveByKey(String username) throws SQLException, ClassNotFoundException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();
			String sql = "select * from utente where username = ?;";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			rs = preparedStatement.executeQuery();

			if (rs.next()) {
				UserBean bean = new UserBean();
				bean.setUsername(rs.getString("username"));
				bean.setPassword(rs.getString("password"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setRuolo(rs.getString("ruolo"));
				bean.setEmail(rs.getString("email"));
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
	
	public int databaseInsert(UserBean user) throws SQLException{
		int result = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();
			String sql = "insert into utente (username, password, nome, cognome, ruolo, email) values(?, ?, ?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getNome());
			preparedStatement.setString(4, user.getCognome());
			preparedStatement.setString(5, user.getRuolo());
			preparedStatement.setString(6, user.getEmail());
			
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
	
	//Metodo per la connessione al database per cambiare la password
	public void changePassword(String username, String password) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "update utente set password = ? where username = '" + username+"';";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, password);
			
			preparedStatement.executeUpdate();		
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
				
			} finally {
				connection.close();
				
			}	
		}
	}

	public synchronized Collection<UserBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<UserBean> users = new LinkedList<UserBean>();

		String selectSQL = "SELECT * FROM utente";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				UserBean bean = new UserBean();

				bean.setUsername(rs.getString("username"));
				bean.setEmail(rs.getString("email"));
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setRuolo(rs.getString("ruolo"));
				users.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return users;
	}
}
