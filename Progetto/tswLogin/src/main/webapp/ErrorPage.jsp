<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.UserBean" %>
    <%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Errore</title>
</head>
<body>
<jsp:include page="header.jsp"/>
			<% 
			UserBean utente = (UserBean) request.getSession().getAttribute("utente");
			if(utente == null){
			request.getSession().setAttribute("ruolo", "guest");
			}
			if(request.getSession().getAttribute("ruolo").equals("guest")){%>
				<jsp:include page="navbarUnlogged.jsp"/>
			<%}else{ %>
				<jsp:include page="navbarLogged.jsp"/>
			<% } %>
			<div>
				<h1>Error 404!</h1>
				<h2>Questa risorsa non esiste! Premi qui per tornare alla home</h2>
				<a href="home.jsp"><button type="button">Torna alla home</button></a>
			</div>

</body>
</html>