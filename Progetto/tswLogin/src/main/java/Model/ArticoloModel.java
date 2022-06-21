package Model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class ArticoloModel {
	
	public Articolo doRetrieveByKey(long seriale) throws SQLException, ClassNotFoundException{
		Articolo articolo = new Articolo();
		return articolo;
	}
	public Collection<? extends Articolo> doRetrieveAll(String order) throws SQLException{
		Collection<? extends Articolo> coll = new LinkedList<Articolo>();
		return coll;
	}
	
	public Collection<? extends Articolo> doRetrieveAllByKeyWord(String order, String keyWord) throws SQLException{
		Collection<? extends Articolo> coll = new LinkedList<Articolo>();
		return coll;
	}
}
