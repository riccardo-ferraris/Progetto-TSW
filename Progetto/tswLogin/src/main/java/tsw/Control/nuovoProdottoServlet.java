package tsw.Control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import Model.Articolo;
import Model.ArticoloModel;
import Model.FumettiBean;
import Model.FumettiModel;
import Model.GraficheBean;
import Model.GraficheModel;
import Model.ModelliniBean;
import Model.ModelliniModel;

/**
 * Servlet implementation class nuovoProdottoServlet
 */
@WebServlet("/nuovoProdottoServlet")
@MultipartConfig
public class nuovoProdottoServlet extends HttpServlet {
	private static final String SAVE_DIR = "gallery/";
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nuovoProdottoServlet() {
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
		String categoria = request.getParameter("categoria");
		Articolo articolo = null;
		ArticoloModel model = null;
		
		switch(categoria) {
		case "fumetti":
			model = new FumettiModel();
			articolo = new FumettiBean(request.getParameter("nome"), request.getParameter("scrittore"),
					Integer.parseInt(request.getParameter("numPagine")), 
					request.getParameter("disegnatore"), request.getParameter("sottoCategoria"),
					Long.parseLong(request.getParameter("seriale")), Double.parseDouble(request.getParameter("prezzo")),
					Integer.parseInt(request.getParameter("quantità")), request.getParameter("descrizione"), "Fumetti", 0);	
			
			try {
				((FumettiModel)model).databaseInsert(((FumettiBean)articolo));
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			break;
			
		case "grafica":
			model = new GraficheModel();
			articolo = new GraficheBean(request.getParameter("nome"), Long.parseLong(request.getParameter("seriale")),
				Double.parseDouble(request.getParameter("prezzo")), Integer.parseInt(request.getParameter("quantità")),
				request.getParameter("descrizione"), request.getParameter("sottoCategoria"), "Grafiche", 0);
			try {
				((GraficheModel)model).databaseInsert(((GraficheBean)articolo));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			
		break;
		
		case "modellino": 
			model = new ModelliniModel();
			articolo = new ModelliniBean(Long.parseLong(request.getParameter("seriale")), request.getParameter("nome"),
					Double.parseDouble(request.getParameter("prezzo")), Integer.parseInt(request.getParameter("quantità")),
					request.getParameter("descrizione"), request.getParameter("sottoCategoria"), request.getParameter("franchise"),
					Double.parseDouble(request.getParameter("dimensioni")), "Modellini", 0);
				try {
					((ModelliniModel)model).databaseInsert(((ModelliniBean)articolo));
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		break;
	     
		
		default: System.out.println("Errore!");
		break;
		}
		//System.out.println(articolo.getMacroCategoria());
		saveFile(request.getPart("imgProdotto"), request.getServletContext().getRealPath(""), articolo.getMacroCategoria(), articolo.getNome());
		response.sendRedirect("CatalogoAdmin.jsp");
       

	}
	
	
	private void saveFile(Part filePart, String appPath, String folder, String titolo) throws IOException
	{
	    final String fileName = titolo + ".jpg";

		String savePath = appPath + SAVE_DIR + folder;
		System.out.println(savePath);
	    OutputStream out = null;
	    InputStream filecontent = null;

	    try 
	    {
	        out = new FileOutputStream(new File(savePath + File.separator + fileName));
	        filecontent = filePart.getInputStream();

	        int read = 0;
	        final byte[] bytes = new byte[1024];

	        while ((read = filecontent.read(bytes)) != -1) 
	        {
	            out.write(bytes, 0, read);
	        }	      
	    } 
	    catch (Exception e) 
	    {
	    	System.out.println("Error:" + e.getMessage());
	    } 
	    finally 
	    {
	        if (out != null)
	        {
	            out.close();
	        }
	        if (filecontent != null) 
	        {
	            filecontent.close();
	        }
	    }
	}
	
	
}
