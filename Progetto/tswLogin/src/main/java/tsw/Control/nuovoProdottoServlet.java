package tsw.Control;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
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
	private static final String SAVE_DIR = "webapp\\gallery\\";
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
		String folder = new String();
		//String fileName = new String();
		PrintWriter out = response.getWriter();
		
		switch(categoria) {
		case "fumetti":
			model = new FumettiModel();
			articolo = new FumettiBean(request.getParameter("nome"), request.getParameter("scrittore"),
					Integer.parseInt(request.getParameter("numPagine")), 
					request.getParameter("disegnatore"), request.getParameter("sottoCategoria"),
					Long.parseLong(request.getParameter("seriale")), Double.parseDouble(request.getParameter("prezzo")),
					Integer.parseInt(request.getParameter("quantità")), request.getParameter("descrizione"));
			try {
				((FumettiModel)model).databaseInsert(((FumettiBean)articolo));
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("Catalogo.jsp");
			folder = "Fumetti";
			break;
			
		case "grafica": //articoloModel = new GraficheModel();
			model = new GraficheModel();
			articolo = new GraficheBean(request.getParameter("nome"), Long.parseLong(request.getParameter("seriale")),
				Double.parseDouble(request.getParameter("prezzo")), Integer.parseInt(request.getParameter("quantità")),
				request.getParameter("descrizione"), request.getParameter("sottoCategoria"));
			try {
				((GraficheModel)model).databaseInsert(((GraficheBean)articolo));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				response.sendRedirect("Catalogo.jsp");
				folder = "Grafiche";
			
		break;
		
		case "modellino": 
			model = new ModelliniModel();
			articolo = new ModelliniBean(Long.parseLong(request.getParameter("seriale")), request.getParameter("nome"),
					Double.parseDouble(request.getParameter("prezzo")), Integer.parseInt(request.getParameter("quantità")),
					request.getParameter("descrizione"), request.getParameter("sottoCategoria"), request.getParameter("franchise"),
					Double.parseDouble(request.getParameter("dimensioni")));
				response.sendRedirect("Catalogo.jsp");
				folder = "Fumetti";
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
		
		// gets absolute path of the web application
        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + SAVE_DIR + folder;

        Part filePart = request.getPart("imgProdotto"); // Retrieves <input type="file" name="file">
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        InputStream fileContent = filePart.getInputStream();
        
        File uploads = new File(savePath);
        File file = new File(uploads, "prova.jpg");
        try (InputStream input = filePart.getInputStream()) {
        	Files.copy(fileContent, file.toPath());
        }

        System.out.println(savePath);

	}
}
