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
	<link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<title>Checkout</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<nav id="mainNav">
        		<ul id="menuList">
        	    	<li><a href="./RedirectServlet?page=catalogo">CATALOGO</a></li>
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



<div class="container">
    <div class="py-5 text-center">
        <h2>Checkout</h2>
    </div>
    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Il tuo carrello</span>
                <span class="badge badge-secondary badge-pill">3</span>
            </h4>
            <ul class="list-group mb-3 sticky-top" style="position:sticky; top:10%">
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Nome prodotto 1</h6>
                        <small class="text-muted">Categoria</small>
                    </div>
                    <span class="text-muted">€</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Nome prodotto 2</h6>
                        <small class="text-muted">Categoria</small>
                    </div>
                    <span class="text-muted">€</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div>
                        <h6 class="my-0">Nome prodotto 3</h6>
                        <small class="text-muted">Categoria</small>
                    </div>
                    <span class="text-muted">€</span>
                </li>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Subtotale (EUR)</span>
                    <strong><%out.println(String.format("%.2f&euro;", checkoutOrdine.getTotale())); %></strong>
                </li>
                <li class="list-group-item d-flex justify-content-between" style="background-color:#e3f7fa">
                    <span>Totale (EUR)</span>
                    <strong><%out.println(String.format("%.2f&euro;", checkoutOrdine.getTotale() + costoSpedizione)); %></strong>
                </li>
            </ul>
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Indirizzo di fatturazione</h4>
            <form class="needs-validation" novalidate="">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">Nome</label>
                        <input type="text" class="form-control" id="firstName" placeholder="" value="" required="">
                        <div class="invalid-feedback">Inserisci un nome valido.</div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Cognome</label>
                        <input type="text" class="form-control" id="lastName" placeholder="" value="" required="">
                        <div class="invalid-feedback">Inserisci un cognome valido.</div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="username">Username</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" id="username" placeholder="Username" required="">
                        <div class="invalid-feedback" style="width: 100%;">Inserisci un username valido.</div>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="email">Email <span class="text-muted">(Opzionale)</span></label>
                    <input type="email" class="form-control" id="email" placeholder="qwerty@esempio.com">
                    <div class="invalid-feedback">Inserisci un indirizzo email valido.</div>
                </div>
                <div class="mb-3">
                    <label for="address">Indirizzo</label>
                    <input type="text" class="form-control" id="address" placeholder="Via Roma 111" required="">
                    <div class="invalid-feedback">Inserisci un indirizzo valido.</div>
                </div>
                
                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="country">Stato</label>
                        <select class="custom-select d-block w-100" id="country" required="">
                            <option value="">Scegli...</option>
                            <option>Italia</option>
                        </select>
                        <div class="invalid-feedback"> Seleziona uno stato valido.</div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="state">Città</label>
                        <select class="custom-select d-block w-100" id="state" required="">
                            <option value="">Scegli...</option>
                            <option>Roma</option>
                            <option>Milano</option>
                            <option>Napoli</option>
                            <option>Palermo</option>
                            <option>Torino</option>
                            <option>Bologna</option>
                        </select>
                        <div class="invalid-feedback">Seleziona una città valida</div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="zip">CAP</label>
                        <input type="text" class="form-control" id="CAP" placeholder="" required="">
                        <div class="invalid-feedback">CAP obbligatorio</div>
                    </div>
                </div>
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="same-address">
                    <label class="custom-control-label" for="same-address">L'indirizzo di spedizione è lo stesso dell'indirizzo di fatturazione.</label>
                </div>                
                <hr class="mb-4">
                <h4 class="mb-3">Pagamento</h4>
                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
                        <label class="custom-control-label" for="credit">Carta di credito</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                        <label class="custom-control-label" for="debit">Carta di debito</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
                        <label class="custom-control-label" for="paypal">PayPal</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cc-name">Nome intestatario carta</label>
                        <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                        <small class="text-muted">Nome completo come riportato sulla carta</small>
                        <div class="invalid-feedback"> Nome intestatario obbligatorio </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cc-number">Numero carta di credito</label>
                        <input type="text" class="form-control" id="cc-number" placeholder="" required="">
                        <div class="invalid-feedback"> Il numero della carta di credito è obbligatorio</div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="cc-expiration">Data di scadenza</label>
                        <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                        <div class="invalid-feedback"> Data di scadenza obbligatoria</div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="cc-cvv">CVV</label>
                        <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                        <div class="invalid-feedback"> CVV obbligatorio</div>
                    </div>
                </div>
                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit" style="background-color:#2d3b55">Vai al checkout</button>
            </form>
        </div>
    </div>
</div>




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
		</ul>
	</div>
	<!-- Qua va inserito un tasto per finalizzare l'acquisto e inviare il form -->
	
    <jsp:include page="footer.jsp"/>
	
	
</body>
</html>