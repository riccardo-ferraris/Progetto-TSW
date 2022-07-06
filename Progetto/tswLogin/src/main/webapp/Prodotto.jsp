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
         	<form action="./ServletCarrello?page=Prodotto.jsp&seriale=<%=articolo.getSeriale()%>&macroCategoria=<%=articolo.getMacroCategoria()%>&action=aggiungi" method="post">
         		<input type="number" value="1" min="1" max="<%=articolo.getQuantità()%>" name="numAggiungi" id="quantità"/>
         		<button type="submit" class="cartButton">
                	Aggiungi al carrello
                </button>
            </form>
         </div>
       <% } %>
       <hr>
       	<form>
       		<div class="form-group" style="width:60%; margin:0 30% 5% 10%">
       			<div style="display:flex">
       	    		<label style="font-size:110%" for="exampleFormControlTextarea1"><strong>Lascia una recensione</strong></label>
       				<div class="star-wrapper" style="margin:0 5%">
  						<a href="#" class="fas fa-star s1"></a>
  						<a href="#" class="fas fa-star s2"></a>
  						<a href="#" class="fas fa-star s3"></a>
  						<a href="#" class="fas fa-star s4"></a>
  						<a href="#" class="fas fa-star s5"></a>
					</div>
					<script src="https://kit.fontawesome.com/5ea815c1d0.js"></script>
				</div>
    			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  			</div>
  		</form>
  		
  		<form id="formRetrieveRecensioni" method="get">
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
  		
  		<div id="recensioniContainer">
  			<div class="recensioniProdotto">
  				<div style="display:flex">
  					<p><strong>Nome Utente</strong></p>
  					<div class="star-wrapper" style="margin:0 5%">
  						<p class="fas fa-star s1"></p>
  						<p class="fas fa-star s2"></p>
  						<p class="fas fa-star s3"></p>
  						<p class="fas fa-star s4"></p>
  						<p class="fas fa-star s5"></p>
					</div>
  				</div>
  				<p>Recensione ahàflkjawjejhkjnsg,amnlsakjljflkenm,ab,fjsldkaksjdlkasnf,baskfjakJBF,</p>
  			</div>
  		</div>      
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
            	//alert(JSON.stringify(data));
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
        		      nomeUtente = $(document.createElement('p')),
        		      valutazione = $(document.createElement('div')),
        		      s1 = $(document.createElement('p')),
        		      s2 = $(document.createElement('p')),
        		      s3 = $(document.createElement('p')),
        		      s4 = $(document.createElement('p')),
        		      s5 = $(document.createElement('p')),
        		      testo = $(document.createElement('p'));

        		  // add id to event wrapper, if undefined generate random ID to avoid conflicts
        		  recensione.attr('id', 'recensione_' || Math.floor(Math.random()*100));
        		  header.attr('class', 'recensioniProdotto');
        		  s1.attr('class', 'fas fa-star s1');
        		  s2.attr('class', 'fas fa-star s2');
        		  s3.attr('class', 'fas fa-star s3');
        		  s4.attr('class', 'fas fa-star s4');
        		  s5.attr('class', 'fas fa-star s5');

        		  // add each item, if undefined then insert empty text
        		  header.appendTo(recensione);
        		  nomeUtente.text(jsonData[i].username || "").appendTo(header);
        		  valutazione.appendTo(header);
        		  s1.appendTo(valutazione);
        		  s2.appendTo(valutazione);
        		  s3.appendTo(valutazione);
        		  s4.appendTo(valutazione);
        		  s5.appendTo(valutazione);
        		  testo.text(jsonData[i].testo || "").appendTo(header);
				  	
        		  // append & appendTo do exactly the same thing, markup preference
        		  container.append(recensione);
        		}
        }
        
        </script>
        
</body>
</html>