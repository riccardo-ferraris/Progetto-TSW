<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="Model.UserBean" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <title>Navbar Logged</title>
</head>

<body>
<%
		UserBean utente = ((UserBean)request.getSession().getAttribute("utente"));
	if(utente == null){
		response.sendRedirect("login.jsp");
		return;
	}
	%>
    <header>
        <nav class="navbar">
            <ul  style="margin-bottom: 0;">
                <li class="has-children">
                <form action="./RedirectServlet?page=catalogo" method="POST">
	                <button style="margin-bottom: auto;">CATALOGO<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
	                    <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
	                  </svg></button>
                </form>
                    <ul class="sub-menu">
                        <li><a href="#fumetti">FUMETTI</a></li>
                        <li><a href="#grafiche">GRAFICHE</a></li>
						<li><a href="#modellini">MODELLINI</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="./carrello.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                            fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                            <path
                                d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
                        </svg></a>
                </li>
                <li class="nav-item">
                    <form method="get" action="./SearchServlet?pageLogout=">
                        <input type="text" placeholder="Cerca" id="search" name="keyWord" style="border-radius: 20px;">
                    </form>
                </li>
                <li class="nav-item"><a href="./paginaUtente.jsp"><%=utente.getUsername().toUpperCase()%></a></li>
                <li class="nav-item">
                    <form action="./LogoutServlet?pageLogout=${pageContext.request.servletPath}" method="post">
                        <button class="logoutButton" href="#">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z" />
                                <path fill-rule="evenodd"
                                    d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                            </svg>
                        </button>
                    </form>
                </li>
            </ul>
            <div class="hamburger">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
        </nav>
    </header>

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        header {
            background-color: #2d3b55;
        }

        li {
            list-style: none;
        }

        a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        #search {
            padding: 2%;
            border-width: 2px;
            margin: auto;
            font-size: 20px;
            font-family: Helvetica;
        }

        .logoutButton {
            background-color: unset;
            border: none;
            display: inline-block;
            position: relative;
            color: white;
            text-align: center;
            padding: 16px;
            margin: 2px 2px 2px 2px;
            text-decoration: none;
        }

        .logoutButton:hover {
            background-color: white;
            color: rgba(45, 59, 85);
            transition: background-color 0.5s;
            border-radius: 5px;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 24px;
            position: sticky;
            top: 0px;
            z-index: 1021;
            height: 60px;
        }

        .navbar a, .navbar button {
            position: relative;
            background-color:#2d3b55;
            color: white;
            text-align: center;
            padding: 16px;
            margin: 2px;
            text-decoration: none;
            border:none;
            font-weight:bold;
        }

        .navbar a:hover, .navbar button:hover{
            background-color: white;
            color: rgba(45, 59, 85);
            transition: background-color 0.5s;
            border-radius: 5px;
        }

        .nav-menu {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 30px;
            margin-bottom: 0;
        }

        .nav-link {
            transition: .7s ease;
        }

        .hamburger {
            display: none;
            cursor: pointer;
        }

        .bar {
            display: block;
            width: 25px;
            height: 3px;
            margin: 5px auto;
            -webkit-transition: all .3s ease-in-out;
            transition: all .3s ease-in-out;
            background-color: #fff;
        }

        @media(max-width:900px) {
            .hamburger {
                display: block;
            }

            .hamburger.active .bar:nth-child(2) {
                opacity: 0;
            }

            .hamburger.active .bar:nth-child(1) {
                transform: translateY(8px) rotate(45deg);
            }

            .hamburger.active .bar:nth-child(3) {
                transform: translateY(-8px) rotate(-45deg);
            }

            .nav-menu {
                position: fixed;
                left: -100%;
                top: 133px;
                gap: 0;
                flex-direction: column;
                background-color: #2d3b55;
                width: 100%;
                text-align: center;
                transition: .3s;
            }

            .nav-item {
                margin: 16px 0;
            }

            .nav-menu.active {
                left: 0;
                padding-left: 0;
            }
        }
		
		.sub-menu{
			position:absolute;
			display: block;
			padding:0 0 0 0;
			top:60px;
			left:60px;
			border: 2px solid black;
			border-top:none;
			border-radius:5px;
			background-color: #2d3b55;
			gap: 50px;
			text-align:center;
			visibility:hidden;
			opacity:0;
		}
		
		.sub-menu li{
			height: 60px;
			align-items:center;
			border:1px solid black;
			padding-top:17px;
			/* border-top:none; */
		}
		
		.navbar .has-children:hover .sub-menu{
			transition: .5s;
			visibility: visible;
			opacity: 1;
			top:60px;
		}
    </style>

    <script>
        const hamburger = document.querySelector(".hamburger");
        const navMenu = document.querySelector(".nav-menu");

        hamburger.addEventListener("click", () => {
            hamburger.classList.toggle("active");
            navMenu.classList.toggle("active");
        })

        document.querySelectorAll(".nav-link").forEach(n => n.addEventListener("click", () => {
            hamburger.classList.remove("active");
            navMenu.classList.remove("active");
        }))
    </script>
</body>

</html>