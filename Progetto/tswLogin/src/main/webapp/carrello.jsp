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
<title>Carrello</title>
</head>
<body>
		<div id="carrello">	
		
			<div class = "listProdCarrello">
				<ul style="list-style-type:none;">
			<% 
				double totale = 0; //fare in modo che se si incrementa o decrementa il selettore delle quantità, il valore del prodotto venga aggiornato
				for(ProdottoInCarrello prodotto : arrayArticoli){
					Articolo prodottoCarrello = prodotto.getProdotto();
					String nomeImmagine = prodottoCarrello.getNome().replace(":", "").replace("/", "");
					long seriale = prodottoCarrello.getSeriale();%>
					
					<div class="prodottoCarrello">
						<li><a href="Prodotto.jsp?id=<%=seriale%>"><img src="${pageContext.request.contextPath}/gallery/<%=prodottoCarrello.getMacroCategoria()%>/<%=nomeImmagine%>.jpg" style=width:100%></a>
						<br>
						<div><a href="Prodotto.jsp?id=<%=seriale%>"><%=prodottoCarrello.getNome()%></a>
							<br>
							Prezzo: <%out.println(String.format("%.2f&euro;", prodottoCarrello.getPrezzo()));%><br>
							<label for="quantità">Quantità:</label>
							<form action="./ServletCarrello?page=/carrello.jsp&seriale=<%=prodottoCarrello.getSeriale()%>&action=modificaQuantitativo" method="post">
								<input type="number" name="quantità" min="1" value=<%=prodotto.getQuantità()%> onchange="this.form.submit()"></input>
							</form>
							
							<% totale+= prodottoCarrello.getPrezzo()*prodotto.getQuantità(); %>
						</div></li>
				</div>
			<% } %>
		</ul>
	</div>
		<div class = "controlliCarrello">
			Totale: <%out.println(String.format("%.2f&euro;", totale));%><br>
		 	<form action="./checkout.jsp<%%>" method="post">
            	<button type="submit" class="btn btn-primary">Procedi all'acquisto</button>
            </form>
		</div>
	</div>	
			
</body>
</html>