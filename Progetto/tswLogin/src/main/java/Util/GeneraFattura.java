package Util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Ordine;
import Model.OrdineModel;

/**
 * Servlet implementation class GeneraFattura
 */
@WebServlet("/GeneraFattura")
public class GeneraFattura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GeneraFattura() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String codiceOrdine = request.getParameter("codiceOrdine");
		String path = getServletContext().getRealPath("/" + "files" + File.separator);
		OrdineModel model = new OrdineModel();
		Ordine ordine = new Ordine();
		String result = new String();
		try {
			ordine = model.doRetrieveAllByKey(codiceOrdine);
			result = ordine.creaFattura(path);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("Error");
			e.printStackTrace();
		}
		result = result.replace("D:\\EclipseE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\tswLogin\\", "./");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(result);
		
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
