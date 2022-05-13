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
    <%@page import="java.util.List" %>
    <%@page import="java.util.LinkedList" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<%
//out.println(((FumettiBean)articolo).getCategoria());

String seriale = request.getParameter("id");
char firstChar = seriale.charAt(0);
int firstDigit = Integer.parseInt("" + firstChar);
ArticoloModel articoloModel = null;
Articolo articolo = null;
String nomeImmagine = new String();
switch(firstDigit){
	case 1: articoloModel = new FumettiModel();
	articolo = new FumettiBean();
	articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));%>
		
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
		
		<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
		<img src="${pageContext.request.contextPath}/gallery/Fumetti/<%=nomeImmagine%>.jpg" width="300" height="400">
		<p><%out.println(((FumettiBean)articolo).getCategoria());%><br>
			<%out.println(articolo.getNome());%><br>
			<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br>
			<%out.println(articolo.getDescrizione());%><br>
		</p>
			
		<%
		break;
	
	case 2: articoloModel = new GraficheModel();
		articolo = new GraficheBean();
		articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));%>
		
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
		<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
		<img src="${pageContext.request.contextPath}/gallery/Grafiche/<%=nomeImmagine%>.jpg" width="300" height="400">
		<p><%out.println(((GraficheBean)articolo).getCategoria());%><br>
			<%out.println(articolo.getNome());%><br>
			<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br>
			<%out.println(articolo.getDescrizione());%><br>
		</p>
			
		<%
		break;
	
	case 3: articoloModel = new ModelliniModel();
		articolo = new ModelliniBean();
		articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));
		%>
		
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
		<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
		<img src="${pageContext.request.contextPath}/gallery/Modellini/<%=nomeImmagine%>.jpg" width="300" height="400">
		<p><%out.println(((ModelliniBean)articolo).getCategoria());%><br>
			<%out.println(articolo.getNome());%><br>
			<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br>
			<%out.println(articolo.getDescrizione());%><br>
		</p>
		
		<%
		break;
		
	default: out.println("404 Error");
		break;	
}

					if(articolo.getQuantità()>0)
                     {
                     %>
                  <label>Quantità: </label>
                  <form action="./ServletCarrello?page=/carrello.jsp&seriale=<%=articolo.getSeriale()%>&action=aggiungi" method="post">
                     <input type="text" value="1" name="quantita"/>
                     <button type="submit" class="btn btn-primary">
                     Aggiungi al carrello
                     </button>
                  </form>
                  <% } %>
</body>
</html>