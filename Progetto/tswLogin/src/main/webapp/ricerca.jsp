<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="Model.ArticoloModel" %>
    <%@page import="Model.Articolo" %>
    <%@page import="Model.UserBean" %>
    <%@ page errorPage="ErrorPage.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<title>Ricerca prodotto</title>
</head>
	<body>
		<%
			@SuppressWarnings("unchecked")
		 	ArrayList<Articolo> risultatiRicerca = ((ArrayList<Articolo>) request.getSession().getAttribute("searchedItems"));
			String keyWord = String.valueOf(request.getSession().getAttribute("keyWord"));
		%>
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
	    
	            <h3 style="margin:3% 0 0 3%">Risultati ricerca: "<%=keyWord%>"</h3>
	            <div class="listProd" style="display:flex; flex-wrap:wrap">
	            	<%
	            		String folder = new String();
	            		String nomeImmagine = new String();
	            		long seriale;
	            		for(Articolo articolo : risultatiRicerca){
	            			//articolo = model.doRetrieveByKeyWord(keyWord);
							nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							seriale = articolo.getSeriale();
							folder = articolo.getMacroCategoria();	
							%>
	            			<div class = "listProdHome">
								<ul style="list-style-type:none;">
								
								<a href="Prodotto.jsp?id=<%=seriale%>">
								<div class="prodottoHome">
								<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
								<br><br>
								<p><%=articolo.getNome()%></p>
								
								<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
								</a>
								<div class="aggiungiCarrelloProd">
									<button class="piu" style="color:white">Aggiungi al carrello</button>
								</div>
								</div>					
								</ul>
							</div>
	            		<% } %>    
	         </div>
	    	<jsp:include page="footer.jsp"/>
	</body>
</html>