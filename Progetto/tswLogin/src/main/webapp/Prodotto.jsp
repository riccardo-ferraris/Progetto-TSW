<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.FumettiBean" %>
    <%@page import="Model.FumettiModel" %> 
     <%@page import="Model.GraficheBean" %>
    <%@page import="Model.GraficheModel" %>
    <%@page import="Model.ModelliniBean" %>
    <%@page import="Model.ModelliniModel" %>
    <%@page import="Model.Articolo" %>
    <%@page import="Model.ArticoloModel" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<%ArticoloModel model = new ArticoloModel();
long seriale = Long.parseLong(request.getParameter("id"));
Articolo articolo = model.doRetrieveByKey(seriale);
%>
<title><%=request.getParameter("id")%></title>
</head>
<body>

</body>
</html>