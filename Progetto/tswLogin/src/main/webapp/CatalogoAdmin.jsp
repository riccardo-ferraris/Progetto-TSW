<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList" %>
    <%@page import="java.util.List" %>
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
    <%@page import="Control.nuovoProdottoServlet" %>
<!DOCTYPE html>
<html>
<%@ page errorPage="ErrorPage.jsp" %> 
<%UserBean utente = (UserBean) request.getSession().getAttribute("utente");
	if(utente == null){
		request.getSession().setAttribute("ruolo", "guest");
		response.sendRedirect("Catalogo.jsp");
		return;
	}
	if(!utente.getRuolo().equals("admin")){
		response.sendRedirect("Catalogo.jsp");
		return;
	}
	
	@SuppressWarnings("unchecked")
	List<FumettiBean> arrayManga = (ArrayList<FumettiBean>) request.getAttribute("arrayManga");
	@SuppressWarnings("unchecked")
	List<FumettiBean> arrayManhua = (ArrayList<FumettiBean>) request.getAttribute("arrayManhua");
	@SuppressWarnings("unchecked")
	List<GraficheBean> arrayOpera = (ArrayList<GraficheBean>) request.getAttribute("arrayOpera");
	@SuppressWarnings("unchecked")
	List<GraficheBean> arrayModerne = (ArrayList<GraficheBean>) request.getAttribute("arrayModerne");
	@SuppressWarnings("unchecked")
	List<ModelliniBean> arrayFunko = (ArrayList<ModelliniBean>) request.getAttribute("arrayFunko");
	@SuppressWarnings("unchecked")
	List<ModelliniBean> arrayFigures = (ArrayList<ModelliniBean>) request.getAttribute("arrayFigures");

	if(arrayManga == null){
		response.sendRedirect("./RedirectServlet?page=catalogo");
		return;
}
%>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<head>

<style>

.listProd li{
 word-break: break-word;
 display:block;
 float:right;
}
</style>

<title>Catalogo</title>
</head>

