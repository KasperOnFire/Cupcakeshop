<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li><a href="basket">Basket</a></li>
                            <li class="active"><a href="account">Account</a></li>
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
            <h2>Your orders</h2>
            <table border="2" class="table">
                <tr>
                    <th>Order no.</th>
                    <th>Bottom</th>
                    <th>Topping</th>
                    <th>Amount</th>
                    <th>Price</th>
                    <th>Order Price</th>
                </tr>
                <!-- foreach here -->
                <c:forEach items="${orders}" var="order">
                    <tr>
                        <td value="${order.getOno()}">${order.getOno()}</td>
                        <td value="${order.getBottom()}">${order.getBottom()}</td>
                        <td value="${order.getTopping()}">${order.getTopping()}</td>
                        <td value="${order.getAmount()}">${order.getAmount()}</td>
                        <td value="${order.getPrice()}">${order.getPrice()}</td>'
                        <td value="${order.getTotalPrice()}"></td>
                    </tr>
                </c:forEach>
                <!-- end foreach -->
            </table>
        </div>
    </body>
</html>
