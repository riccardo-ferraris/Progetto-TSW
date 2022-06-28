<%@page import="Util.venditeComparator"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.ArrayList" %>
    <%@page import="javax.servlet.*" %>
    <%@page import="javax.servlet.http.*" %>
    <%@page import="Model.FumettiBean" %>
    <%@page import="Model.FumettiModel" %> 
    <%@page import="Model.GraficheBean" %>
    <%@page import="Model.GraficheModel" %>
    <%@page import="Model.ModelliniBean" %>
    <%@page import="Model.ModelliniModel" %>
    <%@page import="Model.ArticoloModel" %>
    <%@page import="Model.Articolo" %>
    <%@page import="java.util.Collections" %>
    <%@page import="Model.UserBean" %>

<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <title>Home</title>
</head>

<body style="background-image: url('sfondo00006.gif')">
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
			
    <div class="topProduct">
        <div class="categoria">
            <h3>Funko Pop! più venduti</h3>
            <div class="mainProduct" >
            	<%
            		ArticoloModel model = new ModelliniModel();
            		
            		ArrayList<Articolo> topProducts = new ArrayList<Articolo>(model.doRetrieveAll(null));
            		Collections.sort(topProducts, new venditeComparator());
            		Collections.reverse(topProducts);
            		topProducts.subList(5, topProducts.size()).clear();
            		
                	String folder = "Modellini";
                	String nomeImmagine = new String();
                	long seriale;

							for(Articolo articolo : topProducts){
								nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
								seriale = articolo.getSeriale();
								%>
								<div class = "listProdHome" >
	
								<ul style="list-style-type:none; ">
								<a href="Prodotto.jsp?id=<%=seriale%>">
								<div class="prodottoHome">
								<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
								<br>
								<%=articolo.getNome()%>
								<br>
								<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
								</div></a>
								<form action="./ServletCarrello?page=home.jsp&seriale=<%=articolo.getSeriale()%>&macroCategoria=<%=articolo.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
									<div class="aggiungiCarrelloProd">
										<button class="quickAggiungi" style="color:white">Aggiungi al carrello</button>
									</div>
								</form>
								</ul>
								</div>
								<% } %>
		
            </div>
        </div>

        <div class="categoria">
            <h3>Manga e manhwa più venduti</h3>
            <div class="mainProduct">
            	<%
            		model = new FumettiModel();
            		topProducts = new ArrayList<Articolo>(model.doRetrieveAll(null));
            		Collections.sort(topProducts, new venditeComparator());
            		Collections.reverse(topProducts);
            		topProducts.subList(5, topProducts.size()).clear();
            		
                	folder = "Fumetti";            	
                
							for(Articolo articolo : topProducts){
								nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
								seriale = articolo.getSeriale();
								%>
								<div class = "listProdHome" >
	
								<ul style="list-style-type:none; ">
								<a href="Prodotto.jsp?id=<%=seriale%>">
								<div class="prodottoHome">
								<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
								<br>
								<%=articolo.getNome()%>
								<br>
								<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
								</div></a>
								<form action="./ServletCarrello?page=home.jsp&seriale=<%=articolo.getSeriale()%>&macroCategoria=<%=articolo.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
									<div class="aggiungiCarrelloProd">
										<button class="quickAggiungi" style="color:white">Aggiungi al carrello</button>
									</div>
								</form>
								</ul>
								</div>
								<% } %>

            </div>
        </div>

        <div class="categoria">
            <h3>Grafiche e poster più venduti</h3>
            <div class="mainProduct" >
            	<%
					model = new GraficheModel();
            		topProducts = new ArrayList<Articolo>(model.doRetrieveAll(null));
            		Collections.sort(topProducts, new venditeComparator());
            		Collections.reverse(topProducts);
            		topProducts.subList(5, topProducts.size()).clear();
            		
                	folder = "Grafiche";

							for(Articolo articolo : topProducts){
								nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
								seriale = articolo.getSeriale();
								%>
								<div class = "listProdHome" >
									<ul style="list-style-type:none; display:inline-block;">
									<a href="Prodotto.jsp?id=<%=seriale%>">
									<div class="prodottoHome">
										<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
										<br>
										<%=articolo.getNome()%>
										<br>
										<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
									</div></a>
									<form action="./ServletCarrello?page=home.jsp&seriale=<%=articolo.getSeriale()%>&macroCategoria=<%=articolo.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
									<div class="aggiungiCarrelloProd">
										<button class="quickAggiungi" style="color:white">Aggiungi al carrello</button>
									</div>
									</form>
									</ul>
								</div>
								<% } %>
            </div>
               
        </div>
    </div>

    	<jsp:include page="footer.jsp"/>

</body>

</html>