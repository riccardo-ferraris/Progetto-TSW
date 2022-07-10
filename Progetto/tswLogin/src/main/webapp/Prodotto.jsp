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
		
		
		<div style="display:flex; width:100%; align-items:center">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", "");%>
			
			<div class="imgProdotto">
				<img src="./gallery/Fumetti/<%=nomeImmagine%>.jpg" style="width:50%; margin:10% 25%">
			</div>
			<div class="caratteristicheProd">
				<div style="font-weight:bold; font-size:2em">
					<p> <%out.println(articolo.getNome());%> </p>
				</div>
				<div style="font-size:1.5em">
					<p> <%out.println(((FumettiBean)articolo).getCategoria());%> </p>
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
		
		<div style="display:flex">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img src="./gallery/Grafiche/<%=nomeImmagine%>.jpg" style="width:60%; margin:10%">
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
    	
    	<div style="display:flex">
			<% nomeImmagine = articolo.getNome().replace(":", "").replace("/", ""); %>
			<div class="imgProdotto">
				<img src="./gallery/Modellini/<%=nomeImmagine%>.jpg" style="width:60%; margin:10%">
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
       	<form action="./aggiungiRecensioneServlet?pageLogin=${pageContext.request.servletPath}?id=<%=articolo.getSeriale()%>" method="post">
       		<div class="form-group" style="width:60%; margin:0 30% 5% 10%">
       			<div style="display:flex">
       	    		<label style="font-size:110%; padding-top:1%" for="exampleFormControlTextarea1"><strong>Lascia una recensione</strong></label>
       				<div class="star_rating" style="margin:0 5%">
  						<button value="1" name="punteggioFormRecensione" type="button" class="star">&#9734;</button>
  						<button value="2" name="punteggioFormRecensione" type="button" class="star">&#9734;</button>
  						<button value="3" name="punteggioFormRecensione" type="button" class="star">&#9734;</button>
  						<button value="4" name="punteggioFormRecensione" type="button" class="star">&#9734;</button>
  						<button value="5" name="punteggioFormRecensione" type="button" class="star">&#9734;</button>
					</div>
					<script src="https://kit.fontawesome.com/5ea815c1d0.js"></script>
				</div>
    			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
    			<button>Invia</button>
  			</div>
  		</form>
  		
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

        function generaRecensioni(jsonData){
        	var prodJson = JSON.stringify(jsonData);
     	
        	const boxes = document.querySelectorAll('.recensioniProdotto');
        	boxes.forEach(box => {
        	  box.remove();
        	});
        	
        	var container = $("#recensioniContainer");
        	
        	for(var i = 0, k = prodJson.length; i < k; i++){
        		var recensione = $(document.createElement('div')),
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

	       		recensione.attr('class', 'recensioniProdotto');
	       		header.attr('class', 'headerRecensione');
	       		valutazione.attr('class', 'star_ratingP');
	       		s1.attr('class', 'starP');
	       		s2.attr('class', 'starP');
	       		s3.attr('class', 'starP');
	       		s4.attr('class', 'starP');
	       		s5.attr('class', 'starP');

        		header.appendTo(recensione);
        		nomeUtenteContainer.appendTo(header);
        		nomeUtente.text(jsonData[i].username || "").appendTo(nomeUtenteContainer);
        		valutazione.appendTo(header);
        		s1.text("").appendTo(valutazione);
        		s2.text("").appendTo(valutazione);
        		s3.text("").appendTo(valutazione);
        		s4.text("").appendTo(valutazione);
        		s5.text("").appendTo(valutazione);
        		testo.text(jsonData[i].testo || "").appendTo(recensione);
        		container.append(recensione);
        		  
        		var el = [s1, s2, s3, s4, s5];
        		
        		for(var j = 0; j < el.length; j++){
        			if(j < jsonData[i].punteggio){
        				el[j][0].innerHTML='&#9733';
        			}else{
        				el[j][0].innerHTML='&#9734';
        			}
        		}
        	}
        }
  
        const allStars = document.querySelectorAll('.star');
		let punteggio;
        allStars.forEach((star, i) =>{
            star.onclick = function(){
                let current_star_level = i+1;
                console.log(current_star_level);
                allStars.forEach((star, j) => {
                    if(current_star_level >= j+1){
                        star.innerHTML = '&#9733';
                    }else {
                        star.innerHTML = '&#9734';
                    }
                })
            }
        })
        
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
   </script>
</body>
</html>