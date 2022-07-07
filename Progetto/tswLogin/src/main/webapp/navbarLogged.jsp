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
	<title>Navbar Logged</title>
</head>
<body>
	<%
		UserBean utente = ((UserBean)request.getSession().getAttribute("utente"));
	%>
	<nav id="mainNav">
	<form action="./RedirectServlet?page=catalogo" method="POST">
        <ul id="menuList">
        	<li class="dropdownMenu"><button class="catalogoBtn">CATALOGO</button>
        		<ul style="display:inline-flex">
        			<li><a href="#fumetti">FUMETTI</a></li>
            		<li><a href="#grafiche">GRAFICHE</a></li>
            		<li><a href="#modellini">MODELLINI</a></li>
        		</ul>
        	</li>  
        </ul>
    </form>
        
        <ul id="menuList2">
            <li><a href="./carrello.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              </svg></a></li>
            <li>
            
            	<form method="get" action="./SearchServlet?pageLogout=">
            		<input type="text" placeholder="Cerca" id="search" name="keyWord" style="border-radius: 20px;">
            	</form>
            </li>

            <li><a href="/partnership">PARTNERSHIP</a></li>
            <li><a href="./paginaUtente.jsp"><%=utente.getUsername().toUpperCase()%></a></li>
            <li>
            	<form action="./LogoutServlet?pageLogout=${pageContext.request.servletPath}" method="post">
            		<button class="logoutButton" href="#">
            			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
            			<path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
            			</svg>
            		</button>
            	</form>
            </li>
        </ul>
    </nav>

</body>
</html>