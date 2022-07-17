<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="Model.FumettiBean" %>
    <%@page import="Model.FumettiModel" %> 
     <%@page import="Model.GraficheBean" %>
    <%@page import="Model.GraficheModel" %>
    <%@page import="Model.ModelliniBean" %>
    <%@page import="Model.ModelliniModel" %>
    <%@page import="Model.Articolo" %>
    <%@page import="Model.ArticoloModel" %>
    <%@page import="Model.UserBean" %>
    <%@page import="java.util.List" %>
    <%@page import="java.util.LinkedList" %>
    
<!DOCTYPE html>
<html>


   

<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<%
UserBean utente = (UserBean) request.getSession().getAttribute("utente");
String seriale = request.getParameter("id");
if(utente == null){
	request.getSession().setAttribute("ruolo", "guest");
	response.sendRedirect("Prodotto.jsp?id="+seriale);
	return;
	}
if(!utente.getRuolo().equals("admin"))
{
	//out.println(utente);
	response.sendRedirect("Prodotto.jsp?id="+seriale);
	return;
}




char firstChar = seriale.charAt(0);
int firstDigit = Integer.parseInt("" + firstChar);
ArticoloModel articoloModel = null;
Articolo articolo = null;
String nomeImmagine = new String();

switch(firstDigit){
	case 1: articoloModel = new FumettiModel();
	articolo = new FumettiBean();
	articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));%>
		
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
			<jsp:include page="header.jsp"/>
			<jsp:include page="PopupAcquisto.html"/>
		<% 
			if(request.getSession().getAttribute("ruolo").equals("guest")){%>
				<jsp:include page="navbarUnlogged.jsp"/>
			<%}else{ %>
				<jsp:include page="navbarLogged.jsp"/>
			<% } %>
		
		<div style="display:flex; width:100%; align-items:center">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");%>
			
			<div class="imgProdotto">
				<img id="imgProdotto" src="./gallery/Fumetti/<%=nomeImmagine%>.jpg" style="width:50%; margin:10% 25%">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p id="nomeProdotto"> <%out.println(articolo.getNome());%> </p>
					<div>
						<button id="modificaProdotto"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16"> <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/></svg></button>
					</div>
				</div>
				<div style="font-size:1.5em">
					<p id="catProdotto"> <%out.println(((FumettiBean)articolo).getCategoria());%> </p>
					
				</div>
				<div style="font-size:1.5em">
					<p id="prezzoProdotto"> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
					
				</div>
				<div style="font-size:1em">
					<p id="descrizioneProdotto"> <%out.println(articolo.getDescrizione());%> </p>
					
				</div>
			</div>	
		</div>	
			
		<%
		break;
		
	case 2: articoloModel = new GraficheModel();
		articolo = new GraficheBean();
		articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));%>
		
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
		<jsp:include page="header.jsp"/>
		<% 
			if(request.getSession().getAttribute("ruolo").equals("guest")){%>
				<jsp:include page="navbarUnlogged.jsp"/>
			<%}else{ %>
				<jsp:include page="navbarLogged.jsp"/>
			<% } %>
		
		<div style="display:flex">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img id="imgProdotto" src="./gallery/Grafiche/<%=nomeImmagine%>.jpg" style="width:60%; margin:10%">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p id="nomeProdotto"> <%out.println(articolo.getNome());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p id="catProdotto"> <%out.println(((GraficheBean)articolo).getCategoria());%> </p>		
				</div>
				<div style="font-size:1.5em">
					<p id="prezzoProdotto"> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
				</div>
				<div style="font-size:1em">
					<p id="descrizioneProdotto"> <%out.println(articolo.getDescrizione());%> </p>
				</div>
			</div>
		</div>
		<%
		break;
	
	case 3: articoloModel = new ModelliniModel();
		articolo = new ModelliniBean();
		articolo = articoloModel.doRetrieveByKey(Long.parseLong(seriale));
		%>
		
		<title><%=articolo.getNome()%></title>
		</head>
		<body>
		<jsp:include page="header.jsp"/>
		<% 
			if(request.getSession().getAttribute("ruolo").equals("guest")){%>
				<jsp:include page="navbarUnlogged.jsp"/>
			<%}else{ %>
				<jsp:include page="navbarLogged.jsp"/>
			<% } %>
    	
    	<div style="display:flex">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img id="imgProdotto" src="./gallery/Modellini/<%=nomeImmagine%>.jpg" style="width:60%; margin:10%">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p id="nomeProdotto"> <%out.println(articolo.getNome());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p id="catProdotto"> <%out.println(((ModelliniBean)articolo).getCategoria());%> </p>				
				</div>
				<div style="font-size:1.5em">
					<p id="prezzoProdotto"> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
				</div>
				<div style="font-size:1em">
					<p id="descrizioneProdotto"> <%out.println(articolo.getDescrizione());%> </p>
				</div>
			</div>
		</div>

		<%
		break;
		
	default: out.println("404 Error");
		break;	
}

		if(articolo.getQuantità()>0)
        {
         %>
         <div class="aggiungiCarrello">
         	<label for="quantità"> Quantità: </label>
         	<form id="formAggiungiCarrello_<%=articolo.getSeriale()+"_"+articolo.getMacroCategoria()%>" class="formAggiungiCarrello" method="get">
         		<input type="number" value="1" min="1" max="<%=articolo.getQuantità()%>" name="numAggiungi" id="quantità"/>
         		<button type="submit" class="cartButton">
                	Aggiungi al carrello
                </button>
            </form>
         </div>
       <% }else{%>
    	<p>Prodotto non disponibile</p>   
       <%}%>
       <br>
        <jsp:include page="footer.jsp"/>
        
        <script>
        
			$('.formAggiungiCarrello').on('submit', function (e) {
			e.preventDefault();
			var idProd = this.id;
	    	console.log(idProd);

	    	const parametersArray = idProd.split("_");
	    	console.log(parametersArray);
	    	
          	$.ajax({
        	  type: "GET",
              url:"ServletCarrello?page=Prodotto.jsp&seriale="+parametersArray[1]+"&macroCategoria="+parametersArray[2]+"&action=aggiungi",
              cache: false,
              data: $('#formAggiungiCarrello_'+parametersArray[1]+'_'+parametersArray[2]).serialize(),
              success: function (data) {
            	  console.log("added product with no errors");
 
            	  $("#aggProdMex").css('display','block').removeClass('hidden');
            	  setTimeout(function (){
            		  $("#aggProdMex").addClass('hidden')
            		}, 1000);
              },
              error: function(){
                 alert("error");
              } 
         });
     });
			
			function strcmp(a, b)
			{   
			    return (a<b?-1:(a>b?1:0));  
			}
   </script>
   
   <script>
   $(document).ready ( function () {
	   $(document).on('click', '#modificaProdotto' , function(e){
		   event.stopPropagation();
		    event.stopImmediatePropagation();
		   
		    var nomeProdotto = document.getElementById('nomeProdotto');
		    var imgProdotto = document.getElementById('imgProdotto');
		    var catProdotto = document.getElementById('catProdotto');
		    var prezzoProdotto = document.getElementById('prezzoProdotto');
		    var descrizioneProdotto = document.getElementById('descrizioneProdotto');
		    
			let tempTextNome = nomeProdotto.textContent;
			let tempImg = nomeProdotto.src;
			let tempTextCat = catProdotto.textContent
			let tempTextPrezzo = prezzoProdotto.textContent
			let tempTextDescrizione = descrizioneProdotto.textContent
			
			const textareaNome = Object.assign(document.createElement('textarea'));
			//const textareaImg = Object.assign(document.createElement('textarea'));
			const textareaCat = Object.assign(document.createElement('textarea'));
			const textareaPrezzo = Object.assign(document.createElement('textarea'));
			const textareaDescrizione = Object.assign(document.createElement('textarea'));
			
			nomeProdotto.replaceWith(textareaNome);
			textareaNome.textContent = tempTextNome;
			
			catProdotto.replaceWith(textareaCat);
			textareaCat.textContent = tempTextCat;
			
			prezzoProdotto.replaceWith(textareaPrezzo);
			textareaPrezzo.textContent = tempTextPrezzo;
			
			descrizioneProdotto.replaceWith(textareaDescrizione);
			textareaDescrizione.textContent = tempTextDescrizione;
			
			//imgProdotto.replaceWith(textareaNome);
			
			textarea.setAttribute('cols', '85%');
			textarea.setAttribute('class', 'textareaModify');
			textarea.setAttribute('minlength', '50');
			textarea.setAttribute('maxlength', '5000');
			
			const inviaButton = Object.assign(document.createElement('button'));
			inviaButton.setAttribute('type', 'button');
			inviaButton.setAttribute('id', 'inviaRecensioneAggiornata');
			inviaButton.innerHTML = "Invia";
			
			document.getElementById('recensioneUtenteContainer').append(inviaButton)
			
			var modificaRecensione = {
					testo: textarea.textContent,
					punteggio: clickStars()
			};
			
			$('#inviaRecensioneAggiornata').on('click', function(e){
				console.log(textarea.value);
		      $.ajax({
		    	  type: "POST",
		          url:"ModificaRecensione",
		          data: {punti: clickStars(), testoRecensione: textarea.value, username: utente.username, seriale: '<%=seriale%>', categoria: '<%=articolo.getMacroCategoria()%>'},
		          cache: false,
		          success: function (data) {
		             if(data == 'True'){
		            	 console.log('Recensione updated');
		            	 location.reload();
		             }else{ 
		                 console.log('Errore!');
		             }
		          }
	         });
	   		});
		    
   });
   </script>
   
</body>
</html>
</body>
</html>