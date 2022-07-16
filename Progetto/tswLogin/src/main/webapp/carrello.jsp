<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% %>
    <%@page import="Util.Carrello"%>
    <%@page import="Model.Articolo"%>
    <%@page import="Model.ArticoloModel"%>
    <%@page import="java.util.ArrayList"%>
     <%@page import="Model.ProdottoInCarrello"%>
     <%@page import="Model.FumettiBean"%>
     <%@page import="Model.UserBean"%>
   <%
   	Carrello carrello = (Carrello) request.getSession().getAttribute("carrello");
   if(carrello == null){
	   carrello = new Carrello();
   }
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
		
 		<div id="carrello">			
			<div class = "listProdCarrello">
				<div  class="titoloCarrello" style="display:flex">
					<p style="width:20%; margin-right:auto">CARRELLO</p>
					<form action="./ServletCarrello?page=carrello.jsp&action=svuotaCarrello" method="POST">
						<button class="svuotaCarrello">Svuota carrello</button>
					</form>
				</div>
				<%
				double totale = 0; //fare in modo che se si incrementa o decrementa il selettore delle quantità, il valore del prodotto venga aggiornato
				for(ProdottoInCarrello prodotto : arrayArticoli){
					Articolo prodottoCarrello = prodotto.getProdotto();
					String nomeImmagine = prodottoCarrello.getNome().replace(":", "").replace("/", "");
					long seriale = prodottoCarrello.getSeriale();%>
					
					<div class="prodottoCarrello">
						<div>
							<a href="Prodotto.jsp?id=<%=seriale%>"><img class="imgCart" src="./gallery/<%=prodottoCarrello.getMacroCategoria()%>/<%=nomeImmagine%>.jpg"></a>
						</div>
						<div>
							<a href="Prodotto.jsp?id=<%=seriale%>" class="prodTitolo" style="text-decoration:none; color:black"><%=prodottoCarrello.getNome()%></a>
						</div>
						<div>
							<p class="prodPrezzo">Prezzo: <%out.println(String.format("%.2f&euro;", prodottoCarrello.getPrezzo()));%></p>
						</div>
						<div>	
							<label class="prodLabel" for="quantità">Quantità:</label>
							<form action="./ServletCarrello?page=carrello.jsp&seriale=<%=prodottoCarrello.getSeriale()%>&action=modificaQuantitativo" method="post">
								<input type="number" name="numModifica" id="quantità" min="1" max="<%=prodottoCarrello.getQuantità()%>" value=<%=prodotto.getQuantity()%> onchange="this.form.submit()"></input>
							</form>
							
							<% totale+= prodottoCarrello.getPrezzo()*prodotto.getQuantity(); %>
						</div> 
						<form id="rimuoviProd" action="./ServletCarrello?page=carrello.jsp&seriale=<%=prodottoCarrello.getSeriale()%>&action=rimuoviBySeriale" method="POST">
							<div>
								<button class="rimuoviProdottoCarrello"> 
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"  class="bi bi-trash-fill" viewBox="0 0 16 16">
  								<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
								</svg></button>
							</div>
						</form>
					</div>
				<% } %>
				</ul>
			</div>
			<div class = "controlliCarrello"">				
				<p style="font-size:1.3em; text-align:center">Totale: <%out.println(String.format("%.2f&euro;", totale));%> </p>
		 		<%
		 		if(!carrello.getProdotti().isEmpty()){ 
		 		%>
		 		  <%
		 		  request.getSession().setAttribute("carrello", carrello); 
		 		  request.getSession().setAttribute("totale", totale);	 			
		 		  %>
		 			<form action="./CheckoutServlet" method="post">
            		<button type="submit" class="btnCheckout" name="prodCarrello">Procedi all'acquisto</button>
            		</form>
		 	<% } %>
		 		
		 		
			</div>
		</div>	
			
	<jsp:include page="footer.jsp"/>
</body>
</html>