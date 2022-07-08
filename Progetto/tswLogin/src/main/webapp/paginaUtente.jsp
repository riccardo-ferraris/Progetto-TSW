<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Model.UserBean" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
	<title>Area Utente</title>
</head>
<body>
	    <jsp:include page="header.jsp"/>
	    <%
		UserBean utente = (UserBean) request.getSession().getAttribute("utente");
    
    	if(utente == null || utente.getRuolo() == null)
    	{
    		response.sendRedirect("login.jsp");	
    		return;
    	} %>
		<jsp:include page="navbarLogged.jsp"/>
		
		<div class="areaUtente" id="prova">
			<div class="datiPersonali">
				<h1><strong>Dati Personali</strong></h1><hr>
				<div class="nicknameArea">
				
					
					
					<div class="nickSX">
						<svg class="zds-icon RC794g X9n9TI DlJ4rT _7BKUw3 ka2E9k uMhVZi FxZV-M pVrzNP" style="margin:1% 5% 1% 2%" height="3.5em" width="3.5em" focusable="false" fill="currentColor" viewBox="0 0 24 24" aria-labelledby="avatar-a-1541099" role="img" aria-hidden="false"><title id="avatar-a-1541099">avatar-a</title><path d="M21.645 22.866a28.717 28.717 0 0 0-6.46-7.817c-2.322-1.892-4.048-1.892-6.37 0a28.74 28.74 0 0 0-6.46 7.817.75.75 0 0 0 1.294.76 27.264 27.264 0 0 1 6.113-7.413A3.98 3.98 0 0 1 12 15.125a3.81 3.81 0 0 1 2.236 1.088 27.252 27.252 0 0 1 6.115 7.412.75.75 0 1 0 1.294-.76zM12 12.002A6.01 6.01 0 0 0 18.003 6 6.003 6.003 0 1 0 12 12.002zm0-10.505a4.502 4.502 0 1 1 0 9.005 4.502 4.502 0 0 1 0-9.005z"></path></svg>
						<div class="areaNick">
							<p><strong>Nickname</strong></p>
							<p><%=utente.getUsername() %></p>
						</div>
					</div>
					<div class="nickDX">
						
					</div>
				</div>
				
				<div class="passwordArea">
				
					<div id="passwordModal" class="modalPass modificaPasswordHidden modificaPasswordVisuallyHidden">
					  <div class="password-modal-content">
					    <span class="close">&times;</span>
					    <p>Modifica password</p>
					    <form id="modificaPasswordForm" method="post">
					    	<input type="text" placeholder="Vecchia password" id="oldPasswordModal" name="oldPasswordModal">
					    	<input type="text" placeholder="Nuova password" id="newPasswordModal" name="newPasswordModal">
					    	<input type="text" placeholder="Ripeti nuova password" id="repeatNewPasswordModal" name="repeatNewPasswordModal">
					    	<p style="color:red" id="passErr"></p>
					    	<button>Salva</button>
					    </form>
					  </div>
					</div>
				
					<div class="pwSX">
						<svg class="zds-icon RC794g X9n9TI DlJ4rT _7BKUw3 ka2E9k uMhVZi FxZV-M pVrzNP" style="margin:1% 5% 1% 2%" height="3.5em" width="3.5em" focusable="false" fill="currentColor" viewBox="0 0 24 24" aria-labelledby="lock-closed-1541104" role="img" aria-hidden="false"><title id="lock-closed-1541104">lock-closed</title><path d="M18.75 7.532V6.75a6.75 6.75 0 1 0-13.5 0v.782A2.994 2.994 0 0 0 2.566 10.5V21a3.004 3.004 0 0 0 3 3h12.868a3.004 3.004 0 0 0 3-3V10.5a2.993 2.993 0 0 0-2.684-2.968zM12 1.5c2.9 0 5.25 2.35 5.25 5.25v.75H6.75v-.75C6.75 3.85 9.1 1.5 12 1.5zM19.934 21c-.001.828-.672 1.5-1.5 1.5H5.566c-.828 0-1.499-.672-1.5-1.5V10.5c.001-.828.672-1.5 1.5-1.5H18.434c.828 0 1.5.672 1.5 1.5V21z"></path><path d="M12 11.999a2.616 2.616 0 0 0-.75 5.128v1.623a.75.75 0 1 0 1.5 0v-1.624a2.62 2.62 0 0 0 1.875-2.502A2.625 2.625 0 0 0 12 11.999zm0 3.75a1.125 1.125 0 1 1 0-2.25 1.125 1.125 0 0 1 0 2.25z"></path></svg>						
						<div class="pwNick">
							<p><strong>Password</strong></p>
							<p>*********</p>
						</div>
					</div>
					<div class="pwDX">
						<button id="modificaPassword" style="width:50%; padding:.5em; background-color:#2d3b55; color:white; margin:5% 25%" aria-label="Modifica" class="DJxzzA u9KIT8 uEg2FS U_OhzR ZkIJC- Vn-7c- FCIprz heWLCX JIgPn9 LyRfpJ pxpHHp NN8L-8 K82if3 mVyMPj Md_Vex MfX1a0 jgQosE pVrzNP rA5-nl EKabf7 aX2-iv r9BRio mo6ZnF E6Km4r" type="button" id="edit-details"><svg class="zds-icon RC794g X9n9TI DlJ4rT iXbgaG nXkCf3 DlJ4rT _9l1hln cMfkVL fzejeK" style="margin:1% 2%" height="1em" width="1em" focusable="false" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true"><path d="M23.09 2.543 21.473.92a3.126 3.126 0 0 0-4.413-.01L2.497 15.404a3.12 3.12 0 0 0-.804 1.387L.027 22.957a.76.76 0 0 0 .93.936l6.173-1.64a3.106 3.106 0 0 0 1.391-.799l13.577-13.52c.012-.01.028-.015.04-.026.01-.011.014-.027.025-.038l.917-.913c0-.002.002-.003.003-.004a3.118 3.118 0 0 0 .007-4.41zM7.446 20.373a1.59 1.59 0 0 1-.707.407l-4.896 1.3 1.32-4.889c.073-.267.215-.51.41-.707L16.645 3.472l3.87 3.887L7.446 20.373zM22.005 5.876l-.41.407-3.87-3.886.41-.408c.3-.298.705-.465 1.127-.464.424 0 .831.168 1.13.469l1.617 1.624.003.003c.62.625.617 1.634-.007 2.255z"></path></svg><span class="ovL9Aw RYghuO heWLCX ZkIJC- r9BRio qXofat _7Cm1F9 ka2E9k uMhVZi dgII7d">Modifica</span></button>
					</div>
				</div>
			</div>
			<div>
				<h1><strong>Ordini</strong></h1><hr>
				<div class="orderArea">
					<div class="imgArea">
						<img src="#" alt="immagine">
					</div>
					<div class="infoArea">
						<div class="firstLine">
							<div class="nameArea">
								<p>Nome prodotto</p>
							</div>
							<div class="priceArea">
								<p>Prezzo</p>
							</div>
						</div>
						
						<div class="secondLine">
							<div class="dateArea">
								<p>Data ordine</p>
							</div>
							
							<div class="checkArea">
								<p>Scarica fattura</p>
							</div>
						</div>
					</div>
				
				
				</div>
			</div>
		</div>
			
		<jsp:include page="footer.jsp"/>
		<script>
			var modal = document.getElementById("passwordModal");
			var btn = document.getElementById("modificaPassword");

			var span = document.getElementsByClassName("close")[0];
 
			btn.onclick = function() {
				modal.classList.remove('modificaPasswordHidden');
			    setTimeout(function () {
			    modal.classList.remove('modificaPasswordVisuallyHidden');
			    }, 20);
			}

			span.onclick = function() {
				modal.classList.add('modificaPasswordVisuallyHidden');    
			    modal.addEventListener('transitionend', function(e) {
			      modal.classList.add('modificaPasswordHidden');
			    }, {
			      capture: false,
			      once: true,
			      passive: false
			    });
			}

			window.onclick = function(event) {
		  		if (event.target == modal) {
		  			modal.classList.add('modificaPasswordVisuallyHidden');    
		  			modal.addEventListener('transitionend', function(e) {
		  				modal.classList.add('modificaPasswordHidden');
				    }, {
				      capture: false,
				      once: true,
				      passive: false
				    });
		  		}
			}
		</script>
		
		<script>
       $('#modificaPasswordForm').on('submit', function(e){
    	   e.preventDefault();
    	   var el = document.getElementById("passErr");
    	   
    	   let nuovaPass = $("#newPasswordModal").val()
    	   let ripetiNuovaPass = $("#repeatNewPasswordModal").val()
    	   
    	   if(nuovaPass != ripetiNuovaPass){
    		   el.innerHTML = "Le due password devono coincidere!"
    			   fname.style.borderColor = "red";
    	   }else{
    	   
          $.ajax({
        	  type: "POST",
              url:"ModificaPasswordServlet",
              data: $("#modificaPasswordForm").serialize(),
              cache: false,
              success: function (data) {
                 if(data == 'True'){
                	 document.getElementById("modificaPasswordForm").reset();
                	 el.innerHTML = "";
                	 modal.classList.add('modificaPasswordVisuallyHidden');    
     			     modal.addEventListener('transitionend', function(e) {
     			     modal.classList.add('modificaPasswordHidden');
     			    }, {
     			      capture: false,
     			      once: true,
     			      passive: false
     			    });
                 }else if(data == 'Incorrect'){ 
                     el.innerHTML = "Errore, la vecchia password inserita è errata!";
                 }else{ 
                     el.innerHTML = "Errore di sistema, riprovare";
                 }
              }
             });
    	   }
          return;
           });
   
   </script>
</body>
</html>