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
<head>

<style>

li {
  display:block;
  float:right;
}

.fumetti li{
 word-break: break-word;
}
</style>

<link rel="stylesheet" href="catalogo.css">

<title>Catalogo</title>
</head>
<body>

	<h1>Catalogo negozio</h1>
	<h2>Fumetti</h2>
	<h3>Manga</h3>
	
	<%
	FumettiModel fmodel = new FumettiModel();
	//String path = .getContextRoot();
	//out.println(path);
	ArrayList<FumettiBean> arrayManga = new ArrayList<FumettiBean>(fmodel.doRetrieveAllManga(null));
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "fumetti">
	
		<ul style="list-style-type:none;">
		<% for(FumettiBean fumetto : arrayManga){ 
			String nomeImmagine = fumetto.getTitolo().replace(":", "").replace("/", "");
			long seriale = fumetto.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div>
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
		
		<ul style="list-style-type:none;">
		<% for(FumettiBean fumetto : arrayManhua){ 
			 String nomeImmagine = fumetto.getTitolo().replace(":", "").replace("/", ""); 
			long seriale = fumetto.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div>
			<li><img src="${pageContext.request.contextPath}/gallery/Fumetti/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=fumetto.getTitolo()%><br>
			Prezzo: <%=fumetto.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
		
		<h2>Grafiche</h2>
	<h3>D'Opera</h3>
	
	<%
	GraficheModel gmodel = new GraficheModel();
	//String path = .getContextRoot();
	//out.println(path);
	ArrayList<GraficheBean> arrayOpera = new ArrayList<GraficheBean>(gmodel.doRetrieveAllOpera(null));
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "grafiche">
		<ul style="list-style-type:none;">
		<% for(GraficheBean grafica : arrayOpera){ 
			String nomeImmagine = grafica.getTitolo().replace(":", "").replace("/", "");
			long seriale = grafica.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div>
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
		<ul style="list-style-type:none;">
		<% for(GraficheBean grafica : arrayModerne){ 
			 String nomeImmagine = grafica.getTitolo().replace(":", "").replace("/", "");
			long seriale = grafica.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div>
			<li><img src="${pageContext.request.contextPath}/gallery/Grafiche/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=grafica.getTitolo()%><br>
			Prezzo: <%=grafica.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
		
		<h2>Modellini</h2>
	<h3>Funko POP!</h3>
	
	<%
	ModelliniModel mmodel = new ModelliniModel();
	//String path = .getContextRoot();
	//out.println(path);
	ArrayList<ModelliniBean> arrayFunko = new ArrayList<ModelliniBean>(mmodel.doRetrieveAllFunko(null));
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		%>
	<div class = "modellini">
			
		<ul style="list-style-type:none;">
		<% for(ModelliniBean modellino : arrayFunko){
			String nomeImmagine = modellino.getNome().replace(":", "").replace("/", "");
			long seriale = modellino.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div>
			<li><img src="${pageContext.request.contextPath}/gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=modellino.getNome()%>
			<br>
			Prezzo: <%=modellino.getPrezzo()%>&euro;<br></li>
			<% } %>
			</div></a>
		</ul>
	</div>
	
	<h3>Action Figures</h3>
	<%
	ArrayList<ModelliniBean> arrayFigures = new ArrayList<ModelliniBean>(mmodel.doRetrieveAllFigures(null));
	basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	%>
		<ul style="list-style-type:none;">
		<% for(ModelliniBean modellino : arrayFigures){
			 String nomeImmagine = modellino.getNome().replace(":", "").replace("/", "");
			long seriale = modellino.getSeriale();%>
			<a href="Prodotto.jsp?id=<%=seriale%>"><div>
			<li><img src="${pageContext.request.contextPath}/gallery/Modellini/<%=nomeImmagine%>.jpg" style=width:200px>
			<br>
			<%=modellino.getNome()%><br>
			Prezzo: <%=modellino.getPrezzo()%>&euro;<br></li>
			</div></a>
			<% } %>
		</ul>
	
</body>
</html>