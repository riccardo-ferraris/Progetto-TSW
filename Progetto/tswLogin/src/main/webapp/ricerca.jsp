<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <%@page import="Model.ArticoloModel" %>
    <%@page import="Model.Articolo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<title>Insert title here</title>
</head>
<body>
	<%
		@SuppressWarnings("unchecked")
	 	ArrayList<Articolo> risultatiRicerca = ((ArrayList<Articolo>) request.getSession().getAttribute("searchedItems"));
		//out.println(risultatiRicerca.toString()); 
		String keyWord = String.valueOf(request.getSession().getAttribute("keyWord"));
	%>
    <jsp:include page="header.jsp"/>

    <nav id="mainNav">	
            	<form action="./RedirectServlet?page=catalogo" method="POST">
        			<ul id="menuList">	
        	    		<li><button class="catalogoBtn">CATALOGO</button></li>
        			</ul>
        		</form>
        	<ul id="menuList2">
            	<li><a href="./carrello.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                	<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              	</svg></a></li>
            	<li><input type="text" placeholder="Cerca" id="search" style="border-radius: 20px;"></li>
            	<li><a href="/partnership">PARTNERSHIP</a></li>
            	<li><a href="login.jsp">LOGIN</a></li>
            	<li><a href="register.jsp">REGISTRATI</a></li>
        	</ul>
    	</nav>
    
            <h3>Risultati ricerca: "<%=keyWord%>"</h3>
            <div class="listProd">
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
							<br>
							<%=articolo.getNome()%>
							<br>
							<%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							
							</ul>
						</div>
            		<% } %>    
         </div>
    	<jsp:include page="footer.jsp"/>


</body>
</html>