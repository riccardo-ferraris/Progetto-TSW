<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="Model.UserBean" %>
    <%@ page errorPage="ErrorPage.jsp" %> 
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
	List<UserBean> listUtenti = (ArrayList<UserBean>) request.getAttribute("listUtenti");
	
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
	<jsp:include page="header.jsp"/>
	<jsp:include page="navbarLogged.jsp"/>
	
	<table style="border: 3px solid black; border-collapse: collapse; margin:5% auto; width:75%; text-align:center">
	<tr style="border: 3px solid black; border-collapse: collapse;">
  		<th>Username</th>
  		<th>Email</th>
  		<th>Nome</th>
  		<th>Cognome</th>
  		<th>Ruolo</th>
	</tr>
	<%
		for(UserBean user : listUtenti){
	%>

	<tr>
		<td><%=user.getUsername()%></td>
		<td><%=user.getEmail()%></td>
		<td><%=user.getNome()%></td>
		<td><%=user.getCognome()%></td>
		<td><%=user.getRuolo()%></td>
	</tr>
	<%		
		}
	%>
	</table>
	<jsp:include page="footer.jsp"/>
	
	<style>
		table, tr, td{
			border:1px solid black;
			border-collapse: collapse;
		}
	</style>
</body>
</html>