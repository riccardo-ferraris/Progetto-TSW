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
    <%@page import="Control.nuovoProdottoServlet" %>
    <%@page import="java.util.Collections" %>
<!DOCTYPE html>
<html>
<%  
@SuppressWarnings("unchecked")
	ArrayList<FumettiBean> arrayManga = (ArrayList<FumettiBean>) request.getAttribute("arrayManga");
@SuppressWarnings("unchecked")
	ArrayList<FumettiBean> arrayManhua = (ArrayList<FumettiBean>) request.getAttribute("arrayManhua");
@SuppressWarnings("unchecked")
	ArrayList<GraficheBean> arrayOpera = (ArrayList<GraficheBean>) request.getAttribute("arrayOpera");
@SuppressWarnings("unchecked")
	ArrayList<GraficheBean> arrayModerne = (ArrayList<GraficheBean>) request.getAttribute("arrayModerne");
@SuppressWarnings("unchecked")
	ArrayList<ModelliniBean> arrayFunko = (ArrayList<ModelliniBean>) request.getAttribute("arrayFunko");
@SuppressWarnings("unchecked")
	ArrayList<ModelliniBean> arrayFigures = (ArrayList<ModelliniBean>) request.getAttribute("arrayFigures");

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
 display:inline-block;
 float:right;
}
</style>

<title>Catalogo</title>
</head>

<body>
		<jsp:include page="header.jsp"/>
		<%
		
			try {
			    response.setHeader("Cache-Control","no-cache");
			    response.setHeader("Cache-Control","no-store");
			    response.setHeader("Pragma","no-cache");
			    response.setDateHeader ("Expires", 0);
			}
			catch(Exception ex) {
			    out.println(ex);
			}
			%>
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
	<jsp:include page="PopupAcquisto.html"/>
	
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

	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
	
		<ul style="list-style-type:none;">
		<% 
		
		for(FumettiBean fumetto : arrayManga){
			if(fumetto.isVisible()){
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
		<form class="quickAggCarrello" method="post" id="quickAggiungiForm_<%=fumetto.getSeriale()+"_"+fumetto.getMacroCategoria()%>">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<%} 
			} %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Manhua</h3>
	<%

	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		
		<ul style="list-style-type:none;">
		<% for(FumettiBean fumetto : arrayManhua){
			if(fumetto.isVisible()){
			 String nomeImmagine = fumetto.getTitolo().replace(":", "").replace("/", ""); 
			long seriale = fumetto.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<p class="productName"><%=fumetto.getTitolo()%></p>
			<%out.println(String.format("%.2f&euro;", fumetto.getPrezzo()));%><br>
			
			<br>
			</li>
			</a>
		<form class="quickAggCarrello" method="post" id="quickAggiungiForm_<%=fumetto.getSeriale()+"_"+fumetto.getMacroCategoria()%>">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<%} 
			} %>
		</ul>
		</div>
		<h2 class="intestazione" id="grafiche" >Grafiche</h2>
	<h3 class="sottointestazione">D'Opera</h3>
	
	<%
	//String path = .getContextRoot();
	//out.println(path);
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(GraficheBean grafica : arrayOpera){
			if(grafica.isVisible()){
			String nomeImmagine = grafica.getTitolo().replace(":", "").replace("/", "");
			long seriale = grafica.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<p class="productName"><%=grafica.getTitolo()%></p>
			
			<%out.println(String.format("%.2f&euro;", grafica.getPrezzo()));%><br>
			<br>
			</li>
			</a>
		<form class="quickAggCarrello" method="post" id="quickAggiungiForm_<%=grafica.getSeriale()+"_"+grafica.getMacroCategoria()%>">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<%}
			} %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Moderne</h3>
	<%
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(GraficheBean grafica : arrayModerne){
			if(grafica.isVisible()){
			 String nomeImmagine = grafica.getTitolo().replace(":", "").replace("/", "");
			long seriale = grafica.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li style="float:none"><img src="./gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:70%>
			<br>
			<br>
			<p class="productName"><%=grafica.getTitolo()%></p>
			<%out.println(String.format("%.2f&euro;", grafica.getPrezzo()));%><br>
			
			<br>
			</li>
			</a>
		<form class="quickAggCarrello" method="post" id="quickAggiungiForm_<%=grafica.getSeriale()+"_"+grafica.getMacroCategoria()%>">
			<div class="aggiungiCarrelloProd">
				<button class="piu" style="color:white">Aggiungi al carrello</button>
			</div>
		</form>
			</div>
			<%}
			} %>
		</ul>
		</div>
		
		<h2 class="intestazione" id="modellini">Modellini</h2>
	<h3 class="sottointestazione">Funko POP!</h3>
	
	<%
	//String path = .getContextRoot();
	//out.println(path);
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
			
		<ul style="list-style-type:none;">
		<% for(ModelliniBean modellino : arrayFunko){
			if(modellino.isVisible()){
				String nomeImmagine = modellino.getNome().replace(":", "").replace("/", "");
				long seriale = modellino.getSeriale();%>
				<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
				<li style="float:none"><img src="./gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:70%>
				<br>
				<br>
				<p class="productName"><%=modellino.getNome()%></p>
				
				<%out.println(String.format("%.2f&euro;", modellino.getPrezzo()));%><br>
				<br>
				</li>
				</a>
			<form class="quickAggCarrello" method="post" id="quickAggiungiForm_<%=modellino.getSeriale()+"_"+modellino.getMacroCategoria()%>">
				<div class="aggiungiCarrelloProd">
					<button class="piu" style="color:white">Aggiungi al carrello</button>
				</div>
			</form>
				</div>
			<%}
			} %>
		</ul>
	</div>
	
	<h3 class="sottointestazione">Action Figures</h3>
	<%
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
	
	<div class = "listProd">
		<ul style="list-style-type:none;">
		<% for(ModelliniBean modellino : arrayFigures){
			if(modellino.isVisible()){
				 String nomeImmagine = modellino.getNome().replace(":", "").replace("/", "");
				long seriale = modellino.getSeriale();%>
				<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
				<li style="float:none"><img src="./gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:70%>
				<br>
				<br>
				<p class="productName"><%=modellino.getNome()%></p>
				<%out.println(String.format("%.2f&euro;", modellino.getPrezzo()));%><br>
				<br>
				</li>
				</a>
			<form class="quickAggCarrello" method="post" id="quickAggiungiForm_<%=modellino.getSeriale()+"_"+modellino.getMacroCategoria()%>">
				<div class="aggiungiCarrelloProd">
					<button class="piu" style="color:white">Aggiungi al carrello</button>
				</div>
			</form>
				</div>
			<%}
			} %>
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
		              url:"ServletCarrello?page=Catalogo.jsp&seriale="+parametersArray[1]+"&macroCategoria="+parametersArray[2]+"&action=aggiungi&numAggiungi=1",
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