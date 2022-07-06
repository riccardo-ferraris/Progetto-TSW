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
		Collection<RecensioneBean> recensioniUser = new LinkedList<RecensioneBean>(doRetrieveAllByUsername(username));
		Collection<RecensioneBean> recensioniProdotto = new LinkedList<RecensioneBean>(doRetrieveAllBySeriale(seriale, categoria));
		
		for(RecensioneBean tempRec : recensioniUser) {	
			//System.out.println(tempRec.toString());
			if(recensioniProdotto.contains(tempRec)) {
				recensione = tempRec;
				
			}
		}
		
		return recensione;
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
}