<body>
	<jsp:include page="header.jsp"/>
		<% 
			if(request.getSession().getAttribute("ruolo").equals("guest")){%>
				<jsp:include page="navbarUnlogged.jsp"/>
			<%}else{ %>
				<jsp:include page="navbarLogged.jsp"/>
			<% } %>

	<h1 class="titoloCatalogo">CATALOGO NEGOZIO</h1>
	<jsp:include page="PopupAcquisto.html"/>
	
	<div style="display:flex; width:100%">
		<div style="width:20%">
			<h2 id="fumetti" class="intestazione" style="margin:15% 0 10% 10%">Fumetti</h2>
			<h3 class="sottointestazione" style="margin:0 0 0 25%">Manga</h3>
		</div>
		
		<div class="catButton">
			<button class="open-button" onclick="openForm()"
			title='Pop Up'>Aggiungi un nuovo articolo</button>
			
			<form method="get" action="./RedirectServlet">
				<input type="hidden" name="page" value="viewUtenti" /> 
				<button class="open-button">Vai al catalogo utenti</button>
			</form>
		</div>
		
	</div>
		
		<div class="form-popup" id="myForm">
  			<form action="nuovoProdottoServlet" class="form-container" method="post" enctype='multipart/form-data'>
    			<h1>Inserisci nuovo prodotto</h1>
				
				<div class="selectCategorie">
					<div>
						<div style="display:flex">
							<div style="margin-right:10%; width:45%">
								<label for="categoria"><b>Categoria</b></label><br>
								<select name="categoria" id="categorie" onchange="mostraSottoCategorie()">
									<option value="default">--Seleziona--</option>
    								<option value="fumetti">Fumetti</option>
   									<option value="grafica">Grafiche</option>
   				   					<option value="modellino">Modellino</option></select>
  							</div>
  					
  							<div id="divSottocategoriaFumetti" style="visibility:hidden; width:45%">
  								<label for="sottoCategoria"><b>Sottocategoria</b></label><br>
								<select name="sottoCategoria" id="sottoCategorie"></select>
  							</div>
  						</div>
  					
  						<div id="divFumetti" style="display:none">
  							<div style="display:flex; width:100%">
  								<div style="width:35%; margin-right:10%">
  									<label for="scrittore"><b>Scrittore</b></label><br>
									<input type="text" name="scrittore" id="scrittore"></input>
								</div>
							

								<div style="width:35%; margin-right:10%">
									<label for="disegnatore"><b>Disegnatore</b></label><br>
									<input type="text" name="disegnatore" id="disegnatore"></input>
								</div>
							
								<div style="width:10%">	
									<label for="numPagine"><b>Pagine</b></label><br>
									<input type="number" name="numPagine" id="numPagine" min="1"></input>
  								</div>
  							</div>
  						</div>
  						
  						<div id="divModellino" style="display:none">
  							<div style="display:flex; width:100%">
  								<div style="width:45%; margin-right:10%">
  							 		<label for="franchise"><b>Franchise</b></label><br>
									<input type="text" name="franchise" id="franchise" maxlength="30"></input>
								</div>
								<div style="width:45%">
									<label for="dimensioni"><b>Altezza (cm)</b></label><br>
									<input type="number" name="dimensioni" id="dimensioni" min="1" step=".1"></input>
  								</div>
  							</div>

  						</div>
  					</div>
  				</div>			
    			
  				<script>
  				function mostraSottoCategorie(){
  					let cat1 = null, cat2 = null;
  					if(document.getElementById("categorie").value === "fumetti"){
  						cat1 = "Manga";
  						cat2 = "Manhwa";
  						document.getElementById("divFumetti").style.display = "flex";
  						document.getElementById("divModellino").style.display = "none";
  					}else if(document.getElementById("categorie").value === "grafica"){
  						cat1 = "Moderna";
  						cat2 = "Opera";
  						document.getElementById("divFumetti").style.display = "none";
  						document.getElementById("divModellino").style.display = "none";
  					}else if(document.getElementById("categorie").value === "modellino"){
  						cat1 = "Funko Pop!";
  						cat2 = "Action Figure";
  						document.getElementById("divFumetti").style.display = "none";
  						document.getElementById("divModellino").style.display = "flex";
  					}
  			
  					var select = document.getElementById('sottoCategorie');
  					document.getElementById("sottoCategorie").innerHTML = "";
  					select.options.add(new Option(cat1));
  					select.options.add(new Option(cat2));
  					showInput();
  					
  					if(document.getElementById("categorie").value === "default"){
  						document.getElementById("sottoCategorie").innerHTML = "";
  					}
  					
				}
  				
  				function showInput() {
                    document.getElementById("divSottocategoriaFumetti").style.visibility = "visible";
                  }
                  
                  function hideInput() {
                    document.getElementById("divSottocategoriaFumetti").style.display = "none";
                  }
  				</script>
				
				<div style="display:flex">
					<div style="margin-right:10%; width:45%">
    					<label for="nome"><b>Nome Prodotto</b></label>
   			 			<input type="text" placeholder="Nome Prodotto" name="nome" required maxlength="100">
					</div>
					<div style="width:45%">
    					<label for="seriale"><b>Seriale</b></label>
    					<input type="text" placeholder="Seriale Prodotto" name="seriale" required maxlength="15">
    					<%//Inserire ajax func che genera un seriale senza ricaricare la pagina %>
    				</div>
    			</div>
			
    			<div class="prezzoQuantita" style="display:flex">	
    				<div class="divPrezzo" style="margin-right:10%; width:26%">
    					<label for="prezzo"><b>Prezzo</b></label>
						<input type="text" placeholder="Prezzo" name="prezzo" required>
    				</div>
    				
    				<div class="divIVA" style="margin-right:10%; width:26%">
    					<label for="IVA"><b>IVA</b></label>
						<input type="text" placeholder="IVA" name="IVA" required>
    				</div>
    			
    				<div class="divQuantita" style="width:28%">
    					<label for="quantita"><b>Quantità</b></label>
    					<input type="number" placeholder="Quantità" name="quantità" min="1" required>
    				</div>
    			</div>
				
				<label for="descrizione"><b>Descrizione</b></label>
				<textarea class="formTextArea" name="descrizione" placeholder="Descrizione prodotto"></textarea>

				<input type="file" id="imgProdotto" class="btn" name="imgProdotto">
				
    			<button type="submit" class="btn">Inserisci</button>
    			<button type="button" class="btn cancel" onclick="closeForm()">Chiudi</button>
  			</form>
		</div>
		
		<script>
			function openForm() {
 				document.getElementById("myForm").style.display = "block";
			}

			function closeForm() {
				document.getElementById("myForm").style.display = "none";
			}
		</script>
	<%
	
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
			<p class="productName"><%=fumetto.getTitolo()%></p>
			<%out.println(String.format("%.2f&euro;", fumetto.getPrezzo()));%>
			<br>
			
			<br>
			</li>
			</a>
				<div class="aggiungiCarrelloProd">
					<form class="quickAggCarrello" id="quickAggiungiForm_<%=fumetto.getSeriale()+"_"+fumetto.getMacroCategoria()%>" method="post">				
						<button class="piu" style="color:white">Aggiungi al carrello</button>
					</form>
				</div>
				<br>
			<form method="post" action="NascondiProdotto">	
				<%if(fumetto.isVisible()){%>
					<button name="nascondi" value="false" class="deleteProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></button>
				<%}else{ %>
					<button name="nascondi" value="true" class="showProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"><path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/><path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/></svg></button>
				<%} %>
				<input type="hidden" id="serialeProd" name="seriale" value="<%=fumetto.getSeriale()%>">
				<input type="hidden" id="catProd" name="categoria" value="<%=fumetto.getMacroCategoria()%>">
			</form>
		</div>
		
			<% } %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Manhua</h3>
	<%
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		
		<ul style="list-style-type:none;">
		<% for(FumettiBean fumetto : arrayManhua){ 
			 String nomeImmagine = fumetto.getTitolo().replace(":", "").replace("/", ""); 
			long seriale = fumetto.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:70%>
			<br><br>
			<p class="productName"><%=fumetto.getTitolo()%></p>
			Prezzo: <%out.println(String.format("%.2f&euro;", fumetto.getPrezzo()));%><br>
			<br>
			</li>
			</a>
		<form class="quickAggCarrello" id="quickAggiungiForm_<%=fumetto.getSeriale()+"_"+fumetto.getMacroCategoria()%>" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
		<br>	
				<form method="post" action="NascondiProdotto">
					<%if(fumetto.isVisible()){%>
						<button name="nascondi" value="false" class="deleteProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></button>
					<%}else{ %>
						<button name="nascondi" value="true" class="showProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"><path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/><path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/></svg></button>
					<%} %>
					<input type="hidden" id="serialeProd" name="seriale" value="<%=fumetto.getSeriale()%>">
					<input type="hidden" id="catProd" name="categoria" value="<%=fumetto.getMacroCategoria()%>">
				</form>
			</div>
			<% } %>
		</ul>
		</div>
		<h2 class="intestazione" id="grafiche" >Grafiche</h2>
	<h3 class="sottointestazione">D'Opera</h3>
	
	<%
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(GraficheBean grafica : arrayOpera){ 
			String nomeImmagine = grafica.getTitolo().replace(":", "").replace("/", "");
			long seriale = grafica.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:70%>
			<br><br>
			<p class="productName"><%=grafica.getTitolo()%></p>
			
			Prezzo: <%out.println(String.format("%.2f&euro;", grafica.getPrezzo()));%><br>
			
			<br>
			</li>
			</a>
		<form class="quickAggCarrello" id="quickAggiungiForm_<%=grafica.getSeriale()+"_"+grafica.getMacroCategoria()%>" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
		<br>
			<form method="post" action="NascondiProdotto">	
				<%if(grafica.isVisible()){%>
					<button name="nascondi" value="false" class="deleteProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></button>
				<%}else{ %>
					<button name="nascondi" value="true" class="showProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"><path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/><path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/></svg></button>
				<%} %>
				<input type="hidden" id="serialeProd" name="seriale" value="<%=grafica.getSeriale()%>">
				<input type="hidden" id="catProd" name="categoria" value="<%=grafica.getMacroCategoria()%>">
			</form>
			</div>
			<% } %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Moderne</h3>
	<%
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(GraficheBean grafica : arrayModerne){ 
			 String nomeImmagine = grafica.getTitolo().replace(":", "").replace("/", "");
			long seriale = grafica.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:70%>
			<br><br>
			<p class="productName"><%=grafica.getTitolo()%></p>
			Prezzo: <%out.println(String.format("%.2f&euro;", grafica.getPrezzo()));%><br>

			<br>
			</li>
			</a>
		<form class="quickAggCarrello" id="quickAggiungiForm_<%=grafica.getSeriale()+"_"+grafica.getMacroCategoria()%>" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
		<br>
			<form method="post" action="NascondiProdotto">
				<%if(grafica.isVisible()){%>
					<button name="nascondi" value="false" class="deleteProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></button>
				<%}else{ %>
					<button name="nascondi" value="true" class="showProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"><path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/><path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/></svg></button>
				<%} %>
				<input type="hidden" id="serialeProd" name="seriale" value="<%=grafica.getSeriale()%>">
				<input type="hidden" id="catProd" name="categoria" value="<%=grafica.getMacroCategoria()%>">
			</form>
			</div>
			<% } %>
		</ul>
		</div>
		
		<h2 class="intestazione" id="modellini">Modellini</h2>
	<h3 class="sottointestazione">Funko POP!</h3>
	
	<%
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
			
		<ul style="list-style-type:none;">
		<% for(ModelliniBean modellino : arrayFunko){
			String nomeImmagine = modellino.getNome().replace(":", "").replace("/", "");
			long seriale = modellino.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:70%>
			<br><br>
			<p class="productName"><%=modellino.getNome()%></p>
			
			Prezzo: <%out.println(String.format("%.2f&euro;", modellino.getPrezzo()));%><br>	
			<br>
			</li>
			</a>
		<form class="quickAggCarrello" id="quickAggiungiForm_<%=modellino.getSeriale()+"_"+modellino.getMacroCategoria()%>" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
		<br>	
			<form method="post" action="NascondiProdotto">
				<%if(modellino.isVisible()){%>
					<button name="nascondi" value="false" class="deleteProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></button>
				<%}else{ %>
					<button name="nascondi" value="true" class="showProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"><path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/><path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/></svg></button>
				<%} %>
				<input type="hidden" id="serialeProd" name="seriale" value="<%=modellino.getSeriale()%>">
				<input type="hidden" id="catProd" name="categoria" value="<%=modellino.getMacroCategoria()%>">
			</form>
			</div>
			<% } %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Action Figures</h3>
	<%
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(ModelliniBean modellino : arrayFigures){
			 String nomeImmagine = modellino.getNome().replace(":", "").replace("/", "");
			long seriale = modellino.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:70%>
			<br><br>
			<p class="productName"><%=modellino.getNome()%></p>
			Prezzo: <%out.println(String.format("%.2f&euro;", modellino.getPrezzo()));%><br>
			<br>
			</li>
			</a>
		<form class="quickAggCarrello" id="quickAggiungiForm_<%=modellino.getSeriale()+"_"+modellino.getMacroCategoria()%>" method="post">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
		<br>	
			<form method="post" action="NascondiProdotto">
				<%if(modellino.isVisible()){%>
					<button name="nascondi" value="false" class="deleteProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>  <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></button>
				<%}else{ %>
					<button name="nascondi" value="true" class="showProd"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16"><path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/><path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/></svg></button>
				<%} %>
				<input type="hidden" id="serialeProd" name="seriale" value="<%=modellino.getSeriale()%>">
				<input type="hidden" id="catProd" name="categoria" value="<%=modellino.getMacroCategoria()%>">
			</form>
			</div>
			<% } %>
		</ul>
		</div>
		
		<jsp:include page="footer.jsp"/>
	
	<script>
			$('.quickAggCarrello').on('submit', function (e) {
				e.preventDefault();
			    var id = this.id;
			    console.log(id);
		   
			    const parametersArray = id.split("_");
			    console.log(parametersArray);
		          $.ajax({
		        	  type: "GET",
		              url:"ServletCarrello?page=CatalogoAdmin.jsp&seriale="+parametersArray[1]+"&macroCategoria="+parametersArray[2]+"&action=aggiungi&numAggiungi=1",
		              cache: false,
		              success: function (data) {
		            	  console.log("added product with no errors");
		 
		            	  $("#aggProdMex").css('display','block').removeClass('hidden');
		            	  setTimeout(function (){
		            		  
		            		  $("#aggProdMex").addClass('hidden')
		            		            
		            		}, 1000);
		              },
		              error: function(){
		                 alert("error");
		              } 
		         });
		     });
   </script>
	
</body>
</html>