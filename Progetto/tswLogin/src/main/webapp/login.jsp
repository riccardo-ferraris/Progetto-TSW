<!DOCTYPE html>
<html lang="it">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="website.css">
    <link rel="shortcut icon" type="image/png" href="beep beep.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <title>Login</title>
</head>

<body>
    <jsp:include page="header.jsp"/>

    <nav id="mainNav">
        <ul id="menuList">
            <li><a href="/fumetti">FUMETTI</a></li>
            <li><a href="/grafiche">GRAFICHE</a></li>
            <li><a href="/modellini">MODELLINI</a></li>
        </ul>
        <ul id="menuList2">
            <li><a href="/carrello"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
              </svg></a></li>
            <li><input type="text" placeholder="Cerca" id="search" style="border-radius: 20px;"></li>
            <li><a href="/partnership">PARTNERSHIP</a></li>
            <li><a href="login.jsp">LOGIN</a></li>
            <li><a href="register.jsp">REGISTRATI</a></li>
        </ul>
    </nav>

    <form action="./LoginServlet" method="post" class="loginForm">
        <h1 id="accedi">Accedi</h1>
        <div class="content">
            <div class="input-field">
                <input type="text" placeholder="Username" id="username" name="username">
            </div>
            <div class="input-field">
                <input type="password" placeholder="Password" id="password" name="password">
            </div>
        </div>
        <a href="" class="link">Hai dimenticato la password?</a>
        <br><br>
        <div class="action">
            <button>Registrati</button>
            <button>Login</button>
        </div>
    </form>

    <jsp:include page="footer.jsp"/>

</body>

</html>