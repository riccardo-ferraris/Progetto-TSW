<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="Model.ArticoloModel" %>
    <%@page import="Model.Articolo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		@SuppressWarnings("unchecked")
	 	ArrayList<Articolo> risultatiRicerca = ((ArrayList<Articolo>) request.getSession().getAttribute("searchedItems"));
		out.println(risultatiRicerca.toString());
    	
	%>
</body>
</html>