<%-- 
    Document   : basket
    Created on : 02-03-2017, 14:57:19
    Author     : brein
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My basket</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/favicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
    </head>
    <body>
        <!--navbar here -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="shop">Shop</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                        <c:when test="${loggedIn == true}">
                            <li class="active"><a href="basket">Basket <c:if test="${basket != null}">(${basket.size()})</c:if></a></li>
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
            <h1>Cupcakeshop</h1>
            <h2>Your basket</h2>
            <table border="2" class="table">
                <tr>
                    <th>Bottom</th>
                    <th>Topping</th>
                    <th>Amount</th>
                    <th>Price</th>
                </tr>
                <!-- foreach here -->
                <c:forEach items="${basket}" var="cupcake">
                    <tr>
                        <td>${cupcake.getBottom()}</td>
                        <td>${cupcake.getTopping()}</td>
                        <td>${cupcake.getAmount()}</td>
                        <td>${cupcake.getPrice()}</td>
                    </tr>
                </c:forEach>
                <!-- end foreach -->
            </table>
            <form action="basket" method="get">
                <input type="hidden" value="true" name="order">
                <input class="btn btn-primary" type="submit" value="Order"/>
                <h3>Total price:</h3>
                <h3 id="totalPrice">${totalPrice},-</h3>
            </form>
        </div>
    </body>
</html>
