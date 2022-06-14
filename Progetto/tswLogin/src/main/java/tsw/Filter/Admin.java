package tsw.Filter;

import java.io.IOException;
import java.nio.file.DirectoryStream.Filter;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Admin
 */
@WebServlet("/Admin")
public class Admin implements Filter {
	FilterConfig filterConfig;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void destroy() {
    	
    }
    
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
    	String ruolo=(String) ((HttpServletRequest) request).getSession().getAttribute("ruolo");
    	
    	if(ruolo==null) {
    		ruolo="guest";
    		((HttpServletRequest) request).getSession().setAttribute("ruolo", ruolo);
    	}
    	
    	if(!ruolo.trim().equals("admin")) {
    		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
    		request.setAttribute("nonAutorizzato", true);
    		dispatcher.forward(request, response);
    		return;
    	}
    }
    
    public void init(FilterConfig fConfig) throws ServletException {
    	
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@Override
	public boolean accept(Object entry) throws IOException {
		// TODO Auto-generated method stub
		return false;
	}

}
