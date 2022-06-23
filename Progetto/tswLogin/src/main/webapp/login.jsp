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
	<jsp:include page="navbarUnlogged.jsp"/>
    
	<%String pageRedirect = request.getParameter("pageLogin");%>
    <form action="./LoginServlet?pageLogin=<%=pageRedirect%>" method="post" class="loginForm">
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
            <a href="register.jsp">Registrati</a>
            <button>Login</button>
        </div>
    </form>

    <jsp:include page="footer.jsp"/>

</body>

</html>