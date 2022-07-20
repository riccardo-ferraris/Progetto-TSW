package Util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.ArticoloModel;
import Model.FumettiModel;
import Model.GraficheModel;
import Model.ModelliniModel;


/**
 * Servlet implementation class ModificaProdotto
 */
@WebServlet("/ModificaProdotto")
@MultipartConfig
public class ModificaProdotto extends HttpServlet {
	private static final String SAVE_DIR = "gallery/";
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaProdotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String nomeProdotto = request.getParameter("nomeProdotto").trim();
		String sottoCatProdotto = request.getParameter("sottoCatProdotto").trim();
		double prezzoProdotto = Double.parseDouble(request.getParameter("prezzoProdotto").replace(",", ".").trim());
		String descrizioneProdotto = request.getParameter("descrizioneProdotto").trim();
		
		long seriale = Long.parseLong(request.getParameter("seriale"));
		String categoria = request.getParameter("categoria");
		ArticoloModel model;
		String tempCategoria = new String();
		
		switch(categoria) {
		case "Fumetti":
			model = new FumettiModel();
			tempCategoria = "fumetti";
			
			try {
				model.updateProdotto(nomeProdotto, sottoCatProdotto, prezzoProdotto, descrizioneProdotto, tempCategoria, seriale);
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("True");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.getWriter().write("Error");
				e.printStackTrace();		
			}
			
			break;
			
		case "Grafiche":
			model = new GraficheModel();
			tempCategoria = "grafica";
			
			try {
				model.updateProdotto(nomeProdotto, sottoCatProdotto, prezzoProdotto, descrizioneProdotto, tempCategoria, seriale);
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("True");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.getWriter().write("Error");
				e.printStackTrace();
				
			}
			
			break;
			
		case "Modellini":
			model = new ModelliniModel();
			tempCategoria = "modellino";
			
			try {
				model.updateProdotto(nomeProdotto, sottoCatProdotto, prezzoProdotto, descrizioneProdotto, tempCategoria, seriale);
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("True");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				response.getWriter().write("Error");
				e.printStackTrace();
				
			}
			
			break;
		}
		Part part = request.getPart("img");
		
        if(part.getSize() > 0){
			saveFile(request.getPart("img"), request.getServletContext().getRealPath(""), categoria, nomeProdotto);
        }    
		
		return;
	}
	
	private void saveFile(Part filePart, String appPath, String folder, String titolo) throws IOException{
	    final String fileName = titolo + ".jpg";

		String savePath = appPath + SAVE_DIR + folder;
	    OutputStream out = null;
	    InputStream filecontent = null;

	    try{
	        out = new FileOutputStream(new File(savePath + File.separator + fileName));
	        filecontent = filePart.getInputStream();

	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1){
	            out.write(bytes, 0, read);
	        }	      
	    } 
	    catch (Exception e){
	    	System.out.println("Error:" + e.getMessage());
	    	return;
	    } 
	    
	    finally{
	        if (out != null){
	            out.close();
	        }
	        
	        if (filecontent != null){
	            filecontent.close();
	        }
	    }
	    
	    return;
	}
}
