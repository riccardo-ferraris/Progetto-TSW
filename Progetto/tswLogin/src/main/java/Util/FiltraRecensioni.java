package Util;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import org.json.HTTP;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import Model.RecensioneBean;
import Model.RecensioneModel;

/**
 * Servlet implementation class FiltraRecensioni
 */
@WebServlet(value = "/FiltraRecensioni")
public class FiltraRecensioni extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FiltraRecensioni() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//System.out.println("-"+request.getParameter("punteggioSelected")+"-"+request.getParameter("serialeProdotto")+"-"+request.getParameter("categoriaProdotto")+"-" );
		JSONObject obj = new JSONObject();
		StringBuffer jb = new StringBuffer();
        String line = null;
        try {
          BufferedReader reader = request.getReader();
          while ((line = reader.readLine()) != null)
            jb.append(line);
        } catch (Exception e) { e.printStackTrace(); }
        
        try {
			obj = new JSONObject(jb.toString());
		} catch (JSONException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
        int punti = 0;
		long seriale = 0;
		String categoria = new String();
		
        try {
			punti = obj.getInt("punteggio");
			seriale = obj.getLong("seriale");
			categoria = obj.getString("categoria");
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        RecensioneModel model = new RecensioneModel();
		ArrayList<RecensioneBean> filteredRecensioni = null;
		
		try {
			if(punti != 9) {
				filteredRecensioni = new ArrayList<RecensioneBean>(model.doRetrieveBySerialeAndPunteggio(seriale, punti, categoria));
			}else {
				filteredRecensioni = new ArrayList<RecensioneBean>(model.doRetrieveAllBySeriale(seriale, categoria));
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		new Gson().toJson(filteredRecensioni, response.getWriter());
		return;
	}

}
