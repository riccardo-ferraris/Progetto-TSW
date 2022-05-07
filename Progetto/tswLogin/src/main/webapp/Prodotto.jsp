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

switch(firstDigit){
	case 1: articoloModel = new FumettiModel();
	articolo = new FumettiBean();
	articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));
	
	
		%>
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
		<%String nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
		<img src="${pageContext.request.contextPath}/gallery/Fumetti/<%=nomeImmagine%>.jpg" width="300" height="400">
		<p><%out.println(((FumettiBean)articolo).getCategoria());%><br>
			<%out.println(articolo.getNome());%><br>
			<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br>
			<%out.println(articolo.getDescrizione());%><br>
		
			
		</p>
		
		</body>	
		<%break;
	
	case 2: articoloModel = new GraficheModel();
	articolo = new GraficheBean();
		articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));
		
		
		
		%>
		<title><%=articolo.getNome()%></title>
		</head>
		<body>

		</body>	
		<%
		break;
	
	case 3: articoloModel = new ModelliniModel();
		articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));
		%>
		<title><%=articolo.getNome()%></title>
		</head>
		<body>

		</body>	
		<%
		break;
		
	default: out.println("404 Error");
		break;	
}
%>
</html>