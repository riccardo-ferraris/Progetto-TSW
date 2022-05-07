<%@page import="javax.swing.text.StyledEditorKit.ForegroundAction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList" %>
     <%@page import="javax.servlet.*" %>
     <%@page import="javax.servlet.http.*" %>
    <%@page import="Model.FumettiBean" %>
    <%@page import="Model.FumettiModel" %> 
     <%@page import="Model.GraficheBean" %>
    <%@page import="Model.GraficheModel" %>
    <%@page import="Model.ModelliniBean" %>
    <%@page import="Model.ModelliniModel" %>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<head>

<style>

.listProd li{
 word-break: break-word;
 display:block;
 float:right;
}
</style>

<link rel="stylesheet" href="website.css">

<title>Catalogo</title>
</head>
<body>

	<header>
            <a href="home.html"><img src="Logo con beep beep.png" alt="Logo" id="logo"></a>
    </header>

    <nav id="mainNav">
        <ul id="menuList">
            <li><a href="/fumetti">FUMETTI</a></li>
            <li><a href="/grafiche">GRAFICHE</a></li>
            <li><a href="/modellini">MODELLINI</a></li>
        </ul>
        <ul id="menuList2">
            <li><a href="/carrello"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              </svg></a></li>
            <li><input type="text" placeholder="Cerca" id="search" style="border-radius: 20px;"></li>
            <li><a href="/partnership">PARTNERSHIP</a></li>
            <li><a href="/utente">UTENTE</a></li>
        </ul>
    </nav>

	<h1>CATALOGO NEGOZIO</h1>
	<h2>Fumetti</h2>
	<h3>Manga</h3>
	
	<%
	FumettiModel fmodel = new FumettiModel();
	//String path = .getContextRoot();
	//out.println(path);
	ArrayList<FumettiBean> arrayManga = new ArrayList<FumettiBean>(fmodel.doRetrieveAllManga(null));
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "listProd">
	
		<ul style="list-style-type:none;">
		<% for(FumettiBean fumetto : arrayManga){ 
			String nomeImmagine = fumetto.getTitolo().replace(":", "").replace("/", "");
			long seriale = fumetto.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodotto">
			<li><img src="${pageContext.request.contextPath}/gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=fumetto.getTitolo()%>
			<br>
			Prezzo: <%=fumetto.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
	</div>
	
	<h3>Manhua</h3>
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
			<li><img src="${pageContext.request.contextPath}/gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=fumetto.getTitolo()%><br>
			Prezzo: <%=fumetto.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
		</div>
		
		<h2>Grafiche</h2>
	<h3>D'Opera</h3>
	
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
			<li><img src="${pageContext.request.contextPath}/gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=grafica.getTitolo()%>
			<br>
			Prezzo: <%=grafica.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
	</div>
	
	<h3>Moderne</h3>
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
			<li><img src="${pageContext.request.contextPath}/gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=grafica.getTitolo()%><br>
			Prezzo: <%=grafica.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
		</div>
		
		<h2>Modellini</h2>
	<h3>Funko POP!</h3>
	
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
			<li><img src="${pageContext.request.contextPath}/gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=modellino.getNome()%>
			<br>
			Prezzo: <%=modellino.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
	</div>
	
	<h3>Action Figures</h3>
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
			<li><img src="${pageContext.request.contextPath}/gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=modellino.getNome()%><br>
			Prezzo: <%=modellino.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
		</div>
		
		<footer id="footer">
        <p>
            Lorem ipsum dolor sit amet consectetur, adipisicing elit. Qui eligendi cumque culpa dignissimos eius
            facilis, ab doloremque distinctio voluptatibus, aspernatur necessitatibus quibusdam esse, harum laborum
            architecto. Architecto quis harum suscipit.
            Quo placeat minima qui dolorem expedita nihil ipsam vitae esse necessitatibus porro? Suscipit omnis nihil
            unde sequi error soluta mollitia, laboriosam consequatur quae aliquam tenetur praesentium nulla corporis
            ratione id!
            Voluptates unde deserunt soluta iure deleniti, modi omnis dolorum ex eius, cum amet? Odio modi fugiat dolor
            repellat dolores voluptatibus maiores quis, veritatis nesciunt. Impedit velit sed praesentium alias vitae.
            Magni in doloribus, quidem fuga totam corrupti vel aliquid nobis? Unde ut nobis autem reiciendis est quos
            consectetur excepturi dignissimos impedit nesciunt, ratione atque eveniet mollitia iusto, dolor minima
            ullam!
            Inventore deleniti optio aliquam iusto officia pariatur ad minus! Similique sapiente facere dolor ea nemo
            quasi eos. Vero, consectetur. Laboriosam, tenetur. Dicta dolore eveniet sit explicabo exercitationem
            molestiae harum veritatis!
            Voluptas quisquam earum eaque, ducimus eum placeat ipsum at nobis deserunt quasi incidunt nemo quas
            veritatis est totam doloremque a, necessitatibus quos libero iure, perferendis temporibus quis! Ad, corrupti
            nobis?
            Architecto natus quo perspiciatis nobis rerum id! Porro inventore ullam voluptatum non a nisi, optio
            repellat distinctio facilis cumque vero repellendus veritatis modi veniam eaque. Eligendi, cupiditate.
            Ipsam, quidem deserunt?
            Impedit adipisci autem quos sed alias officiis vero nemo necessitatibus cum animi voluptatem repellendus quo
            sequi voluptas corrupti asperiores nulla, velit possimus eos et ullam facilis mollitia harum. Dolorum,
            minus.
            
        </p>
    </footer>
	
</body>
</html>