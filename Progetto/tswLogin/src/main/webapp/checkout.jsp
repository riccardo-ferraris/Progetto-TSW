<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Ordine"%>
    <%@page import="Model.UserBean" %>
    <%@page import="Model.ProdottoInCarrello" %>
    <%@page import="java.util.ArrayList"%>
    <%
    UserBean utente = (UserBean) request.getSession().getAttribute("utente");
    
    if(utente.getRuolo() == null)
    {
    	response.sendRedirect("login.jsp");	
    	return;
    }
    
    Ordine checkoutOrdine = ((Ordine) request.getSession().getAttribute("checkoutOrdine"));
    ArrayList<ProdottoInCarrello> array = checkoutOrdine.getArticoliOrdine();
    Double costoSpedizione = 5.00;
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout</title>
</head>
<body>
	<div>
		<h1>Informazioni utente</h1>
		<p><%=utente.getNome() + " " + utente.getCognome() + " (" + utente.getEmail() + ")"%></p>
	</div>
	
	<div>
		<form>
		<!-- Qua bisogna inserire un form tipo quello del checkout di funko. CANCELLA QUESTO COMMENTO DOPO -->
		</form>
	</div>
	
	<div style="width:30%">
		<ul style="list-style-type:none;">
		<%
			for(ProdottoInCarrello prod : array){
			
				 String nomeImmagine = prod.getProdotto().getNome().replace(":", "").replace("/", "");
				long seriale = prod.getProdotto().getSeriale();%>
				<div>
				<li><img src="${pageContext.request.contextPath}/gallery/<%=prod.getProdotto().getMacroCategoria()%>/<%=nomeImmagine%>.jpg" style=width:15%>
				<br>
				<%=prod.getProdotto().getNome()%><br>
				Prezzo: <%out.println(String.format("%.2f&euro;", prod.getProdotto().getPrezzo()));%><br></li>
				</div>
		<%}%>
		<div>
			<p>Subtotale: <%out.println(String.format("%.2f&euro;", checkoutOrdine.getTotale())); %></p>
			<p>Totale: <%out.println(String.format("%.2f&euro;", checkoutOrdine.getTotale() + costoSpedizione)); %></p>
		</div>
		</ul>
	</div>
	<!-- Qua va inserito un tasto per finalizzare l'acquisto e inviare il form -->
	
</body>
</html>