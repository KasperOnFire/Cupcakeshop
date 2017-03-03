<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/favicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
    </head>

    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="shop">Shop</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${loggedIn == true}">
                            <li><a href="basket">Basket</a></li>
                            <li><a href="account">Account</a></li>
                            <li><a href="logout">Logut</a></li>
                            </c:when>
                            <c:otherwise>
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="createuser.jsp">Register</a></li>
                            </c:otherwise>
                        </c:choose>
                </ul>
            </div>
        </nav>
        <div class="main-div">
            <h1>Cupcake Shop!</h1>
        </div>
    </body>

</html>