<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Ordine"%>
    <%@page import="Model.OrdineModel"%>
    <%@page import="Model.UserBean" %>
    <%@page import="Model.ProdottoInCarrello" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

	<%
	OrdineModel model = new OrdineModel();
	out.println(model.doRetrieveAll(null));
	%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ordini</title>
</head>
<body>
</body>
</html>