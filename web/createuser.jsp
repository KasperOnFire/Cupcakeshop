<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/favicon.png">

        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" type="text/css" href="css/loginbox.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">

        <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

    </head>

    <body>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
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
                            <li class="active"><a href="createuser.jsp">Register</a></li>
                            </c:otherwise>
                        </c:choose>
                </ul>
            </div>
        </nav>
        <div class="main-div">
            
            <form action="createuser" method="post">
                <div class="container">
                    <div class="row main">
                        <div class="panel-heading">
                            <div class="panel-title text-center">
                                <h1 class="title">Cupcake Heaven</h1>
                                <hr />
                            </div>
                        </div> 
                        <div class="main-login main-center">
                                <div class="form-group">
                                    <label for="username" class="cols-sm-2 control-label">Username</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                            <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="password" class="cols-sm-2 control-label">Password</label>
                                    <div class="cols-sm-10">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                            <input type="password" class="form-control" name="password" id="password"  placeholder="Enter your Password"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group ">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block login-button">Register</button>
                                </div>
                                <div class="login-register">
                                    <a href="login.jsp">Login</a>
                                </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>


