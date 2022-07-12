package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import Util.DriverManagerConnectionPool;

public class RecensioneModel {
	
	public synchronized Collection<RecensioneBean> doRetrieveAllByUsername(String username) throws SQLException, ClassNotFoundException {
		
		Collection<RecensioneBean> recensioni = new LinkedList<RecensioneBean>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select * from recensione where usernameUtente = ?;";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, username);

			rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				RecensioneBean bean = new RecensioneBean();
				bean.setUsername(rs.getString("usernameUtente"));
				bean.setTesto(rs.getString("testo"));
				bean.setPunteggio(rs.getInt("punteggio"));
	
				for(int i = 4; i <= 6; i++) {
					if(rs.getString(i) != null) {	
							bean.setSeriale(rs.getLong(i));		
					}
				}
				
				recensioni.add(bean);				
			}
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}
		
		return recensioni;
	}
	
	public synchronized Collection<RecensioneBean> doRetrieveAllBySeriale(long seriale, String categoria) throws SQLException, ClassNotFoundException {
		
		Collection<RecensioneBean> recensioni = new LinkedList<RecensioneBean>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select * from recensione where seriale" + categoria + " = ?;";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setLong(1, seriale);

			rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				RecensioneBean bean = new RecensioneBean();
				bean.setUsername(rs.getString("usernameUtente"));
				bean.setTesto(rs.getString("testo"));
				bean.setPunteggio(rs.getInt("punteggio"));
	
				for(int i = 4; i <= 6; i++) {
					if(rs.getString(i) != null) {	
							bean.setSeriale(rs.getLong(i));		
					}
				}
				
				recensioni.add(bean);				
			}
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}
		
		return recensioni;
	}
	
	public synchronized RecensioneBean doRetrieveByUsernameAndSeriale(String username, long seriale, String categoria) throws SQLException, ClassNotFoundException{
		RecensioneBean recensione = new RecensioneBean();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select * from recensione where usernameUtente = ? AND seriale" + categoria + " = ?;";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, username);
			preparedStatement.setLong(2, seriale);

			rs = preparedStatement.executeQuery();
			RecensioneBean bean = new RecensioneBean();
			
			while(rs.next()) {
				bean.setUsername(rs.getString("usernameUtente"));
				bean.setTesto(rs.getString("testo"));
				bean.setPunteggio(rs.getInt("punteggio"));
	
				for(int i = 4; i <= 6; i++) {
					if(rs.getString(i) != null) {	
							bean.setSeriale(rs.getLong(i));		
					}
				}				
			}
			
			return bean;
			
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}		
	}

	public synchronized Collection<RecensioneBean> doRetrieveBySerialeAndPunteggio(long seriale, int punteggio, String categoria) throws SQLException, ClassNotFoundException{
		Collection<RecensioneBean> recensioniProdotto = new LinkedList<RecensioneBean>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "select * from recensione where punteggio = ? AND seriale" + categoria + " = ?;";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setInt(1, punteggio);
			preparedStatement.setLong(2, seriale);

			rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				RecensioneBean bean = new RecensioneBean();
				bean.setUsername(rs.getString("usernameUtente"));
				bean.setTesto(rs.getString("testo"));
				bean.setPunteggio(rs.getInt("punteggio"));
	
				for(int i = 4; i <= 6; i++) {
					if(rs.getString(i) != null) {	
							bean.setSeriale(rs.getLong(i));		
					}
				}
				
				recensioniProdotto.add(bean);				
			}
		} finally {
			try {
				if (!connection.isClosed())
					connection.close();
			} finally {
				connection.close();
			}
		}
		
		return recensioniProdotto;
	}
	
	public synchronized int databaseInsert(RecensioneBean recensione, String categoriaProdotto) throws SQLException{
		int result = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "insert into recensione (punteggio, testo, seriale"+ categoriaProdotto +", usernameUtente) values(?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, recensione.getPunteggio());
			preparedStatement.setString(2, recensione.getTesto());
			preparedStatement.setLong(3, recensione.getSeriale());
			preparedStatement.setString(4, recensione.getUsername());
			
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
	
	public synchronized void updateRecensione(RecensioneBean recensione, String categoria) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {			
			connection = DriverManagerConnectionPool.getConnection();

			String sql = "update `perspectiveart`.`recensione` set `testo` = ?, `punteggio` = ? where (`usernameUtente` = ?) AND (seriale" + categoria + " = ?);";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, recensione.getTesto());
			preparedStatement.setInt(2, recensione.getPunteggio());
			preparedStatement.setString(3, recensione.getUsername());
			preparedStatement.setLong(4, recensione.getSeriale());

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
}
