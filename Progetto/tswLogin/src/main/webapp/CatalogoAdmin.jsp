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
    <%@page import="tsw.Control.nuovoProdottoServlet" %>
<!DOCTYPE html>
<html>
<%
	UserBean utente = (UserBean) request.getSession().getAttribute("utente");
	if(!utente.getRuolo().equals("admin"))
	{
		response.sendRedirect("Catalogo.jsp");	
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

    <nav id="mainNav">
        <ul id="menuList">
            <li><a href="#fumetti">FUMETTI</a></li>
            <li><a href="#grafiche">GRAFICHE</a></li>
            <li><a href="#modellini">MODELLINI</a></li>
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

	<h1 class="titoloCatalogo">CATALOGO NEGOZIO</h1>
	
	<div style="display:flex; width:100%">
		<div style="width:20%">
			<h2 id="fumetti" class="intestazione" style="margin:15% 0 10% 10%">Fumetti</h2>
			<h3 class="sottointestazione" style="margin:0 0 0 25%">Manga</h3>
		</div>
		
		<div style="margin-left:60%; width:20%; max-width:300px; float:right">
			<button class="open-button" onclick="openForm()"
			title='Pop Up'>Aggiungi un nuovo articolo</button>
			
			<a href="./Catalogo.jsp">
			<button class="open-button">Vai al catalogo utenti</button>
			</a>
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
    				</div>
    			</div>
			
    			<div class="prezzoQuantita" style="display:flex">	
    				<div class="divPrezzo" style="margin-right:10%; width:45%">
    					<label for="prezzo"><b>Prezzo</b></label>
						<input type="text" placeholder="Prezzo" name="prezzo" required>
    				</div>
    			
    				<div class="divQuantita" style="width:45%">
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
	FumettiModel fmodel = new FumettiModel();
	
	ArrayList<FumettiBean> arrayManga = new ArrayList<FumettiBean>(fmodel.doRetrieveAllManga(null));
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
	
		<ul style="list-style-type:none;">
		<% for(FumettiBean fumetto : arrayManga){ 
			String nomeImmagine = fumetto.getTitolo().replace(":", "").replace("/", "");
			long seriale = fumetto.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li><img src="${pageContext.request.contextPath}/gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<%=fumetto.getTitolo()%>
			<br>
			Prezzo: <%out.println(String.format("%.2f&euro;", fumetto.getPrezzo()));%><br></li>
			</div></a>
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
			<li><img src="${pageContext.request.contextPath}/gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<%=fumetto.getTitolo()%><br>
			Prezzo: <%out.println(String.format("%.2f&euro;", fumetto.getPrezzo()));%><br></li>
			</div></a>
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
			<li><img src="${pageContext.request.contextPath}/gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<%=grafica.getTitolo()%>
			<br>
			Prezzo: <%out.println(String.format("%.2f&euro;", grafica.getPrezzo()));%><br></li>
			</div></a>
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
			<li><img src="${pageContext.request.contextPath}/gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<%=grafica.getTitolo()%><br>
			Prezzo: <%out.println(String.format("%.2f&euro;", grafica.getPrezzo()));%><br></li>
			</div></a>
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
			<li><img src="${pageContext.request.contextPath}/gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<%=modellino.getNome()%>
			<br>
			Prezzo: <%out.println(String.format("%.2f&euro;", modellino.getPrezzo()));%><br></li>
			</div></a>
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
			<li><img src="${pageContext.request.contextPath}/gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<%=modellino.getNome()%><br>
			Prezzo: <%out.println(String.format("%.2f&euro;", modellino.getPrezzo()));%><br></li>
			</div></a>
			<% } %>
		</ul>
		</div>
		
		<jsp:include page="footer.jsp"/>
	
</body>
</html>