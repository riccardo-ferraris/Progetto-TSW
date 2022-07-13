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
    <%@page import="Model.RecensioneModel" %>
    <%@page import="Model.RecensioneBean" %>
    <%@page import="Model.UserBean" %>
    <%@page import="java.util.List" %>
    <%@page import="java.util.LinkedList" %>
    <%@page import="java.util.ArrayList" %>
    <%@page import="org.json.JSONObject" %>
    <%@page import="com.google.gson.JsonElement"%>
    
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<%
UserBean utente = (UserBean) request.getSession().getAttribute("utente");
if(utente == null){
	request.getSession().setAttribute("ruolo", "guest");
	}

JsonElement utenteJson = null;
if(utente != null){
	utenteJson = utente.toJson();
}


String seriale = request.getParameter("id");
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
		
		
		<div class="divProdIntero">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");%>
			
			<div class="imgProdotto">
				<img class="immagineProd" src="./gallery/Fumetti/<%=nomeImmagine%>.jpg">
			</div>
			<div class="caratteristicheProd">
				<div class="caratTitolo">
					<p> <%out.println(articolo.getNome());%> </p>
				</div>
				<div class="caratCateg">
					<p> <%out.println(((FumettiBean)articolo).getCategoria());%> </p>
				</div>
				<div class="caratPrezzo">
					<p> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
				</div>
				<div class="caratDesc">
					<p> <%out.println(articolo.getDescrizione());%> </p>
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
		<jsp:include page="PopupAcquisto.html"/>
		<% 
			if(request.getSession().getAttribute("ruolo").equals("guest")){%>
				<jsp:include page="navbarUnlogged.jsp"/>
			<%}else{ %>
				<jsp:include page="navbarLogged.jsp"/>
			<% } %>
		
		<div class="divProdIntero">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img class="immagineProd" src="./gallery/Grafiche/<%=nomeImmagine%>.jpg">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p> <%out.println(articolo.getNome());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(((GraficheBean)articolo).getCategoria());%> </p>		
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
				</div>
				<div style="font-size:1em">
					<p> <%out.println(articolo.getDescrizione());%> </p>
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
		<jsp:include page="PopupAcquisto.html"/>
		
		<% 
			if(request.getSession().getAttribute("ruolo").equals("guest")){%>
				<jsp:include page="navbarUnlogged.jsp"/>
			<%}else{ %>
				<jsp:include page="navbarLogged.jsp"/>
			<% } %>
    	
    	<div class="divProdIntero">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img class="immagineProd" src="./gallery/Modellini/<%=nomeImmagine%>.jpg">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p> <%out.println(articolo.getNome());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(((ModelliniBean)articolo).getCategoria());%> </p>				
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(String.format("%.2f&euro;", articolo.getPrezzo()));%> </p>
				</div>
				<div style="font-size:1em">
					<p> <%out.println(articolo.getDescrizione());%> </p>
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
         		<button class="cartButton">
                	Aggiungi al carrello
                </button>
            </form>
         </div>
       <% } %>
       <hr>
       	<form id="aggiungiRecensioneForm" name="aggiungiRecensione" action="./aggiungiRecensioneServlet?pageLogin=${pageContext.request.servletPath}&id=<%=articolo.getSeriale()%>&categoriaProdotto=<%=articolo.getMacroCategoria()%>" method="post">
       		<div class="form-group" style="width:60%; margin:0 30% 5% 10%">
       			<div class="recensioneLabelStars">
       	    		<label class="labelRecensione" for="exampleFormControlTextarea1"><strong>Lascia una recensione</strong></label>
       				<div class="star_rating" style="margin:0 5%">
  						<button type="button" class="star">&#9734;</button>
  						<button type="button" class="star">&#9734;</button>
  						<button type="button" class="star">&#9734;</button>
  						<button type="button" class="star">&#9734;</button>
  						<button type="button" class="star">&#9734;</button>
  						<input type="hidden" name="punteggioFormRecensione">
					</div>
					<script src="https://kit.fontawesome.com/5ea815c1d0.js"></script>
				</div>
    			<textarea name="testoRecensione" class="form-control" id="exampleFormControlTextarea1" rows="3" minlength="50" maxlength="5000" required></textarea>
    			<button class="inviaRecensione">Invia</button>
  			</div>
  		</form>
  		
  		<div id="divRecensioneUtenteContainer" style="margin:0 30% 5% 10%">
	  		<label style="font-size:120%; padding-top:1%" for="recensioneUtenteContainer"><strong>La tua recensione</strong></label>
	  		<button id="modificaRecensioneBtn">Modifica recensione</button>
	  		<div id="recensioneUtenteContainer"></div>
  		</div>
  		
  		<form id="formRetrieveRecensioni" >
  			<label for="reviewsFilter">Filtra per:</label>
  			<select name="punteggioSelected" id="selectPunteggio">
  				<option value="1">1 stella</option>
  				<option value="2">2 stelle</option>
  				<option value="3">3 stelle</option>
  				<option value="4">4 stelle</option>
  				<option value="5">5 stelle</option>
  				<option value="9" selected="selected">Tutte</option>
  			</select>
  		</form>
  		
  		<div id="recensioniContainer"></div>
  		      
        <jsp:include page="footer.jsp"/>
        
        <script>
        var current_star_level;
        function inviaJson(e){
        	//e.preventDefault();
      
        var prodotto = {
        		seriale: <%=articolo.getSeriale()%>,
        		categoria: '<%=articolo.getMacroCategoria()%>',
        		punteggio: $('#selectPunteggio').val()
        }
        
        $.ajax({
            url: "FiltraRecensioni",
            type: "POST",
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(prodotto),
            success: function(data){	
            	generaRecensioni(data);
            },
            
            cache: false,
            async: true,
            processData:false,
            
            error: function(){
                alert("error");
            }           
        })
    };
    
    $('#selectPunteggio').on('change',function(e) { inviaJson(e); });
    $(document).ready(function(e) { inviaJson(e); });
    var utente = <%=utenteJson%>;
        function generaRecensioni(jsonData){
        	var prodJson = JSON.stringify(jsonData);
     	
        	const boxes = document.querySelectorAll('.recensioniProdotto');
        	boxes.forEach(box => {
        	  box.remove();
        	});
        	
        	var container = $("#recensioniContainer");
        	var recensioneUtenteContainer = $("#recensioneUtenteContainer");  
        	
        	if($('#recensioneUtenteContainer').children().length == 0){
    			$('#divRecensioneUtenteContainer').hide();	
    		}
    		
        	for(var i = 0, k = jsonData.length; i < k; i++){
        		
        		var recensione = $(document.createElement('div')),
        		recensioneDiv = $(document.createElement('div')),
        		header = $(document.createElement('div')),
        		nomeUtenteContainer = $(document.createElement('p')),
        		nomeUtente = $(document.createElement('strong')),
        		valutazione = $(document.createElement('div')),
        		s1 = $(document.createElement('p')),
        		s2 = $(document.createElement('p')),
        		s3 = $(document.createElement('p')),
       			s4 = $(document.createElement('p')),
  			    s5 = $(document.createElement('p')),
        		testo = $(document.createElement('p'));
        		
        		if(jsonData[i]){
        			if((utente != null && jsonData[i].username != utente.username) || utente == null ){
        				
			       		recensione.attr('class', 'recensioniProdotto');
			       		header.attr('class', 'headerRecensione');
			       		valutazione.attr('class', 'star_ratingP');
			       		s1.attr('class', 'starP');
			       		s2.attr('class', 'starP');
			       		s3.attr('class', 'starP');
			       		s4.attr('class', 'starP');
			       		s5.attr('class', 'starP');
			       		recensioneDiv.attr("class", "divInnerRecensione");
			       		
			       		recensioneDiv.appendTo(recensione);
		        		header.appendTo(recensioneDiv);
		        		nomeUtenteContainer.appendTo(header);
		        		nomeUtente.text(jsonData[i].username || "").appendTo(nomeUtenteContainer);
		        		valutazione.appendTo(header);
		        		s1.text("").appendTo(valutazione);
		        		s2.text("").appendTo(valutazione);
		        		s3.text("").appendTo(valutazione);
		        		s4.text("").appendTo(valutazione);
		        		s5.text("").appendTo(valutazione);
		        		testo.text(jsonData[i].testo || "").appendTo(recensioneDiv);
		        		container.append(recensione);
		        		  
		        		var el = [s1, s2, s3, s4, s5];
		        		
		        		for(var j = 0; j < el.length; j++){
		        			if(j < jsonData[i].punteggio){
		        				el[j][0].innerHTML='&#9733';
		        			}else{
		        				el[j][0].innerHTML='&#9734';
		        			}
	        			}
        			}else{
	        			if($('#recensioneUtenteContainer').children().length == 0){
	        				$('#divRecensioneUtenteContainer').show();
				       		recensione.attr('class', 'recensioneProdottoUtente');
				       		header.attr('class', 'headerRecensione');
				       		valutazione.attr('class', 'star_ratingP');
				       		s1.attr('class', 'starPUtente');
				       		s2.attr('class', 'starPUtente');
				       		s3.attr('class', 'starPUtente');
				       		s4.attr('class', 'starPUtente');
				       		s5.attr('class', 'starPUtente');
				       		testo.attr('id', 'testoRecensione');
				       		recensioneDiv.attr("class", "divInnerRecensione");
			
				       		recensioneDiv.appendTo(recensione);
			        		header.appendTo(recensioneDiv);
			        		nomeUtenteContainer.appendTo(header);
			        		nomeUtente.text(jsonData[i].username || "").appendTo(nomeUtenteContainer);
			        		valutazione.appendTo(header);
			        		s1.text("").appendTo(valutazione);
			        		s2.text("").appendTo(valutazione);
			        		s3.text("").appendTo(valutazione);
			        		s4.text("").appendTo(valutazione);
			        		s5.text("").appendTo(valutazione);
			        		testo.text(jsonData[i].testo || "").appendTo(recensioneDiv);
			        		recensioneUtenteContainer.append(recensione);
			        		  
			        		var el = [s1, s2, s3, s4, s5];
			        		
			        		for(var j = 0; j < el.length; j++){
			        			if(j < jsonData[i].punteggio){
			        				el[j][0].innerHTML='&#9733';
			        			}else{
			        				el[j][0].innerHTML='&#9734';
			        			}
	        				}
			        		$('#aggiungiRecensioneForm').remove();
        				}
        			}
        		}else{
        			console.log("Not defined");
        		}
        	}	
       }
        
        </script>
       
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
	   $('#modificaRecensioneBtn').on('click', function(e){
			var testoRecensioneUtente = document.getElementById('testoRecensione');
			tempText = testoRecensioneUtente.textContent;
			const textarea = Object.assign(document.createElement('textarea'));
			
			
			var els = document.querySelectorAll('.starPUtente'),
			  		n;
			
			for (n = 0; n < els.length; n++) {
				var stella = Object.assign(document.createElement('button'), {
					  className: 'star',
					  type: 'button',
					  innerHTML: '&#9734;'
					})
			    els[n].replaceWith(stella);
			    console.log(els[n]);
			}
			
			testoRecensioneUtente.replaceWith(textarea);
			textarea.textContent = tempText;
			textarea.setAttribute('cols', '85%');
			textarea.setAttribute('width', '100%');
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
   
   <script>
  	
   		$('#modificaRecensioneBtn').on('click',function(e) { clickStars(e); });
   		$(document).ready(function(e) { clickStars(e); });
   		
   		function clickStars(){
		   const allStars = document.querySelectorAll('.star');
			let punteggio;
		   	allStars.forEach((star, i) =>{
		       star.onclick = function(){
		           current_star_level = i+1;
		           console.log(current_star_level);
		           allStars.forEach((star, j) => {
		               if(current_star_level >= j+1){
		                   star.innerHTML = '&#9733';
		               }else {
		                   star.innerHTML = '&#9734';
		               }
		           })
		           document.forms["aggiungiRecensione"].elements["punteggioFormRecensione"].value = current_star_level;
		       }
		   })
		  
		   
		   return current_star_level;
	   }
   </script>
</body>
</html>