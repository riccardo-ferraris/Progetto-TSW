package tsw.Control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.FumettiBean;
import Model.FumettiModel;

/**
 * Servlet implementation class mostraCatalogo
 */
@WebServlet("/mostraCatalogo")
public class mostraCatalogo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mostraCatalogo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("fumetti/json");
		
		String codSeriale = request.getParameter("seriale");
		long seriale = Long.parseLong(codSeriale);
		try {
			FumettiModel model = new FumettiModel();
			FumettiBean bean = model.doRetrieveByKey(seriale);
			
			if (bean == null) {
				response.sendRedirect("InvalidLogin.jsp");
				return;
			}else {
				response.sendRedirect("Catalogo.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
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
