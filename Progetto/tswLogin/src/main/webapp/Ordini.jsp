<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.Ordine"%>
    <%@page import="Model.OrdineModel"%>
    <%@page import="Model.UserBean" %>
    <%@page import="Model.ProdottoInCarrello" %>
    <%@page import="java.util.ArrayList"%>
<!DOCTYPE html>

	<%
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");;
		if(utente == null){
			request.getSession().setAttribute("ruolo", "guest");
			response.sendRedirect("home.jsp");
			return;
		}
		if(!utente.getRuolo().equals("admin"))
		{
			//out.println(utente);
			response.sendRedirect("home.jsp");
			return;
		} %>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<link rel="stylesheet" href="website.css">
<link rel="shortcut icon" type="image/png" href="beep beep.png">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">



<title>Ordini</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
		
	<form id="ordersFilterForm" method="post">
		<div class="formFilter">
			<h1>Filtra per:</h1><br>
			<label for="username">Username</label><br>
			<input type="text" placeholder="Username" name="username" id="username"><br><br>
			
			<label for="date">Data</label><br>
			<input type="date" name="date" id="date"><br><br>
			
			<label for="datefilter">Range data</label><br>
			<input type="text" name="datefilter" value="" id="datefilter"/><br><br>
			
			<label for="seriale">Seriale prodotto</label><br>
			<input type="text" placeholder="Seriale prodotto" name="seriale" id="seriale"><br><br>
			
			<button class="inviaFiltro">Filtra</button>
		</div>
	</form>
    <jsp:include page="footer.jsp"/>
    		
	<script >
	$('input[name="date"]').on("change", function(e){
		$('input[name="datefilter"]').val('');
	 });

	$(function() {

	  $('input[name="datefilter"]').daterangepicker({
	      autoUpdateInput: false,
	      locale: {
	          cancelLabel: 'Clear'
	      }
	  
	  });
	  
	  $('input[name="datefilter"]').on('apply.daterangepicker', function(ev, picker) {
	      $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
	      $('input[name="date"]').val('');
	  });
	
	  $('input[name="datefilter"]').on('cancel.daterangepicker', function(ev, picker) {
	      $(this).val('');
	      $('input[name="date"]').val('');
	  });
	
	});
	
	 
</script>

<script>
	$('#ordersFilterForm').on('submit', function(e){
		   e.preventDefault();
	
	   $.ajax({
	 	  type: "POST",
	       url:"FiltraOrdiniAdmin",
	       data: $(ordersFilterForm).serialize(),
	       cache: false,
	       success: function (data) {
	          console.log(data);
	          },
	       error: function(){
               alert("error");
           } 
	      });
	   return;
	    });
</script>
	
</body>
</html>