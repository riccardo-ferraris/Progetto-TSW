<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="Model.UserBean"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login valido</title>
</head>
<body>
	<% UserBean utente = (UserBean) request.getSession().getAttribute("utente");%>
	<p>
	Benvenuto <% out.println(utente.getNome() + " " + utente.getCognome());%>!
</body>
</html>