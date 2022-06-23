<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="javax.servlet.*" %>
    <%@page import="javax.servlet.http.*" %>
    <%@page import="Model.FumettiBean" %>
    <%@page import="Model.FumettiModel" %> 
    <%@page import="Model.GraficheBean" %>
    <%@page import="Model.GraficheModel" %>
    <%@page import="Model.ModelliniBean" %>
    <%@page import="Model.ModelliniModel" %>
    <%@page import="java.text.DecimalFormat" %>
    <%@page import="Model.UserBean" %>
    <%@page import="Util.venditeComparator" %>
    <%@page import="tsw.Control.nuovoProdottoServlet" %>
    <%@page import="java.util.Collections" %>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<head>

<style>

.listProd li{
 word-break: break-word;
 display:inline-block;
 float:right;
}
</style>

<title>Catalogo</title>
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

	<h1 class="titoloCatalogo">CATALOGO NEGOZIO</h1>
	
		<div style="display:flex; width:100%">
		<div style="width:20%">
			<h2 id="fumetti" class="intestazione" style="margin:15% 0 10% 10%">Fumetti</h2>
			<h3 class="sottointestazione" style="margin:0 0 0 25%">Manga</h3>
		</div>
		
		<%
			if(request.getSession().getAttribute("ruolo").equals("admin"))
			{
		%>
		<div style="margin-left:60%; width:20%; max-width:300px; float:right">
			<a href="./CatalogoAdmin.jsp">
			<button class="open-button">Vai al catalogo admin</button>
			</a>
		</div>
		<% } %>
	</div>
		
	<%
	FumettiModel fmodel = new FumettiModel();
	
	ArrayList<FumettiBean> arrayManga = new ArrayList<FumettiBean>(fmodel.doRetrieveAllManga(null));
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
	
		<ul style="list-style-type:none;">
		<% for(FumettiBean fumetto : arrayManga){ 
			String nomeImmagine = fumetto.getTitolo().replace(":", "").replace("/", "");
			long seriale = fumetto.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>">
			<div class="prodotto">
			<li style="float:none"><img src="./gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<%=fumetto.getTitolo()%>
			<br>
			<%out.println(String.format("%.2f&euro;", fumetto.getPrezzo()));%>
			<br>
			
			<br>
			</li>
			</a>
		<form action="./ServletCarrello?page=Catalogo.jsp&seriale=<%=fumetto.getSeriale()%>&macroCategoria=<%=fumetto.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<% } %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Manhua</h3>
	<%
	ArrayList<FumettiBean> arrayManhua = new ArrayList<FumettiBean>(fmodel.doRetrieveAllManhua(null));
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		
		<ul style="list-style-type:none;">
		<% for(FumettiBean fumetto : arrayManhua){ 
			 String nomeImmagine = fumetto.getTitolo().replace(":", "").replace("/", ""); 
			long seriale = fumetto.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<%=fumetto.getTitolo()%><br>
			<%out.println(String.format("%.2f&euro;", fumetto.getPrezzo()));%><br>
			
			<br>
			</li>
			</a>
		<form action="./ServletCarrello?page=Catalogo.jsp&seriale=<%=fumetto.getSeriale()%>&macroCategoria=<%=fumetto.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<% } %>
		</ul>
		</div>
		<h2 class="intestazione" id="grafiche" >Grafiche</h2>
	<h3 class="sottointestazione">D'Opera</h3>
	
	<%
	GraficheModel gmodel = new GraficheModel();
	//String path = .getContextRoot();
	//out.println(path);
	ArrayList<GraficheBean> arrayOpera = new ArrayList<GraficheBean>(gmodel.doRetrieveAllOpera(null));
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(GraficheBean grafica : arrayOpera){ 
			String nomeImmagine = grafica.getTitolo().replace(":", "").replace("/", "");
			long seriale = grafica.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<%=grafica.getTitolo()%>
			<br>
			<%out.println(String.format("%.2f&euro;", grafica.getPrezzo()));%><br>
			<br>
			</li>
			</a>
		<form action="./ServletCarrello?page=Catalogo.jsp&seriale=<%=grafica.getSeriale()%>&macroCategoria=<%=grafica.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<% } %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Moderne</h3>
	<%
	ArrayList<GraficheBean> arrayModerne = new ArrayList<GraficheBean>(gmodel.doRetrieveAllModerna(null));
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(GraficheBean grafica : arrayModerne){ 
			 String nomeImmagine = grafica.getTitolo().replace(":", "").replace("/", "");
			long seriale = grafica.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<%=grafica.getTitolo()%><br>
			<%out.println(String.format("%.2f&euro;", grafica.getPrezzo()));%><br>
			
			<br>
			</li>
			</a>
		<form action="./ServletCarrello?page=Catalogo.jsp&seriale=<%=grafica.getSeriale()%>&macroCategoria=<%=grafica.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<% } %>
		</ul>
		</div>
		
		<h2 class="intestazione" id="modellini">Modellini</h2>
	<h3 class="sottointestazione">Funko POP!</h3>
	
	<%
	ModelliniModel mmodel = new ModelliniModel();
	//String path = .getContextRoot();
	//out.println(path);
	ArrayList<ModelliniBean> arrayFunko = new ArrayList<ModelliniBean>(mmodel.doRetrieveAllFunko(null));
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
			
		<ul style="list-style-type:none;">
		<% for(ModelliniBean modellino : arrayFunko){
			String nomeImmagine = modellino.getNome().replace(":", "").replace("/", "");
			long seriale = modellino.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<%=modellino.getNome()%>
			<br>
			<%out.println(String.format("%.2f&euro;", modellino.getPrezzo()));%><br>
			<br>
			</li>
			</a>
		<form action="./ServletCarrello?page=Catalogo.jsp&seriale=<%=modellino.getSeriale()%>&macroCategoria=<%=modellino.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<% } %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Action Figures</h3>
	<%
	ArrayList<ModelliniBean> arrayFigures = new ArrayList<ModelliniBean>(mmodel.doRetrieveAllFigures(null));
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(ModelliniBean modellino : arrayFigures){
			 String nomeImmagine = modellino.getNome().replace(":", "").replace("/", "");
			long seriale = modellino.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<%=modellino.getNome()%><br>
			<%out.println(String.format("%.2f&euro;", modellino.getPrezzo()));%><br>
			<br>
			</li>
			</a>
		<form action="./ServletCarrello?page=Catalogo.jsp&seriale=<%=modellino.getSeriale()%>&macroCategoria=<%=modellino.getMacroCategoria()%>&action=aggiungi&numAggiungi=1" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<% } %>
		</ul>
		</div>
		
		<jsp:include page="footer.jsp"/>
	
</body>
</html>