<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="Model.UserBean" %>
<!DOCTYPE html>
<html>
<%

	UserBean utente = (UserBean) request.getSession().getAttribute("utente");;
	if(utente == null){
		request.getSession().setAttribute("ruolo", "guest");
		response.sendRedirect("home.jsp");
		return;
	}
	if(!utente.getRuolo().equals("admin"))
	{
		//out.println(utente);
		response.sendRedirect("home.jsp");
		return;
	} 
	
	@SuppressWarnings("unchecked")
	ArrayList<UserBean> listUtenti = (ArrayList<UserBean>) request.getAttribute("listUtenti");
	
	if(listUtenti == null){
		response.sendRedirect("./RetrieveUtenti");
		return;
	}
%>
<head>
<meta charset="ISO-8859-1">
<title>Elenco utenti</title>
</head>
<body>
	
	<%
		for(UserBean user : listUtenti){
	%>
	
		<ul style="list-style-type:none; ">
			<li><p><%=user.getUsername()%></p></li>
			<li><p><%=user.getEmail()%></p></li>
			<li><p><%=user.getNome()%></p></li>
			<li><p><%=user.getCognome()%></p></li>
			<li><p><%=user.getRuolo()%></p></li>
		</ul>
	<%		
		}
	%>
	
</body>
</html>