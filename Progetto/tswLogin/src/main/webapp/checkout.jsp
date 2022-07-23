<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Model.Ordine"%>
    <%@page import="Model.UserBean" %>
    <%@page import="Model.FumettiBean" %>
    <%@page import="Model.GraficheBean" %>
    <%@page import="Model.ModelliniBean" %>
    <%@page import="Model.ProdottoInCarrello" %>
    <%@page import="java.util.ArrayList"%>
    <%@ page errorPage="ErrorPage.jsp" %>
    <%
    UserBean utente = (UserBean) request.getSession().getAttribute("utente");
    
    if(utente == null || utente.getRuolo() == null)
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
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<title>Checkout</title>
</head>
<body>
	<jsp:include page="header.jsp"/>

<div class="container">
<form action="./FinalizzaAcquistoServlet" id="formAcquisto" class="needs-validation" novalidate="" method="post">
    <div class="py-5 text-center">
        <h2>Checkout</h2>
    </div>
    <div class="row">
        
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Il tuo carrello</span>
                <span class="badge badge-secondary badge-pill">3</span>
            </h4>
            <ul class="list-group mb-3 sticky-top" style="position:sticky; top:20%">
                <%
                double iva = 0;
			for(ProdottoInCarrello prod : array){ //scorriamo il carrello passato al checkout
			
				 String nomeImmagine = prod.getProdotto().getNome().replace(":", "").replace("/", ""); //questa funzione elimina i caratteri proibiti per il salvataggio di un file
				
				 long seriale = prod.getProdotto().getSeriale();
				
				 String catProd = new String();
				 switch(prod.getProdotto().getMacroCategoria()){ //con uno switch controlliamo la macrocategoria dell'articolo corrente
				 case "Fumetti": catProd = ((FumettiBean) prod.getProdotto()).getCategoria(); //se il prodotto appartiene alla macrocategoria Fumetti, ne prendiamo la sottocategoria e la inseriamo in catProd
					 break;
					
				 case "Grafiche": catProd = ((GraficheBean) prod.getProdotto()).getCategoria(); //se il prodotto appartiene alla macrocategoria Fumetti, ne prendiamo la sottocategoria e la inseriamo in catProd
				 break;
				
				 case "Modellini": catProd = ((ModelliniBean) prod.getProdotto()).getCategoria(); //se il prodotto appartiene alla macrocategoria Fumetti, ne prendiamo la sottocategoria e la inseriamo in catProd
				 break;
				 }
				 
				 iva += prod.getProdotto().getPrezzo() - ((prod.getProdotto().getPrezzo() / (100 + prod.getProdotto().getIva()) ) * 100);
				%>
				<li class="list-group-item d-flex justify-content-between lh-condensed">
                    <div style="display:flex">
                    	<div style="width:20%">
                    		<img src="./gallery/<%=prod.getProdotto().getMacroCategoria()%>/<%=nomeImmagine%>.jpg" style=width:60%>
                        </div>
                        <div>	
                        	<h6 class="my-0"><%=prod.getQuantity() + "x " + prod.getProdotto().getNome()%></h6>
                        	<small class="text-muted"><%=catProd%></small>
                    	</div>
                    </div>
                    <span class="text-muted"><%out.println(String.format("%.2f&euro;", prod.getProdotto().getPrezzo()));%></span>
                </li>			
			<%}%>
    
                

                <li class="list-group-item d-flex justify-content-between">
                    <span>IVA (EUR)</span>
                    <strong><%out.println(String.format("%.2f&euro;", iva)); %></strong>
                </li>
                
                <li class="list-group-item d-flex justify-content-between">
                    <span>Subtotale IVA inclusa (EUR)</span>
                    <strong><%out.println(String.format("%.2f&euro;", checkoutOrdine.getTotale())); %></strong>
                </li>
                
                <li class="list-group-item d-flex justify-content-between">
                    <span>Spedizione (EUR)</span>
                    <strong><%out.println("5&euro;"); %></strong>
                </li>
                <li class="list-group-item d-flex justify-content-between" style="background-color:#e3f7fa">
                    <span>Totale (EUR)</span>
                    <strong><%out.println(String.format("%.2f&euro;", checkoutOrdine.getTotale() + costoSpedizione)); %></strong>
                    <%checkoutOrdine.setTotale(checkoutOrdine.getTotale() + costoSpedizione); %>
                </li>
                <button class="btn btn-primary btn-lg btn-block" type="submit" style="background-color:#2d3b55; width:50%; margin-top:5%; font-size:1.2em">Acquista ora</button>
            </ul>
        </div>
        <div class="col-md-8 order-md-1">
         <div class="mb-3">
         	<h4 class="mb-3">Riepilogo utente</h4>
            	<label for="username">Username</label>
                <div class="input-group">
                	<div class="input-group-prepend">
                    	<span class="input-group-text">@</span>
                    </div>
                    <input type="text" class="form-control" id="username" value=<%=utente.getUsername() %> disabled>
                    <div class="invalid-feedback" style="width: 100%;">Inserisci un username valido.</div>
                </div>
         </div>
         <div class="mb-3">
         	<label for="email">Email</label>
            <input type="email" class="form-control" id="email" value=<%=utente.getEmail()%> disabled>
             <div class="invalid-feedback">Inserisci un indirizzo email valido.</div>
         </div>
         <hr class="mb-4">
         <h4 class="mb-3">Indirizzo di spedizione</h4>
         
         	<div class="row">
            	<div class="col-md-6 mb-3">
                	<label for="firstName">Nome</label>
                <input type="text" class="form-control" id="firstNameS" name="nomeS" placeholder="" value="" required="">
                	<div class="invalid-feedback">Inserisci un nome valido.</div>
                </div>
                <div class="col-md-6 mb-3">
                	<label for="lastName">Cognome</label>
                	<input type="text" class="form-control" id="lastNameS" name="cognomeS" placeholder="" value="" required="">
                    <div class="invalid-feedback">Inserisci un cognome valido.</div>
               </div>
            </div>
               
            <div class="mb-3">
            	<label for="address">Indirizzo</label>
                <input type="text" class="form-control" id="addressS" name="indirizzoS" placeholder="Via Roma 111" required="">
                <div class="invalid-feedback">Inserisci un indirizzo valido.</div>
            </div>
                
            <div class="row">
            	<div class="col-md-5 mb-3">
                	<label for="country">Stato</label>
                    <select class="custom-select d-block w-100" id="countryS" name="statoS" required="">
                    	<option value="">Scegli...</option>
                        <option>Italia</option>
                    </select>
                    <div class="invalid-feedback"> Seleziona uno stato valido.</div>
                </div>
                <div class="col-md-4 mb-3">
                	<label for="state">Città </label>
                    	<select class="custom-select d-block w-100" id="cityS" name="cityS" required="">
                            <option value="">Scegli...</option>
                            <option>Roma</option>
                            <option>Milano</option>
                            <option>Napoli</option>
                            <option>Palermo</option>
                            <option>Torino</option>
                            <option>Bologna</option>
                        </select>
                        <div class="invalid-feedback">Seleziona una città valida</div>
                </div>
                <div class="col-md-3 mb-3">
                	<label for="zip">CAP</label>
                    <input type="text" class="form-control" id="capS" name="capS" placeholder="" required="">
                    <div class="invalid-feedback">CAP obbligatorio</div>
                </div>
             </div>
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="checkboxAddress" onclick="sameAddress(this)">
                    <label class="custom-control-label" for="same-address">L'indirizzo di fatturazione è lo stesso dell'indirizzo di spedizione.</label>
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
                        <input type="date" class="form-control" id="cc-expiration" placeholder="" required="">
                        <div class="invalid-feedback"> Data di scadenza obbligatoria</div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="cc-cvv">CVV</label>
                        <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                        <div class="invalid-feedback"> CVV obbligatorio</div>
                    </div>
                </div>
            <hr class="mb-4">
            <h4 class="mb-3">Indirizzo di Fatturazione</h4>    
            <div class="row">
            	<div class="col-md-6 mb-3">
                	<label for="firstName">Nome</label>
                <input type="text" class="form-control" id="firstNameF" name="nomeF" placeholder="" value="" required="">
                	<div class="invalid-feedback">Inserisci un nome valido.</div>
                </div>
                <div class="col-md-6 mb-3">
                	<label for="lastName">Cognome</label>
                	<input type="text" class="form-control" id="lastNameF" name="cognomeF" placeholder="" value="" required="">
                    <div class="invalid-feedback">Inserisci un cognome valido.</div>
               </div>
            </div>
               
            <div class="mb-3">
            	<label for="address">Indirizzo</label>
                <input type="text" class="form-control" id="addressF" name="indirizzoF" placeholder="Via Roma 111" required="">
                <div class="invalid-feedback">Inserisci un indirizzo valido.</div>
            </div>
                
            <div class="row">
            	<div class="col-md-5 mb-3">
                	<label for="country">Stato</label>
                    <select class="custom-select d-block w-100" id="countryF" name="statoF" required="">
                    	<option value="">Scegli...</option>
                        <option>Italia</option>
                    </select>
                    <div class="invalid-feedback"> Seleziona uno stato valido.</div>
                </div>
                <div class="col-md-4 mb-3">
                	<label for="state">Città </label>
                    	<select class="custom-select d-block w-100" id="cityF" name="cityF" required="">
                            <option value="">Scegli...</option>
                            <option>Roma</option>
                            <option>Milano</option>
                            <option>Napoli</option>
                            <option>Palermo</option>
                            <option>Torino</option>
                            <option>Bologna</option>
                        </select>
                        <div class="invalid-feedback">Seleziona una città  valida</div>
                </div>
                <div class="col-md-3 mb-3">
                	<label for="zip">CAP</label>
                    <input type="text" class="form-control" id="capF" name="capF" placeholder="" required="">
                    <div class="invalid-feedback">CAP obbligatorio</div>
                </div>
             </div>                   
            </form>
        </div>
    </div>
