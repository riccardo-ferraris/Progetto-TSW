<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Ordine"%>
    <%
    if(session.getAttribute("ruolo") == null)
    {
    	response.sendRedirect("login.jsp");	
    	return;
    }
    
    Ordine checkoutOrdine = ((Ordine) request.getSession().getAttribute("checkoutOrdine"));
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<body>
	<%
		
	%>
</body>
</html>