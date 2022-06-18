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
	<link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<%

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
			<jsp:include page="header.jsp"/>
			
		<nav id="mainNav">
        	<ul id="menuList">
            	<li><a href="./RedirectServlet?page=catalogo">CATALOGO</a></li>
        	</ul>
        	<ul id="menuList2">
            	<li><a href="./carrello.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                	<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              	</svg></a></li>
            	<li><input type="text" placeholder="Cerca" id="search" style="border-radius: 20px;"></li>
            	<li><a href="/partnership">PARTNERSHIP</a></li>
            	<li><a href="/utente">UTENTE</a></li>
        	</ul>
    	</nav>
		
		<div style="display:flex; width:100%; align-items:center">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img src="${pageContext.request.contextPath}/gallery/Fumetti/<%=nomeImmagine%>.jpg" style="width:50%; margin:10% 25%">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p> <%out.println(articolo.getNome());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(((FumettiBean)articolo).getCategoria());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
				</div>
				<div style="font-size:1em">
					<p> <%out.println(articolo.getDescrizione());%> </p>
				</div>
			</div>	
		</div>	
			
		<%
		break;
		
	case 2: articoloModel = new GraficheModel();
		articolo = new GraficheBean();
		articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));%>
		
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
		<jsp:include page="header.jsp"/>
		
		<nav id="mainNav">
        	<ul id="menuList">
            	<li><a href="./RedirectServlet?page=catalogo">CATALOGO</a></li>
        	</ul>
        	<ul id="menuList2">
            	<li><a href="./carrello.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                	<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              	</svg></a></li>
            	<li><input type="text" placeholder="Cerca" id="search" style="border-radius: 20px;"></li>
            	<li><a href="/partnership">PARTNERSHIP</a></li>
            	<li><a href="/utente">UTENTE</a></li>
        	</ul>
    	</nav>
		
		<div style="display:flex">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img src="${pageContext.request.contextPath}/gallery/Grafiche/<%=nomeImmagine%>.jpg" style="width:60%; margin:10%">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p> <%out.println(articolo.getNome());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(((GraficheBean)articolo).getCategoria());%> </p>		
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
				</div>
				<div style="font-size:1em">
					<p> <%out.println(articolo.getDescrizione());%> </p>
				</div>
			</div>
		</div>
		<%
		break;
	
	case 3: articoloModel = new ModelliniModel();
		articolo = new ModelliniBean();
		articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));
		%>
		
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
		<jsp:include page="header.jsp"/>
		
		<nav id="mainNav">
        	<ul id="menuList">
            	<li><a href="./RedirectServlet?page=catalogo">CATALOGO</a></li>
        	</ul>
        	<ul id="menuList2">
            	<li><a href="./carrello.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                	<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              	</svg></a></li>
            	<li><input type="text" placeholder="Cerca" id="search" style="border-radius: 20px;"></li>
            	<li><a href="/partnership">PARTNERSHIP</a></li>
            	<li><a href="/utente">UTENTE</a></li>
        	</ul>
    	</nav>
    	
    	<div style="display:flex">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img src="${pageContext.request.contextPath}/gallery/Modellini/<%=nomeImmagine%>.jpg" style="width:60%; margin:10%">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p> <%out.println(articolo.getNome());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(((ModelliniBean)articolo).getCategoria());%> </p>				
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
				</div>
				<div style="font-size:1em">
					<p> <%out.println(articolo.getDescrizione());%> </p>
				</div>
			</div>
		</div>

		<%
		break;
		
	default: out.println("404 Error");
		break;	
}

		if(articolo.getQuantità()>0)
        {
         %>
         <div class="aggiungiCarrello">
         	<label for="quantità"> Quantità: </label>
         	<form action="./ServletCarrello?page=/Prodotto.jsp&seriale=<%=articolo.getSeriale()%>&macroCategoria=<%=articolo.getMacroCategoria()%>&action=aggiungi" method="post">
         		<input type="number" value="1" min="1" name="numAggiungi" id="quantità"/>
         		<button type="submit" class="cartButton">
                	Aggiungi al carrello
                </button>
            </form>
         </div>
       <% } %>
        <jsp:include page="footer.jsp"/>
</body>
</html>