</div>

<script>
(function () {
	  'use strict'

	  window.addEventListener('load', function () {
	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
	    var forms = document.getElementsByClassName('needs-validation')

	    // Loop over them and prevent submission
	    Array.prototype.filter.call(forms, function (form) {
	      form.addEventListener('submit', function (event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault()
	          event.stopPropagation()
	        }
	        form.classList.add('was-validated')
	      }, false)
	    })
	  }, false)
	}())
	
	function sameAddress(checkboxAddress){
		if ($(checkboxAddress).is(':checked')) {
			const nomeS = document.getElementById('firstNameS');
			const nomeF = document.getElementById('firstNameF');
		
			const cognomeS = document.getElementById('lastNameS');
			const cognomeF = document.getElementById('lastNameF');
		
			const indirizzoS = document.getElementById('addressS');
			const indirizzoF = document.getElementById('addressF');
		
			const statoS = document.getElementById('countryS');
			const statoF = document.getElementById('countryF');
		
			const cityS = document.getElementById('cityS');
			const cityF = document.getElementById('cityF');
		
			const capS = document.getElementById('capS');
			const capF = document.getElementById('capF');
			
			nomeF.value = nomeS.value;
			cognomeF.value = cognomeS.value;
			indirizzoF.value = indirizzoS.value;
			statoF.value = statoS.value;
			cityF.value = cityS.value;
			capF.value = capS.value;
		}
	}
</script>
	
  <script>
  $(document).ready ( function () {

  var tomorrow = new Date(new Date().setDate(new Date().getDate() + 1));

  minDate = tomorrow.toISOString().substring(0,10);

	$('#cc-expiration').prop('min', minDate);
  });
  </script>
	
</body>
</html>