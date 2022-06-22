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

<body>
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

    <div class="topProduct">
        <div class="categoria">
            <h3>Funko Pop! più venduti</h3>
            <div class="mainProduct" >
            	<%
            		ArticoloModel model;
            		Articolo articolo;
            		
            		model = new ModelliniModel();
            		articolo =	new ModelliniBean();
            		
                	String folder = "Modellini";
                	String nomeImmagine = new String();
                	long seriale;
                %>
						<div class = "listProdHome">
	
							<ul style="list-style-type:none;">
							<% 
							articolo = model.doRetrieveByKey(300000000000013L);
							nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							seriale = articolo.getSeriale();
							%>
							<a href="Prodotto.jsp?id=<%=seriale%>">
							<div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							
							</ul>
						</div>
               
                    	<div class = "listProdHome">
	
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(300000000000011L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							
							</ul>
						</div>
					     
                    	<div class = "listProdHome">
	
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(300000000000014L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							
							</ul>
						</div>
                    
                    	<div class = "listProdHome">
	
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(300000000000012L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							
							</ul>
						</div>
                       
                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(300000000000017L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							
							</ul>
						</div>        
            </div>
        </div>

        <div class="categoria">
            <h3>Manga e manhwa più venduti</h3>
            <div class="mainProduct">
            	<%
            		model = new FumettiModel();
            		articolo =	new FumettiBean();
                	folder = "Fumetti";
                	nomeImmagine = new String();               	
                %>
                
                    
                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(100000000000016L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							
							</ul>
						</div>
                       
                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(100000000000006L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>
                              
                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(100000000000012L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>
             
                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(100000000000005L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>
                    
      					<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(100000000000001L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>
       
            </div>
        </div>

        <div class="categoria">
            <h3>Grafiche e poster più venduti</h3>
            <div class="mainProduct">
            <%
					model = new GraficheModel();
            		articolo =	new GraficheBean();
            		
                	folder = "Grafiche";
                	nomeImmagine = new String();
                %>

                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(200000000000005L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>
                       
                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(200000000000008L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>
                       
                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(200000000000018L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>
  
                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(200000000000016L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>

                    	<div class = "listProdHome">
							<ul style="list-style-type:none;">
							<% 
							 articolo = model.doRetrieveByKey(200000000000015L);
							 nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");
							 seriale = articolo.getSeriale();%>
							<a href="Prodotto.jsp?id=<%=seriale%>"><div class="prodottoHome">
							<li><img src="./gallery/<%=folder%>/<%=nomeImmagine%>.jpg" style=width:70%>
							<br>
							<%=articolo.getNome()%>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%><br></li>
							</div></a>
							</ul>
						</div>
            </div>
        </div>
    </div>

    	<jsp:include page="footer.jsp"/>

</body>

</html>