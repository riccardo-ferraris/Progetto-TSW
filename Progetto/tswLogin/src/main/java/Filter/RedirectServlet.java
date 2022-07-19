package Filter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RedirectServlet
 */
@WebServlet("/RedirectServlet")
public class RedirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RedirectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = request.getParameter("page");
		String ruoloUtente = (String) request.getSession().getAttribute("ruolo");
		//System.out.println(ruoloUtente);
		if(page.trim().equals("catalogo") || page.trim().equals("viewUtenti") ){
			if(ruoloUtente == null || !ruoloUtente.equals("admin") || (ruoloUtente.equals("admin") && page.trim().equals("viewUtenti")) ){
				//System.out.println("flag"); 
				response.sendRedirect("./MostraCatalogo?page=" + page);
				return;
			}else if(ruoloUtente.equals("admin")){
				//System.out.println("err");
				response.sendRedirect("./MostraCatalogo");
				return;
			}
			
			return;
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
