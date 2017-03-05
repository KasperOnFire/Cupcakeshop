<%-- 
    Document   : shop
    Created on : 03-03-2017, 09:09:05
    Author     : brein
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
     <head>
        <title>Shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/favicon.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/main.css">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active"><a href="shop">Shop</a></li>
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
            <h1>Hello World!</h1>
            <form action="shop" method="post">
                <input type="hidden" name="addToBasket" value="addToBasket">
                <select name="bottom">

                    <c:forEach items="${bottoms}" var="bottom">
                        <option value="${bottom.getBottom()}">${bottom.getBottom()} - ${bottom.getPrice()}</option>
                    </c:forEach>
                    <option value="getvaluefromelement">name price</option>
                </select>
                <select name="topping">
                    <c:forEach items="${toppings}" var="topping">
                        <option value="${topping.getTop()}">${topping.getTop()} - ${topping.getPrice()}</option>
                    </c:forEach>
                </select>
                <input type="submit" name="add" value="add">
            </form>
        </div>
    </body>
</html>
