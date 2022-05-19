<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% %>
    <%@page import="Util.Carrello"%>
    <%@page import="Model.Articolo"%>
    <%@page import="Model.ArticoloModel"%>
    <%@page import="java.util.ArrayList"%>
     <%@page import="Model.ProdottoInCarrello"%>
     <%@page import="Model.FumettiBean"%>
     
   <%
   	Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
   ArrayList<ProdottoInCarrello> arrayArticoli = carrello.getProdotti();
   %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="website.css">
	<link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

	<title>Carrello</title>
</head>
<body>

		    <jsp:include page="header.jsp"/>
		    
		    <nav id="mainNav">
        		<ul id="menuList">
        	    	<li><a href="./Catalogo.jsp">CATALOGO</a></li>
        		</ul>
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
    		
 		<div id="carrello" style="display:flex; width:100%">			
			<div class = "listProdCarrello">
			<p class="titoloCarrello">CARRELLO</p>
				<!-- <ul style="list-style-type:none;">  -->
				<%
				double totale = 0; //fare in modo che se si incrementa o decrementa il selettore delle quantità, il valore del prodotto venga aggiornato
				for(ProdottoInCarrello prodotto : arrayArticoli){
					Articolo prodottoCarrello = prodotto.getProdotto();
					String nomeImmagine = prodottoCarrello.getNome().replace(":", "").replace("/", "");
					long seriale = prodottoCarrello.getSeriale();%>
					
					<div class="prodottoCarrello">
						<div>
							<a href="Prodotto.jsp?id=<%=seriale%>"><img src="${pageContext.request.contextPath}/gallery/<%=prodottoCarrello.getMacroCategoria()%>/<%=nomeImmagine%>.jpg" style="width:50%"></a>
						</div>
						<div>
							<a href="Prodotto.jsp?id=<%=seriale%>" style="text-decoration:none; color:black"><%=prodottoCarrello.getNome()%></a>
						</div>
						<div>
							Prezzo: <%out.println(String.format("%.2f&euro;", prodottoCarrello.getPrezzo()));%>
						</div>
						<div>	
							<label for="quantità">Quantità:</label>
							<form action="./ServletCarrello?page=/carrello.jsp&seriale=<%=prodottoCarrello.getSeriale()%>&action=modificaQuantitativo" method="post">
								<input type="number" name="quantità" id="quantità" min="1" value=<%=prodotto.getQuantità()%> onchange="this.form.submit()"></input>
							</form>
							
							<% totale+= prodottoCarrello.getPrezzo()*prodotto.getQuantità(); %>
						</div> 
						<div>
							<a href="./ServletCarrello?page=/carrello.jsp&seriale=<%=prodottoCarrello.getSeriale()%>&action=rimuoviBySeriale&macroCategoria=<%=prodottoCarrello.getMacroCategoria()%>" method="post">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"  class="bi bi-trash-fill" viewBox="0 0 16 16">
  							<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
							</svg></a>
						</div>
					</div>
				<% } %>
				</ul>
			</div>
			<div class = "controlliCarrello" style="position:sticky; top: 10%;">
				<p style="font-size:1.7em; font-weight:bold; text-decoration: underline; text-align:center">CHECKOUT</p>
				<p style="font-size:1.3em; text-align:center">Totale: <%out.println(String.format("%.2f&euro;", totale));%> </p>
		 		<form action="./checkout.jsp<%%>" method="post">
            		<button type="submit" class="btnCheckout">Procedi all'acquisto</button>
            	</form>
			</div>
		</div>	
			
	<jsp:include page="footer.jsp"/>
</body>
</html>