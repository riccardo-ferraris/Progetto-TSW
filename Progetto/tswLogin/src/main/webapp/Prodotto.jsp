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
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
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

		if(articolo.getQuantit�()>0)
        {
         %>
         <div class="aggiungiCarrello">
         	<label for="quantit�"> Quantit�: </label>
         	<form action="./ServletCarrello?page=Prodotto.jsp&seriale=<%=articolo.getSeriale()%>&macroCategoria=<%=articolo.getMacroCategoria()%>&action=aggiungi" method="post">
         		<input type="number" value="1" min="1" max="<%=articolo.getQuantit�()%>" name="numAggiungi" id="quantit�"/>
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
       	    		<label style="font-size:110%; padding-top:1%" for="exampleFormControlTextarea1"><strong>Lascia una recensione</strong></label>
       				<div class="star_rating" style="margin:0 5%">
  						<button class="star">&#9734;</button>
  						<button class="star">&#9734;</button>
  						<button class="star">&#9734;</button>
  						<button class="star">&#9734;</button>
  						<button class="star">&#9734;</button>
					</div>
				</div>
    			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  			</div>
  		</form>
  		
  		<form style="margin-left:5%">
  			<label for="reviewsFilter">Filtra per:</label>
  			<select>
  				<option>1 stella</option>
  				<option>2 stelle</option>
  				<option>3 stelle</option>
  				<option>4 stelle</option>
  				<option>5 stelle</option>
  			</select>
  		</form>
  		<div class="recensioniProdotto">
  			<div style="display:flex">
  				<p style="padding-top:1%"><strong>Nome Utente</strong></p>
  				<div class="star_rating" style="margin:0 5%">
  					<button class="star">&#9734;</button>
  					<button class="star">&#9734;</button>
  					<button class="star">&#9734;</button>
  					<button class="star">&#9734;</button>
  					<button class="star">&#9734;</button>
				</div>
  			</div>
  			<p>Recensione ah�flkjawjejhkjnsg,amnlsakjljflkenm,ab,fjsldkaksjdlkasnf,baskfjakJBF,</p>
  		</div>
  		<p><%RecensioneModel mod = new RecensioneModel();
  		out.println(mod.doRetrieveBySerialeAndPunteggio(300000000000013L, 5).toString()); //bisogna filtrare le recensioni con ajax in base al punteggio
  		%></p>
        <jsp:include page="footer.jsp"/>
        
        
        <script>
        const allStars = document.querySelectorAll('.star');

        allStars.forEach((star, i) =>{
            star.onclick = function(){
                let current_star_level = i+1;
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
</body>
</html>